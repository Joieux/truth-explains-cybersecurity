#!/usr/bin/env bash
set -euo pipefail

WEBHOOK_URL="${WEBHOOK_URL:-http://localhost:5679/webhook/truth_explains/generate_audio}"

post() {
  local ep="$1"
  local path="$2"
  curl -sS -X POST "$WEBHOOK_URL" \
    -H "Content-Type: application/json" \
    -d "{\"episode\":\"$ep\",\"script_path\":\"$path\"}" \
    | cat
  echo
}

post "06" "scripts/video_06_public_wifi_and_coffee_shop_traps.md"
post "07" "scripts/video_07_password_managers_for_real.md"
post "08" "scripts/video_08_dm_scams_and_fake_support_accounts.md"
post "09" "scripts/video_09_device_security_like_a_wallet.md"
post "10" "scripts/video_10_starting_cybersecurity_in_30_days.md"

echo "Done. Check /Volumes/T9/truth-explains-media/audio/processed for video_06_ai.mp3 through video_10_ai.mp3"
