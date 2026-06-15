#!/bin/bash

echo "Organizing Truth Explains NEW project..."

DATE_TAG=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_DIR="_archive_review/$DATE_TAG"
LOG_FILE="studio/automation/organize_log_$DATE_TAG.txt"

mkdir -p "$ARCHIVE_DIR"
mkdir -p studio/automation

log() {
  echo "$1"
  echo "$1" >> "$LOG_FILE"
}

safe_move() {
  SOURCE="$1"
  DEST="$2"

  if [ -e "$SOURCE" ]; then
    mkdir -p "$(dirname "$DEST")"

    if [ -e "$DEST" ]; then
      BASENAME=$(basename "$DEST")
      DIRNAME=$(dirname "$DEST")
      EXT="${BASENAME##*.}"
      NAME="${BASENAME%.*}"
      NEW_DEST="$DIRNAME/${NAME}_moved_$DATE_TAG.$EXT"
      mv "$SOURCE" "$NEW_DEST"
      log "Moved duplicate: $SOURCE -> $NEW_DEST"
    else
      mv "$SOURCE" "$DEST"
      log "Moved: $SOURCE -> $DEST"
    fi
  fi
}

mkdir -p branding/character_reference
mkdir -p branding/style_guides

mkdir -p episodes/EP02_Passwords_and_Password_Managers/01_script
mkdir -p episodes/EP02_Passwords_and_Password_Managers/02_beats
mkdir -p episodes/EP02_Passwords_and_Password_Managers/03_prompts
mkdir -p episodes/EP02_Passwords_and_Password_Managers/04_still_images
mkdir -p episodes/EP02_Passwords_and_Password_Managers/05_runway_clips
mkdir -p episodes/EP02_Passwords_and_Password_Managers/06_voiceover
mkdir -p episodes/EP02_Passwords_and_Password_Managers/07_music
mkdir -p episodes/EP02_Passwords_and_Password_Managers/08_sfx
mkdir -p episodes/EP02_Passwords_and_Password_Managers/09_resolve
mkdir -p episodes/EP02_Passwords_and_Password_Managers/10_export

mkdir -p assets/music
mkdir -p assets/sfx
mkdir -p assets/overlays
mkdir -p assets/fonts

mkdir -p templates
mkdir -p studio/workflow
mkdir -p studio/docs
mkdir -p studio/automation

touch studio/workflow/Truth_Explains_Production_Pipeline.md
touch studio/docs/naming_conventions.md

log "Folder structure confirmed."

safe_move "character_bank.md" "branding/character_bank.md"
safe_move "color_jacket_prompts.md" "branding/color_jacket_prompts.md"
safe_move "color_palette.md" "branding/color_palette.md"
safe_move "design_system.md" "branding/design_system.md"
safe_move "infosec_color_wheel.md" "branding/infosec_color_wheel.md"

safe_move "aunt_truth_illustrated_reference_v1.jpg" "branding/character_reference/aunt_truth_illustrated_reference_v1.jpg"
safe_move "auntie_truth_ref_v2(2).jpg" "branding/character_reference/auntie_truth_ref_v2.jpg"
safe_move "auntie_truth_ref_v2.jpg" "branding/character_reference/auntie_truth_ref_v2.jpg"

safe_move "ep02_passwords_key_scene_16x9_final.jpeg" "episodes/EP02_Passwords_and_Password_Managers/04_still_images/scene_01_skeleton_key.jpeg"

safe_move "EP02_script.md" "episodes/EP02_Passwords_and_Password_Managers/01_script/EP02_script.md"
safe_move "EP02_voiceover_script.md" "episodes/EP02_Passwords_and_Password_Managers/01_script/EP02_voiceover_script.md"
safe_move "EP02_cinematic_beats.md" "episodes/EP02_Passwords_and_Password_Managers/02_beats/EP02_cinematic_beats.md"
safe_move "EP02_still_image_prompts.md" "episodes/EP02_Passwords_and_Password_Managers/03_prompts/EP02_still_image_prompts.md"
safe_move "EP02_runway_prompts.md" "episodes/EP02_Passwords_and_Password_Managers/03_prompts/EP02_runway_prompts.md"

find . -maxdepth 1 -type f \( -iname "*ep02*.png" -o -iname "*ep02*.jpg" -o -iname "*ep02*.jpeg" \) -print0 | while IFS= read -r -d '' file; do
  safe_move "$file" "episodes/EP02_Passwords_and_Password_Managers/04_still_images/$(basename "$file")"
done

find . -maxdepth 1 -type f \( -iname "*scene*.png" -o -iname "*scene*.jpg" -o -iname "*scene*.jpeg" \) -print0 | while IFS= read -r -d '' file; do
  safe_move "$file" "episodes/EP02_Passwords_and_Password_Managers/04_still_images/$(basename "$file")"
done

find . -maxdepth 1 -type f \( -iname "*.mp4" -o -iname "*.mov" \) -print0 | while IFS= read -r -d '' file; do
  if [[ "$(basename "$file")" == *EP02* || "$(basename "$file")" == *scene* ]]; then
    safe_move "$file" "episodes/EP02_Passwords_and_Password_Managers/05_runway_clips/$(basename "$file")"
  else
    safe_move "$file" "10_export/$(basename "$file")"
  fi
done

find . -maxdepth 1 -type f \( -iname "*.wav" -o -iname "*.mp3" -o -iname "*.aiff" \) -print0 | while IFS= read -r -d '' file; do
  if [[ "$(basename "$file")" == *VO* || "$(basename "$file")" == *voice* ]]; then
    safe_move "$file" "episodes/EP02_Passwords_and_Password_Managers/06_voiceover/$(basename "$file")"
  elif [[ "$(basename "$file")" == *sfx* || "$(basename "$file")" == *whoosh* || "$(basename "$file")" == *lock* || "$(basename "$file")" == *key* ]]; then
    safe_move "$file" "episodes/EP02_Passwords_and_Password_Managers/08_sfx/$(basename "$file")"
  else
    safe_move "$file" "episodes/EP02_Passwords_and_Password_Managers/07_music/$(basename "$file")"
  fi
done

find . -maxdepth 1 -type f \( -iname "*.drp" -o -iname "*.dra" \) -print0 | while IFS= read -r -d '' file; do
  safe_move "$file" "episodes/EP02_Passwords_and_Password_Managers/09_resolve/$(basename "$file")"
done

for folder in "EP02" "Episode 02" "Episode_02" "passwords" "Passwords" "old" "temp" "test" "New Folder" "untitled folder"; do
  if [ -d "$folder" ]; then
    mv "$folder" "$ARCHIVE_DIR/"
    log "Moved folder for review: $folder -> $ARCHIVE_DIR/"
  fi
done

log "Organization complete."
log "Review archive folder: $ARCHIVE_DIR"
log "Log saved to: $LOG_FILE"
