#!/bin/bash

echo "Checking Truth Explains NEW project structure..."

missing=0

check_path () {
  if [ -e "$1" ]; then
    echo "OK: $1"
  else
    echo "MISSING: $1"
    missing=$((missing+1))
  fi
}

check_path "branding/character_bank.md"
check_path "branding/color_palette.md"
check_path "branding/design_system.md"
check_path "branding/infosec_color_wheel.md"
check_path "branding/color_jacket_prompts.md"
check_path "branding/character_reference"

check_path "episodes/EP02_Passwords_and_Password_Managers/01_script/EP02_script.md"
check_path "episodes/EP02_Passwords_and_Password_Managers/02_beats/EP02_cinematic_beats.md"
check_path "episodes/EP02_Passwords_and_Password_Managers/03_prompts/EP02_still_image_prompts.md"
check_path "episodes/EP02_Passwords_and_Password_Managers/03_prompts/EP02_runway_prompts.md"
check_path "episodes/EP02_Passwords_and_Password_Managers/04_still_images"
check_path "episodes/EP02_Passwords_and_Password_Managers/05_runway_clips"
check_path "episodes/EP02_Passwords_and_Password_Managers/06_voiceover"
check_path "episodes/EP02_Passwords_and_Password_Managers/07_music"
check_path "episodes/EP02_Passwords_and_Password_Managers/08_sfx"
check_path "episodes/EP02_Passwords_and_Password_Managers/09_resolve"
check_path "episodes/EP02_Passwords_and_Password_Managers/10_export"

check_path "studio/workflow/Truth_Explains_Production_Pipeline.md"
check_path "studio/docs/naming_conventions.md"

echo ""
if [ "$missing" -eq 0 ]; then
  echo "Everything is in the right place."
else
  echo "$missing item(s) are missing."
fi
