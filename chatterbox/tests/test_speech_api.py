"""Tests for the /v1/audio/speech endpoint."""

import json
import os
import tempfile
import wave


class TestHealthEndpoint:
    """Tests for the health check endpoint."""

    def test_health_returns_200(self, client):
        """Health endpoint returns 200 OK."""
        response = client.get("/health")
        assert response.status_code == 200

    def test_health_returns_status(self, client):
        """Health endpoint returns status field."""
        response = client.get("/health")
        data = json.loads(response.data)
        assert data["status"] == "healthy"


class TestSpeechEndpoint:
    """Tests for the speech synthesis API endpoint."""

    def test_valid_request_returns_wav_audio(self, client):
        """Valid request with input text returns WAV audio."""
        response = client.post(
            "/v1/audio/speech",
            json={"input": "Hello world"},
        )

        assert response.status_code == 200
        assert response.content_type == "audio/wav"
        assert len(response.data) > 0

    def test_wav_audio_is_valid_format(self, client):
        """Returned audio is valid WAV format with correct parameters."""
        response = client.post(
            "/v1/audio/speech",
            json={"input": "Test audio"},
        )

        # Write to temp file and validate WAV structure
        with tempfile.NamedTemporaryFile(suffix=".wav", delete=False) as f:
            f.write(response.data)
            temp_path = f.name

        try:
            with wave.open(temp_path, "rb") as wf:
                assert wf.getnchannels() == 1  # Mono
                assert wf.getsampwidth() == 2  # 16-bit
                assert wf.getframerate() == 16000  # 16kHz
                assert wf.getnframes() == 16000  # 1 second of audio
        finally:
            os.unlink(temp_path)

    def test_missing_input_returns_400(self, client):
        """Request without input field returns 400 error."""
        response = client.post(
            "/v1/audio/speech",
            json={},
        )

        assert response.status_code == 400
        data = json.loads(response.data)
        assert "error" in data
        assert data["error"] == "missing input"

    def test_empty_input_returns_400(self, client):
        """Request with empty input string returns 400 error."""
        response = client.post(
            "/v1/audio/speech",
            json={"input": ""},
        )

        assert response.status_code == 400
        data = json.loads(response.data)
        assert data["error"] == "missing input"

    def test_whitespace_only_input_returns_400(self, client):
        """Request with whitespace-only input returns 400 error."""
        response = client.post(
            "/v1/audio/speech",
            json={"input": "   "},
        )

        assert response.status_code == 400
        data = json.loads(response.data)
        assert data["error"] == "missing input"

    def test_null_input_returns_400(self, client):
        """Request with null input returns 400 error."""
        response = client.post(
            "/v1/audio/speech",
            json={"input": None},
        )

        assert response.status_code == 400

    def test_no_json_body_returns_400(self, client):
        """Request with no JSON body returns 400 error."""
        response = client.post(
            "/v1/audio/speech",
            data="not json",
            content_type="text/plain",
        )

        assert response.status_code == 400

    def test_voice_parameter_accepted(self, client):
        """Voice parameter is accepted without error."""
        response = client.post(
            "/v1/audio/speech",
            json={"input": "Hello", "voice": "alloy"},
        )

        assert response.status_code == 200


class TestFileOutput:
    """Tests for saving audio to file."""

    def test_output_path_saves_file(self, client):
        """Request with output_path saves audio to file."""
        with tempfile.TemporaryDirectory() as tmpdir:
            output_path = os.path.join(tmpdir, "output.wav")

            response = client.post(
                "/v1/audio/speech",
                json={"input": "Save to file", "output_path": output_path},
            )

            assert response.status_code == 200
            data = json.loads(response.data)
            assert data["success"] is True
            assert data["path"] == output_path
            assert os.path.exists(output_path)

    def test_output_path_creates_directories(self, client):
        """Nested output_path creates parent directories."""
        with tempfile.TemporaryDirectory() as tmpdir:
            output_path = os.path.join(tmpdir, "nested", "dirs", "output.wav")

            response = client.post(
                "/v1/audio/speech",
                json={"input": "Nested save", "output_path": output_path},
            )

            assert response.status_code == 200
            assert os.path.exists(output_path)

    def test_saved_file_is_valid_wav(self, client):
        """Saved file is valid WAV format."""
        with tempfile.TemporaryDirectory() as tmpdir:
            output_path = os.path.join(tmpdir, "output.wav")

            client.post(
                "/v1/audio/speech",
                json={"input": "Valid WAV", "output_path": output_path},
            )

            with wave.open(output_path, "rb") as wf:
                assert wf.getnchannels() == 1
                assert wf.getsampwidth() == 2
                assert wf.getframerate() == 16000

    def test_invalid_output_path_returns_500(self, client):
        """Invalid output_path returns 500 error."""
        # Try to write to a path that will fail (root directory without permissions)
        response = client.post(
            "/v1/audio/speech",
            json={
                "input": "Bad path",
                "output_path": "/nonexistent_root_dir_12345/file.wav",
            },
        )

        assert response.status_code == 500
        data = json.loads(response.data)
        assert "error" in data
