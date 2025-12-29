# Media paths for Truth Explains

This repo stores scripts and workflows.
Audio, music, renders live outside GitHub.

Rule
n8n must reference local filesystem paths.

## Choose one media root

Option A
Google Drive desktop sync folder

Example Mac
/Users/YOUR_NAME/Google Drive/truth-explains-media

Example Windows
C:\Users\YOUR_NAME\Google Drive\truth-explains-media

Option B
Server storage

Example
/srv/media/truth-explains-media

## Standard folders under media root

audio raw
MEDIA_ROOT/audio/raw

audio processed
MEDIA_ROOT/audio/processed

music
MEDIA_ROOT/music

renders
MEDIA_ROOT/renders

## Naming standard

AI audio full length
video_XX_title_ai.mp3

Example
video_01_what_cybersecurity_is_ai.mp3

If exporting sections
video_XX_title_section_01_ai.mp3

Example
video_01_what_cybersecurity_is_section_01_ai.mp3

## Notes

Do not commit audio files to GitHub.
Use GitHub for scripts, structure, and workflow JSON only.
