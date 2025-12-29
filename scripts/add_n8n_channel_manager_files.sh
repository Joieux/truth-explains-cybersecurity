#!/usr/bin/env bash

# Truth Explains
# Adds n8n folder structure + starter workflow and docs files to the repo

set -euo pipefail

OWNER="Joieux"
REPO="truth-explains-cybersecurity"

echo "Creating n8n folders..."
mkdir -p n8n/workflows
mkdir -p n8n/docs

# Ensure git tracks folders
touch n8n/.gitkeep
touch n8n/workflows/.gitkeep
touch n8n/docs/.gitkeep

echo "Writing n8n docs..."
cat > n8n/docs/setup_notes.md <<'EOF'
# n8n setup notes for Truth Explains

Repo
Joieux/truth-explains-cybersecurity

## Credentials to create in n8n

GitHub API
Use a personal access token with repo permissions.

YouTube OAuth2
Connect the YouTube channel you will upload to.

## Import steps

Import each workflow JSON from n8n/workflows.

After import, open each workflow and select:
GitHub credentials on every GitHub node
YouTube credentials on the YouTube node

## Webhook payload examples

Idea to issue
POST to the workflow 01 webhook URL

{
  "title": "Idea: Why password reuse is dangerous",
  "core_question": "Why is reusing passwords so risky",
  "core_truth": "One breach can unlock many accounts because attackers automate retries",
  "why_matters": "Beginners underestimate how common credential stuffing is",
  "talking_points": "1. What a breach leaks\n2. What credential stuffing is\n3. One practical habit",
  "audience": "Beginners and career switchers",
  "soft_close": "You are not behind. Start with one habit and build."
}

Publish
POST to the workflow 03 webhook URL

{
  "episode": "01",
  "title": "What cybersecurity actually is and what it is not",
  "description": "Calm, beginner friendly explanation. Truth over hype.",
  "privacyStatus": "public",
  "categoryId": "27",
  "render_path": "/path/to/your/video.mp4"
}

render_path must be a file path the n8n machine can read.
EOF

echo "Writing workflows..."

cat > n8n/workflows/01_idea_to_issue.json <<EOF
{
  "name": "01 Idea to GitHub Issue",
  "nodes": [
    {
      "parameters": {
        "path": "truth_explains/idea",
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
            { "name": "title", "type": "string", "value": "={{\$json.body.title || \\"Idea: Untitled\\"}}" },
            { "name": "core_question", "type": "string", "value": "={{\$json.body.core_question || \\"\\"}}" },
            { "name": "core_truth", "type": "string", "value": "={{\$json.body.core_truth || \\"\\"}}" },
            { "name": "why_matters", "type": "string", "value": "={{\$json.body.why_matters || \\"\\"}}" },
            { "name": "talking_points", "type": "string", "value": "={{\$json.body.talking_points || \\"\\"}}" },
            { "name": "audience", "type": "string", "value": "={{\$json.body.audience || \\"Beginners, career switchers, curious learners\\"}}" },
            { "name": "soft_close", "type": "string", "value": "={{\$json.body.soft_close || \\"You are not behind. Keep going.\\"}}" }
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
        "resource": "issue",
        "operation": "create",
        "owner": "={{\$json.owner}}",
        "repository": "={{\$json.repo}}",
        "title": "={{\$json.title}}",
        "body": "={{\\"## Working title\\\\n\\\\n\\" + \$json.title + \\"\\\\n\\\\n## Who this is for\\\\n\\\\n\\" + \$json.audience + \\"\\\\n\\\\n## Core question\\\\n\\\\n\\" + \$json.core_question + \\"\\\\n\\\\n## Truth they should leave with\\\\n\\\\n\\" + \$json.core_truth + \\"\\\\n\\\\n## Why this matters\\\\n\\\\n\\" + \$json.why_matters + \\"\\\\n\\\\n## Main talking points\\\\n\\\\n\\" + \$json.talking_points + \\"\\\\n\\\\n## Auntie check\\\\n\\\\nWould I say this to someone I care about\\\\nIs anything rushed or performative\\\\n\\\\n## Soft close idea\\\\n\\\\n\\" + \$json.soft_close + \\"\\\\n\\"}}",
        "labels": ["idea"]
      },
      "id": "github_create_issue",
      "name": "GitHub create issue",
      "type": "n8n-nodes-base.github",
      "typeVersion": 2,
      "position": [760, 260],
      "credentials": {
        "githubApi": {
          "id": "SELECT_IN_N8N",
          "name": "GitHub API"
        }
      }
    }
  ],
  "connections": {
    "Webhook": {
      "main": [[{ "node": "Normalize input", "type": "main", "index": 0 }]]
    },
    "Normalize input": {
      "main": [[{ "node": "GitHub create issue", "type": "main", "index": 0 }]]
    }
  },
  "active": false
}
EOF

