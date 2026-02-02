"""Docker integration tests for the chatterbox service.

These tests verify:
- Dockerfile builds successfully
- Container starts and responds to health checks
- API works correctly in containerized environment

Requires Docker to be installed and running.
"""

import json
import os
import subprocess
import time
import urllib.request
import urllib.error

import pytest

IMAGE_NAME = "chatterbox-test"
CONTAINER_NAME = "chatterbox-test-container"
HOST_PORT = 15001  # Use high port to avoid conflicts


def docker_available():
    """Check if Docker is available."""
    try:
        result = subprocess.run(
            ["docker", "info"],
            capture_output=True,
            timeout=10,
        )
        return result.returncode == 0
    except (subprocess.TimeoutExpired, FileNotFoundError):
        return False


@pytest.fixture(scope="module")
def docker_container():
    """Build and run the Docker container for testing."""
    if not docker_available():
        pytest.skip("Docker is not available")

    chatterbox_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

    # Build the image
    build_result = subprocess.run(
        ["docker", "build", "-t", IMAGE_NAME, "."],
        cwd=chatterbox_dir,
        capture_output=True,
        text=True,
        timeout=120,
    )

    if build_result.returncode != 0:
        pytest.fail(f"Docker build failed: {build_result.stderr}")

    # Remove any existing container with same name
    subprocess.run(
        ["docker", "rm", "-f", CONTAINER_NAME],
        capture_output=True,
    )

    # Run the container
    run_result = subprocess.run(
        [
            "docker",
            "run",
            "-d",
            "--name",
            CONTAINER_NAME,
            "-p",
            f"{HOST_PORT}:5001",
            IMAGE_NAME,
        ],
        capture_output=True,
        text=True,
    )

    if run_result.returncode != 0:
        pytest.fail(f"Docker run failed: {run_result.stderr}")

    # Wait for container to be ready
    base_url = f"http://localhost:{HOST_PORT}"
    # Give container time to fully start
    time.sleep(2)

    max_attempts = 30
    for attempt in range(max_attempts):
        try:
            req = urllib.request.Request(
                f"{base_url}/v1/audio/speech",
                data=json.dumps({"input": "test"}).encode(),
                headers={"Content-Type": "application/json"},
                method="POST",
            )
            urllib.request.urlopen(req, timeout=2)
            break
        except (
            urllib.error.URLError,
            ConnectionRefusedError,
            ConnectionResetError,
            OSError,
        ):
            if attempt == max_attempts - 1:
                # Get container logs for debugging
                logs = subprocess.run(
                    ["docker", "logs", CONTAINER_NAME],
                    capture_output=True,
                    text=True,
                )
                pytest.fail(
                    f"Container did not become ready. Logs:\n{logs.stdout}\n{logs.stderr}"
                )
            time.sleep(0.5)

    yield base_url

    # Cleanup
    subprocess.run(["docker", "stop", CONTAINER_NAME], capture_output=True)
    subprocess.run(["docker", "rm", CONTAINER_NAME], capture_output=True)


class TestDockerBuild:
    """Tests for Docker image building."""

    def test_dockerfile_exists(self):
        """Dockerfile exists in chatterbox directory."""
        chatterbox_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        dockerfile = os.path.join(chatterbox_dir, "Dockerfile")
        assert os.path.exists(dockerfile), "Dockerfile not found"

    def test_docker_build_succeeds(self, docker_container):
        """Docker image builds successfully."""
        # If we get here, the fixture already built the image
        assert docker_container is not None


class TestDockerContainer:
    """Tests for running Docker container."""

    def test_container_responds(self, docker_container):
        """Container responds to HTTP requests."""
        req = urllib.request.Request(
            f"{docker_container}/v1/audio/speech",
            data=json.dumps({"input": "hello"}).encode(),
            headers={"Content-Type": "application/json"},
            method="POST",
        )

        with urllib.request.urlopen(req, timeout=10) as response:
            assert response.status == 200

    def test_container_returns_wav(self, docker_container):
        """Container returns valid WAV audio."""
        req = urllib.request.Request(
            f"{docker_container}/v1/audio/speech",
            data=json.dumps({"input": "test audio"}).encode(),
            headers={"Content-Type": "application/json"},
            method="POST",
        )

        with urllib.request.urlopen(req, timeout=10) as response:
            assert response.headers.get("Content-Type") == "audio/wav"
            data = response.read()
            # WAV files start with "RIFF"
            assert data[:4] == b"RIFF", "Response is not valid WAV format"

    def test_container_validates_input(self, docker_container):
        """Container validates missing input."""
        req = urllib.request.Request(
            f"{docker_container}/v1/audio/speech",
            data=json.dumps({}).encode(),
            headers={"Content-Type": "application/json"},
            method="POST",
        )

        try:
            urllib.request.urlopen(req, timeout=10)
            pytest.fail("Expected 400 error for missing input")
        except urllib.error.HTTPError as e:
            assert e.code == 400
            body = json.loads(e.read())
            assert "error" in body
