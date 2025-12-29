# ElevenLabs audio workflow

Goal
Take a script stored in GitHub and generate a narrated audio file using ElevenLabs.
Save the mp3 to the local media folder so editing and publishing are easy.

Requirements
Self hosted n8n if you want to write to disk.
ElevenLabs API key stored as an n8n credential.

Inputs
episode number
script path in repo
output filename

Outputs
audio file saved to MEDIA_ROOT/audio/processed

Environment decisions
MEDIA_ROOT should match production/media_paths.md

ElevenLabs API
Use the text to speech convert endpoint with xi api key header.

Notes
Keep audio out of GitHub.
Only store scripts and workflow definitions in the repo.