cat > n8n/workflows/02_issue_labeled_script_creates_stub.json <<EOF
{
  "name": "02 Issue labeled script creates stub",
  "nodes": [
    {
      "parameters": {
        "triggerOn": "issues",
        "owner": "${OWNER}",
        "repository": "${REPO}",
        "events": ["labeled"]
      },
      "id": "github_trigger",
      "name": "GitHub trigger",
      "type": "n8n-nodes-base.githubTrigger",
      "typeVersion": 1,
      "position": [240, 280],
      "credentials": {
        "githubApi": {
          "id": "SELECT_IN_N8N",
          "name": "GitHub API"
        }
      }
    },
    {
      "parameters": {
        "conditions": {
          "string": [
            {
              "value1": "={{\$json.label.name}}",
              "operation": "equals",
              "value2": "script"
            }
          ]
        }
      },
      "id": "if_script",
      "name": "If label is script",
      "type": "n8n-nodes-base.if",
      "typeVersion": 2,
      "position": [480, 280]
    },
    {
      "parameters": {
        "jsCode": "const issueTitle = \$json.issue?.title || 'Untitled';\\nconst issueNumber = \$json.issue?.number || 0;\\nconst episode = String(issueNumber).padStart(2,'0');\\nconst slug = issueTitle\\n  .toLowerCase()\\n  .replace(/^idea:\\\\s*/,'')\\n  .replace(/^script:\\\\s*/,'')\\n  .replace(/[^a-z0-9]+/g,'_')\\n  .replace(/^_+|_+$/g,'')\\n  .slice(0,48);\\n\\nconst filePath = `scripts/video_\${episode}_\${slug}.md`;\\n\\nconst content = `# \${issueTitle}\\\\n\\\\nchannel\\\\nTruth Explains\\\\n\\\\ntagline\\\\nCybersecurity explained by Truth, with patience.\\\\n\\\\nstatus\\\\ndraft\\\\n\\\\nlength_target\\\\n6 to 10 minutes\\\\n\\\\noutline\\\\n00:00 to 00:20 opening\\\\n00:20 to 01:20 define the concept\\\\n01:20 to 04:30 main points\\\\n04:30 to 06:30 recap and reassurance\\\\n06:30 to 07:00 close\\\\n\\\\nscript\\\\n\\\\nHey. Come sit with me for a minute.\\\\n\\\\n\\\\nvisual_notes\\\\nKeep visuals calm. One idea per screen. Fade transitions.\\\\n\\\\nclosing\\\\nThis is cybersecurity explained by Truth, with patience.\\\\n`;\\n\\nreturn [{ filePath, content }];"
      },
      "id": "build_stub",
      "name": "Build stub",
      "type": "n8n-nodes-base.code",
      "typeVersion": 2,
      "position": [720, 280]
    },
    {
      "parameters": {
        "resource": "file",
        "operation": "create",
        "owner": "${OWNER}",
        "repository": "${REPO}",
        "filePath": "={{\$json.filePath}}",
        "fileContent": "={{\$json.content}}",
        "commitMessage": "={{\\"Add script stub \\" + \$json.filePath}}"
      },
      "id": "github_create_file",
      "name": "GitHub create file",
      "type": "n8n-nodes-base.github",
      "typeVersion": 2,
      "position": [980, 280],
      "credentials": {
        "githubApi": {
          "id": "SELECT_IN_N8N",
          "name": "GitHub API"
        }
      }
    }
  ],
  "connections": {
    "GitHub trigger": {
      "main": [[{ "node": "If label is script", "type": "main", "index": 0 }]]
    },
    "If label is script": {
      "main": [[{ "node": "Build stub", "type": "main", "index": 0 }]]
    },
    "Build stub": {
      "main": [[{ "node": "GitHub create file", "type": "main", "index": 0 }]]
    }
  },
  "active": false
}
EOF

