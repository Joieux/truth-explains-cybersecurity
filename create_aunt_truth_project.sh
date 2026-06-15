#!/bin/bash

PROJECT_ROOT="."

mkdir -p "$PROJECT_ROOT/branding/character_reference"
mkdir -p "$PROJECT_ROOT/branding/style_guides"

mkdir -p "$PROJECT_ROOT/episodes/EP01_What_Cybersecurity_Is"

mkdir -p "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/01_script"
mkdir -p "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/02_beats"
mkdir -p "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/03_prompts"
mkdir -p "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/04_still_images"
mkdir -p "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/05_runway_clips"
mkdir -p "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/06_voiceover"
mkdir -p "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/07_music"
mkdir -p "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/08_sfx"
mkdir -p "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/09_resolve"
mkdir -p "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/10_export"

mkdir -p "$PROJECT_ROOT/assets/music"
mkdir -p "$PROJECT_ROOT/assets/sfx"
mkdir -p "$PROJECT_ROOT/assets/overlays"
mkdir -p "$PROJECT_ROOT/assets/fonts"

mkdir -p "$PROJECT_ROOT/templates"

mkdir -p "$PROJECT_ROOT/studio/workflow"
mkdir -p "$PROJECT_ROOT/studio/automation"
mkdir -p "$PROJECT_ROOT/studio/docs"

touch "$PROJECT_ROOT/studio/workflow/Truth_Explains_Production_Pipeline.md"
touch "$PROJECT_ROOT/studio/docs/naming_conventions.md"

touch "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/README.md"
touch "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/01_script/EP02_script.md"
touch "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/02_beats/EP02_cinematic_beats.md"
touch "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/03_prompts/EP02_still_image_prompts.md"
touch "$PROJECT_ROOT/episodes/EP02_Passwords_and_Password_Managers/03_prompts/EP02_runway_prompts.md"

echo "Truth Explains NEW project structure created successfully."
