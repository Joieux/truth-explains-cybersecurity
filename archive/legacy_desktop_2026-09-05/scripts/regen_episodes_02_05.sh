#!/usr/bin/env bash
set -euo pipefail

BASE_URL="http://localhost:5679/webhook/truth_explains/generate_audio"

curl -X POST "$BASE_URL" -H "Content-Type: application/json" -d '{"episode":"02","script_path":"scripts/video_02_passwords_and_managers.md"}'
curl -X POST "$BASE_URL" -H "Content-Type: application/json" -d '{"episode":"03","script_path":"scripts/video_03_two_factor_authentication.md"}'
curl -X POST "$BASE_URL" -H "Content-Type: application/json" -d '{"episode":"04","script_path":"scripts/video_04_phishing_and_links.md"}'
curl -X POST "$BASE_URL" -H "Content-Type: application/json" -d '{"episode":"05","script_path":"scripts/video_05_updates_and_backups.md"}'

echo "Done. Check: /Volumes/T9/truth-explains-media/audio/processed"
