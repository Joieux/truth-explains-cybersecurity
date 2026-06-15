#!/bin/bash

echo "Creating missing Truth Explains folders and files..."

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
mkdir -p studio/automation
mkdir -p studio/docs

touch studio/workflow/Truth_Explains_Production_Pipeline.md
touch studio/docs/naming_conventions.md

touch episodes/EP02_Passwords_and_Password_Managers/README.md
touch episodes/EP02_Passwords_and_Password_Managers/01_script/EP02_script.md
touch episodes/EP02_Passwords_and_Password_Managers/02_beats/EP02_cinematic_beats.md
touch episodes/EP02_Passwords_and_Password_Managers/03_prompts/EP02_still_image_prompts.md
touch episodes/EP02_Passwords_and_Password_Managers/03_prompts/EP02_runway_prompts.md

echo "Project structure updated."
