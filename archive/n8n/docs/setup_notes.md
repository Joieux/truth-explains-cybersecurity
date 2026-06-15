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