cat > n8n/workflows/03_publish_to_youtube_and_open_analytics_issue.json <<EOF
{
  "name": "03 Publish to YouTube and open analytics issue",
  "nodes": [
    {
      "parameters": {
        "path": "truth_explains/publish",
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
            { "name": "episode", "type": "string", "value": "={{\$json.body.episode || \\"00\\"}}" },
            { "name": "title", "type": "string", "value": "={{\$json.body.title || \\"Untitled\\"}}" },
            { "name": "description", "type": "string", "value": "={{\$json.body.description || \\"\\"}}" },
            { "name": "privacyStatus", "type": "string", "value": "={{\$json.body.privacyStatus || \\"public\\"}}" },
            { "name": "categoryId", "type": "string", "value": "={{\$json.body.categoryId || \\"27\\"}}" },
            { "name": "render_path", "type": "string", "value": "={{\$json.body.render_path || \\"\\"}}" }
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
        "resource": "video",
        "operation": "upload",
        "title": "={{\$json.title}}",
        "description": "={{\$json.description}}",
        "privacyStatus": "={{\$json.privacyStatus}}",
        "categoryId": "={{\$json.categoryId}}",
        "binaryData": false,
        "filePath": "={{\$json.render_path}}"
      },
      "id": "youtube_upload",
      "name": "YouTube upload",
      "type": "n8n-nodes-base.youtube",
      "typeVersion": 1,
      "position": [740, 260],
      "credentials": {
        "youTubeOAuth2Api": {
          "id": "SELECT_IN_N8N",
          "name": "YouTube OAuth2"
        }
      }
    },
    {
      "parameters": {
        "resource": "issue",
        "operation": "create",
        "owner": "${OWNER}",
        "repository": "${REPO}",
        "title": "={{\\"Analytics: Episode \\" + \$json.episode}}",
        "body": "={{\\"## Video\\\\n\\\\nEpisode number\\\\n\\" + \$json.episode + \\"\\\\nTitle\\\\n\\" + \$json.title + \\"\\\\nYouTube link\\\\n\\" + (\$node[\\"YouTube upload\\"].json.url || \\"add link\\") + \\"\\\\n\\\\n## Check in point\\\\n\\\\n48 hours\\\\n\\\\n## What I looked at\\\\n\\\\nAverage view duration\\\\nRetention pattern\\\\nComments\\\\nTraffic source\\\\n\\\\n## What I ignored on purpose\\\\n\\\\nReal time views\\\\nSubscriber swings\\\\nComparisons to other channels\\\\n\\\\n## What happened\\\\n\\\\n\\\\n## Why I think this happened\\\\n\\\\n\\\\n## What viewers told me\\\\n\\\\n\\\\n## One small adjustment for next video\\\\n\\\\n\\\\n## What stays the same\\\\n\\\\n\\\\n## Next question this sparked\\\\n\\\\n\\"}}",
        "labels": ["analytics"]
      },
      "id": "github_analytics_issue",
      "name": "GitHub create analytics issue",
      "type": "n8n-nodes-base.github",
      "typeVersion": 2,
      "position": [1010, 260],
      "credentials": {
        "githubApi": {
          "id": "SELECT_IN_N8N",
          "name": "GitHub API"
        }
      }
    }
  ],
  "connections": {
    "Webhook": {
      "main": [[{ "node": "Normalize input", "type": "main", "index": 0 }]]
    },
    "Normalize input": {
      "main": [[{ "node": "YouTube upload", "type": "main", "index": 0 }]]
    },
    "YouTube upload": {
      "main": [[{ "node": "GitHub create analytics issue", "type": "main", "index": 0 }]]
    }
  },
  "active": false
}
EOF

echo "Done."
echo "Created:"
echo " - n8n/docs/setup_notes.md"
echo " - n8n/workflows/01_idea_to_issue.json"
echo " - n8n/workflows/02_issue_labeled_script_creates_stub.json"
echo " - n8n/workflows/03_publish_to_youtube_and_open_analytics_issue.json"
echo
echo "Next:"
echo " - Import the JSON files into n8n"
echo " - Select GitHub and YouTube credentials inside each workflow node"
