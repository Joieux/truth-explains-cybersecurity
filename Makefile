.PHONY: test test-api test-content test-docker lint build clean help

# Default target
help:
	@echo "Available commands:"
	@echo "  make test         - Run all tests"
	@echo "  make test-api     - Run API tests only"
	@echo "  make test-content - Run content validation tests only"
	@echo "  make test-docker  - Run Docker integration tests"
	@echo "  make lint         - Run shellcheck on scripts"
	@echo "  make build        - Build Docker image"
	@echo "  make run          - Run the app locally"
	@echo "  make clean        - Remove build artifacts"

# Run all tests
test: test-api test-content

# API tests with coverage
test-api:
	cd chatterbox && pytest tests/test_speech_api.py -v --cov=app --cov-report=term-missing

# Content validation tests
test-content:
	pytest tests/test_content_validation.py -v

# Docker integration tests
test-docker:
	cd chatterbox && pytest tests/test_docker.py -v

# Lint shell scripts
lint:
	@if ls scripts/*.sh 1>/dev/null 2>&1; then \
		shellcheck scripts/*.sh && echo "✓ Shell scripts pass"; \
	else \
		echo "No shell scripts found"; \
	fi

# Build Docker image
build:
	cd chatterbox && docker build -t chatterbox .

# Run locally
run:
	cd chatterbox && python app.py

# Clean up
clean:
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name .pytest_cache -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete 2>/dev/null || true
	find . -type f -name ".coverage" -delete 2>/dev/null || true
