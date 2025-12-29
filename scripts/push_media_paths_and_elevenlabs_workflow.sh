#!/usr/bin/env bash

set -euo pipefail

OWNER="Joieux"
REPO="truth-explains-cybersecurity"

echo "Creating folders..."
mkdir -p production
mkdir -p n8n/docs
mkdir -p n8n/workflows

touch n8n/.gitkeep
touch n8n/docs/.gitkeep
touch n8n/workflows/.gitkeep

echo "Writing production/media_paths.md..."
cat > production/media_paths.md <<'EOF'
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
EOF

echo "Writing n8n/docs/elevenlabs_audio_workflow.md..."
cat > n8n/docs/elevenlabs_audio_workflow.md <<'EOF'
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
EOF

echo "Writing n8n/workflows/04_generate_elevenlabs_audio_from_script.json..."
cat > n8n/workflows/04_generate_elevenlabs_audio_from_script.json <<EOF
{
  "name": "04 Generate ElevenLabs audio from script",
  "nodes": [
    {
      "parameters": {
        "path": "truth_explains/generate_audio",
        "httpMethod": "POST",
        "responseMode": "onReceived"
      },
      "id": "webhook",
      "name": "Webhook",
      "type": "n8n-nodes-base.webhook",
      "typeVersion": 2,
      "position": [240, 260]
    },
    {
      "parameters": {
        "assignments": {
          "assignments": [
            { "name": "owner", "type": "string", "value": "${OWNER}" },
            { "name": "repo", "type": "string", "value": "${REPO}" },
            { "name": "episode", "type": "string", "value": "={{\$json.body.episode || \"00\"}}" },
            { "name": "script_path", "type": "string", "value": "={{\$json.body.script_path || \"scripts/video_01_what_cybersecurity_is.md\"}}" },
            { "name": "media_root", "type": "string", "value": "={{\$json.body.media_root || \"/Users/YOUR_NAME/Google Drive/truth-explains-media\"}}" },
            { "name": "voice_id", "type": "string", "value": "={{\$json.body.voice_id || \"REPLACE_WITH_ELEVENLABS_VOICE_ID\"}}" },
            { "name": "output_format", "type": "string", "value": "={{\$json.body.output_format || \"mp3_44100_128\"}}" },
            { "name": "model_id", "type": "string", "value": "={{\$json.body.model_id || \"eleven_multilingual_v2\"}}" }
          ]
        }
      },
      "id": "normalize",
      "name": "Normalize input",
      "type": "n8n-nodes-base.set",
      "typeVersion": 2,
      "position": [480, 260]
    },
    {
      "parameters": {
        "resource": "file",
        "operation": "get",
        "owner": "={{\$json.owner}}",
        "repository": "={{\$json.repo}}",
        "filePath": "={{\$json.script_path}}"
      },
      "id": "github_get_file",
      "name": "GitHub get script file",
      "type": "n8n-nodes-base.github",
      "typeVersion": 2,
      "position": [720, 260],
      "credentials": {
        "githubApi": {
          "id": "SELECT_IN_N8N",
          "name": "GitHub API"
        }
      }
    },
    {
      "parameters": {
        "jsCode": "const episode = $node[\"Normalize input\"].json.episode;\\nconst mediaRoot = $node[\"Normalize input\"].json.media_root;\\nconst voiceId = $node[\"Normalize input\"].json.voice_id;\\nconst outputFormat = $node[\"Normalize input\"].json.output_format;\\nconst modelId = $node[\"Normalize input\"].json.model_id;\\n\\nconst file = $node[\"GitHub get script file\"].json;\\nconst raw = file.content || \"\";\\n\\nconst lines = raw.split(/\\r?\\n/);\\nlet startIndex = lines.findIndex(l => l.trim().toLowerCase() === \"script\");\\nlet text = \"\";\\nif (startIndex >= 0) {\\n  text = lines.slice(startIndex + 1).join(\"\\n\").trim();\\n} else {\\n  text = raw.trim();\\n}\\n\\ntext = text.trim();\\n\\nconst safeEpisode = String(episode).padStart(2, \"0\");\\nconst outPath = `${mediaRoot}/audio/processed/video_${safeEpisode}_ai.mp3`;\\n\\nreturn [{\\n  episode: safeEpisode,\\n  voice_id: voiceId,\\n  output_format: outputFormat,\\n  model_id: modelId,\\n  text,\\n  out_path: outPath\\n}];"
      },
      "id": "prep",
      "name": "Prepare ElevenLabs request",
      "type": "n8n-nodes-base.code",
      "typeVersion": 2,
      "position": [960, 260]
    },
    {
      "parameters": {
        "method": "POST",
        "url": "={{\"https://api.elevenlabs.io/v1/text-to-speech/\" + \$json.voice_id + \"?output_format=\" + \$json.output_format}}",
        "authentication": "predefinedCredentialType",
        "nodeCredentialType": "httpHeaderAuth",
        "sendHeaders": true,
        "headerParameters": {
          "parameters": [
            { "name": "Accept", "value": "audio/mpeg" }
          ]
        },
        "sendBody": true,
        "contentType": "json",
        "bodyParametersJson": "={{JSON.stringify({ text: \$json.text, model_id: \$json.model_id, voice_settings: { stability: 0.7, similarity_boost: 0.75, style: 0.08, use_speaker_boost: false } })}}",
        "options": {
          "response": {
            "responseFormat": "file"
          }
        }
      },
      "id": "elevenlabs",
      "name": "ElevenLabs convert",
      "type": "n8n-nodes-base.httpRequest",
      "typeVersion": 4,
      "position": [1200, 260],
      "credentials": {
        "httpHeaderAuth": {
          "id": "SELECT_IN_N8N",
          "name": "ElevenLabs xi api key"
        }
      }
    },
    {
      "parameters": {
        "operation": "write",
        "filePath": "={{\$node[\"Prepare ElevenLabs request\"].json.out_path}}",
        "dataPropertyName": "data"
      },
      "id": "writefile",
      "name": "Write audio to disk",
      "type": "n8n-nodes-base.readWriteFile",
      "typeVersion": 1,
      "position": [1440, 260]
    }
  ],
  "connections": {
    "Webhook": { "main": [[{ "node": "Normalize input", "type": "main", "index": 0 }]] },
    "Normalize input": { "main": [[{ "node": "GitHub get script file", "type": "main", "index": 0 }]] },
    "GitHub get script file": { "main": [[{ "node": "Prepare ElevenLabs request", "type": "main", "index": 0 }]] },
    "Prepare ElevenLabs request": { "main": [[{ "node": "ElevenLabs convert", "type": "main", "index": 0 }]] },
    "ElevenLabs convert": { "main": [[{ "node": "Write audio to disk", "type": "main", "index": 0 }]] }
  },
  "active": false
}
EOF

echo "Staging, committing, and pushing to GitHub..."
git add production/media_paths.md n8n/docs/elevenlabs_audio_workflow.md n8n/workflows/04_generate_elevenlabs_audio_from_script.json n8n/.gitkeep n8n/docs/.gitkeep n8n/workflows/.gitkeep

git commit -m "Add media paths doc and ElevenLabs audio workflow"

git push origin main

echo "Done."
