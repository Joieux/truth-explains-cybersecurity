#!/usr/bin/env bash
set -euo pipefail

# Run from repo root:
#   bash scripts/add_episodes_02_05_shorts_and_lock_n8n.sh

mkdir -p scripts shorts n8n/docs n8n/workflows

############################################
# Episodes 02–05 (Awnt Truth cadence + voice)
############################################

cat > scripts/video_02_passwords_and_managers.md <<'EOF'
title: Passwords and Password Managers, For Real
episode: 02

script

Hey there.

I heard you had some questions about passwords.

Let’s talk about it.

We’re going to take this slow,
and make it make sense.

A password is a key.

And right now,
most people are out here
using the same key
for the front door,
the side door,
and the car.

That is not confidence.
That is a horror movie setup.

Here is the truth.

Hackers do not guess your password
like in the movies.

They buy lists.

They take passwords from one breach,
and try them everywhere else.

That is called credential stuffing.

Same trick.
New site.
All day.

That’s how I break it down.

Awnt Truth style.

So what do we do?

Two things.

First,
use a password manager.

A password manager is a locked keychain.

You create one strong master password.
Then it makes strong,
unique passwords
for every account.

So even if one site gets breached,
your other accounts do not fall like dominoes.

Second,
stop making passwords that look like this.

Summer2025!
Password123!
YourKidsName1!

If I can guess it,
a script can guess it.

Now,
I know what you are thinking.

What if the password manager gets hacked?

Good question.

Password managers are not magic.
But they are built for this.

They are designed to protect your vault.
They are monitored.
They are updated.
And they reduce the biggest risk of all:

Reused passwords.

Here is your simple starter plan.

Pick a password manager you trust.
Turn on auto fill.
Start with your email first.
Then your banking.
Then your socials.

One at a time.

No panic.
Just progress.

Alright.

That’s enough for today.

If this helped you,
stay with me.

We’re building understanding,
not rushing perfection.

And if you want more of this,
liking, sharing, or subscribing
helps it reach
the people who need it.

I'll see you next time.

We've got this.
EOF

cat > scripts/video_03_two_factor_authentication.md <<'EOF'
title: Two Factor Authentication, Without the Confusion
episode: 03

script

Hey there.

I heard you had some questions about two factor authentication.

Let’s talk about it.

We’re going to take this slow,
and make it make sense.

Two factor authentication is a second lock.

Password is one lock.

Two factor is the deadbolt.

So if somebody steals your password,
they still cannot get in.

Because they do not have the second thing.

That second thing can be:

Something you know,
something you have,
or something you are.

But here is the part people miss.

Not all two factor is equal.

Text message codes are better than nothing.

But SIM swap is real.

That is when someone convinces your phone company
to move your number to their phone.

And now they get your text codes.

That’s how I break it down.

Awnt Truth style.

So what is best?

Authenticator apps.

They generate codes on your device.
No phone company involved.

Even better?

Passkeys,
or hardware keys,
when available.

But do not get overwhelmed.

Here is the upgrade path.

Step one:
turn on two factor for your email.

Because your email is the master key to resets.

Step two:
turn it on for your bank.

Step three:
turn it on for your socials.

Use an authenticator app if you can.

If you must use SMS,
do it for now.
Then upgrade later.

The goal is layers.

Not panic.
Not perfection.

Layers.

Alright.

That’s enough for today.

If this helped you,
stay with me.

We’re building understanding,
not rushing perfection.

And if you want more of this,
liking, sharing, or subscribing
helps it reach
the people who need it.

I'll see you next time.

We've got this.
EOF

cat > scripts/video_04_phishing_and_links.md <<'EOF'
title: Phishing, For Real: How People Get Got
episode: 04

script

Hey there.

I heard you had some questions about phishing.

Let’s talk about it.

We’re going to take this slow,
and make it make sense.

Phishing is social engineering.

It is not hacking your device.

It is hacking your decisions.

A phish is a message
that tries to rush you
into doing something.

Click this.
Log in here.
Pay this.
Confirm this.

And it almost always comes with pressure.

Your account will be closed.
Your package is delayed.
Your payment failed.
Your boss needs this now.

Same trick.
New person.
All day.

That’s how I break it down.

Awnt Truth style.

Here are the three red flags.

First,
urgency.

If it feels rushed,
stop.

Second,
a link you did not ask for.

Even if it looks real,
do not trust it.
Verify it.

Third,
weird details.

A slightly off email address.
A strange greeting.
A tone that does not match the real company.

Now,
your defense is simple.

Do not click the link.

Go to the app.
Go to the website yourself.
Type it in.
Use your bookmark.

And if it is from “your boss”
and it feels odd,
verify with a call or chat.

Because phishing wins
when you are tired,
rushed,
and distracted.

And you are allowed to protect your peace.

Alright.

That’s enough for today.

If this helped you,
stay with me.

We’re building understanding,
not rushing perfection.

And if you want more of this,
liking, sharing, or subscribing
helps it reach
the people who need it.

I'll see you next time.

We've got this.
EOF

cat > scripts/video_05_updates_and_backups.md <<'EOF'
title: Updates and Backups: The Boring Stuff That Saves You
episode: 05

script

Hey there.

I heard you had some questions about updates and backups.

Let’s talk about it.

We’re going to take this slow,
and make it make sense.

Updates are patches.

They fix known holes.

A lot of attacks are not clever.

They are old.
They are automated.
They are scanning for devices
that did not update.

So when you delay updates,
you are leaving a window open
because you do not feel like getting up.

That’s how I break it down.

Awnt Truth style.

Now backups.

Backups are your safety net.

If ransomware hits,
if a laptop dies,
if you delete something by accident,
a backup lets you breathe.

Here is the rule.

One copy is not a backup.

Backups need to exist in another place.

Cloud counts.
An external drive counts.
But it has to be separate.

Here is your simple plan.

Turn on automatic updates.

Turn on automatic backups.

And once a month,
check that your backup actually works.

Because the time to discover a broken backup
is not the day you need it.

Layers.
Not panic.
Not perfection.

Alright.

That’s enough for today.

If this helped you,
stay with me.

We’re building understanding,
not rushing perfection.

And if you want more of this,
liking, sharing, or subscribing
helps it reach
the people who need it.

I'll see you next time.

We've got this.
EOF

############################################
# Shorts scripts (30–45 seconds)
############################################

cat > shorts/short_01_confidentiality_integrity_availability.md <<'EOF'
title: CIA Triad in 35 Seconds
type: shorts
length: 35-45s

script

Cybersecurity is three things.

Confidentiality.
Keep private stuff private.

Integrity.
Keep information accurate.

Availability.
Make sure you can access what you need,
when you need it.

That is the whole game.

And most defenses are just layers
protecting those three.

I'll see you next time.

We've got this.
EOF

cat > shorts/short_02_phishing_pause_rule.md <<'EOF'
title: The Pause Rule for Phishing
type: shorts
length: 30-40s

script

Here is an Awnt Truth rule.

If a message feels rushed,
stop.

If it feels like pressure,
stop.

Because pressure is the trick.

And the pause is the power.

Go to the app yourself.
Type the site yourself.
Do not click the surprise link.

I'll see you next time.

We've got this.
EOF

cat > shorts/short_03_password_reuse_dominoes.md <<'EOF'
title: Reused Passwords Are Dominoes
type: shorts
length: 30-45s

script

Reusing passwords is like using one key
for your house,
your car,
and your phone.

If one lock gets copied,
everything opens.

Use a password manager.
One strong master password,
unique passwords everywhere else.

Layers.

I'll see you next time.

We've got this.
EOF

############################################
# Lock n8n settings (docs + workflow update)
############################################

cat > n8n/docs/voice_lock.md <<'EOF'
Awnt Truth voice lock

These values are locked.
Do not change per episode.

model_id: eleven_multilingual_v2
language_code: en
apply_text_normalization: on

voice_settings:
  stability: 0.38
  similarity_boost: 0.86
  style: 0.42
  use_speaker_boost: true

Rules:
- Do not add speed
- Do not switch models
- If cadence feels off, adjust script line breaks, not voice parameters
EOF

cat > n8n/workflows/04_generate_elevenlabs_audio_from_script.json <<'EOF'
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
        "keepOnlySet": true,
        "values": {
          "string": [
            { "name": "owner", "value": "Joieux" },
            { "name": "repo", "value": "truth-explains-cybersecurity" },
            { "name": "episode", "value": "={{$json.body.episode || \"01\"}}" },
            { "name": "script_path", "value": "={{$json.body.script_path || \"scripts/video_01_what_cybersecurity_is.md\"}}" },
            { "name": "voice_id", "value": "7NqGFKni4RdkLum3C1xd" },
            { "name": "model_id", "value": "eleven_multilingual_v2" },
            { "name": "language_code", "value": "en" },
            { "name": "apply_text_normalization", "value": "on" }
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
        "owner": "={{$json.owner}}",
        "repository": "={{$json.repo}}",
        "filePath": "={{$json.script_path}}",
        "additionalParameters": {},
        "options": {}
      },
      "id": "github_get_file",
      "name": "GitHub get script file",
      "type": "n8n-nodes-base.github",
      "typeVersion": 1,
      "position": [720, 260],
      "credentials": {
        "githubApi": {
          "id": "SELECT_IN_N8N",
          "name": "GitHub account"
        }
      }
    },
    {
      "parameters": {
        "jsCode": "// Reminder: script cadence and closing are controlled in the markdown file.\n// This node only prepares text for ElevenLabs.\n\nconst episode = $node[\"Normalize input\"].json.episode;\nconst voiceId = $node[\"Normalize input\"].json.voice_id;\nconst modelId = $node[\"Normalize input\"].json.model_id;\n\n// Pull binary file from GitHub node safely\nconst ghItems = $items(\"GitHub get script file\");\nconst bin = ghItems?.[0]?.binary?.data;\n\nif (!bin || !bin.data) {\n  throw new Error(\"GitHub file binary not found. Ensure GitHub node has 'As Binary Property' ON and output field set to 'data'.\");\n}\n\nconst raw = Buffer.from(bin.data, \"base64\").toString(\"utf8\");\n\n// Extract script body\nconst lines = raw.split(/\\r?\\n/);\nconst startIndex = lines.findIndex((l) => l.trim().toLowerCase() === \"script\");\nlet text = \"\";\n\nif (startIndex >= 0) {\n  text = lines.slice(startIndex + 1).join(\"\\n\").trim();\n} else {\n  text = raw.trim();\n}\n\n// ---- Validate locked Awnt Truth closing (Unicode-safe) ----\nconst REQUIRED_ENDING = [\"I'll see you next time.\", \"We've got this.\"];\n\nconst normalizeLine = (s) =>\n  String(s || \"\")\n    .replace(/\\u00A0/g, \" \")\n    .replace(/[\\u200B-\\u200D\\uFEFF]/g, \"\")\n    .replace(/[’‘]/g, \"'\")\n    .trim();\n\nconst normalizedLines = text\n  .replace(/\\r/g, \"\")\n  .split(\"\\n\")\n  .map(normalizeLine)\n  .filter(Boolean);\n\nif (normalizedLines.length < 2) {\n  throw new Error(\"Script is too short. It must include the locked closing.\");\n}\n\nconst lastTwo = normalizedLines.slice(-2);\nconst req0 = normalizeLine(REQUIRED_ENDING[0]);\nconst req1 = normalizeLine(REQUIRED_ENDING[1]);\n\nif (normalizeLine(lastTwo[0]) !== req0 || normalizeLine(lastTwo[1]) !== req1) {\n  throw new Error(\n    \"Script is missing the locked Awnt Truth closing.\\n\" +\n      \"The final two lines must be:\\n\" +\n      \"I'll see you next time.\\n\" +\n      \"We've got this.\"\n  );\n}\n\nconst safeEpisode = String(episode).padStart(2, \"0\");\nconst outPath = `/media/audio/processed/video_${safeEpisode}_ai.mp3`;\n\nreturn [\n  {\n    json: {\n      episode: safeEpisode,\n      voice_id: voiceId,\n      model_id: modelId,\n      language_code: \"en\",\n      apply_text_normalization: \"on\",\n      voice_settings: {\n        stability: 0.38,\n        similarity_boost: 0.86,\n        style: 0.42,\n        use_speaker_boost: true\n      },\n      text,\n      out_path: outPath\n    }\n  }\n];"
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
        "url": "={{\"https://api.elevenlabs.io/v1/text-to-speech/\" + $json.voice_id + \"?output_format=mp3_44100_128\"}}",
        "authentication": "genericCredentialType",
        "genericAuthType": "httpHeaderAuth",
        "sendHeaders": true,
        "headerParameters": {
          "parameters": [
            { "name": "Accept", "value": "audio/mpeg" },
            { "name": "Content-Type", "value": "application/json" }
          ]
        },
        "sendBody": true,
        "bodyParameters": {
          "parameters": [
            { "name": "text", "value": "={{$json.text}}" },
            { "name": "model_id", "value": "={{$json.model_id}}" },
            { "name": "language_code", "value": "={{$json.language_code}}" },
            { "name": "apply_text_normalization", "value": "={{$json.apply_text_normalization}}" },
            { "name": "voice_settings", "value": "={{$json.voice_settings}}" }
          ]
        },
        "options": {
          "response": {
            "response": {
              "responseFormat": "file"
            }
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
          "name": "Header Auth account"
        }
      }
    },
    {
      "parameters": {
        "operation": "write",
        "fileName": "={{$node[\"Prepare ElevenLabs request\"].json.out_path}}",
        "inputBinaryField": "data"
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

echo "Created:"
echo "  scripts/video_02_passwords_and_managers.md"
echo "  scripts/video_03_two_factor_authentication.md"
echo "  scripts/video_04_phishing_and_links.md"
echo "  scripts/video_05_updates_and_backups.md"
echo "  shorts/short_01_confidentiality_integrity_availability.md"
echo "  shorts/short_02_phishing_pause_rule.md"
echo "  shorts/short_03_password_reuse_dominoes.md"
echo "  n8n/docs/voice_lock.md"
echo "  n8n/workflows/04_generate_elevenlabs_audio_from_script.json"
echo
echo "Next:"
echo "  git add scripts shorts n8n/docs n8n/workflows"
echo "  git commit -m \"Add Episodes 2-5, Shorts, and lock n8n voice settings\""
echo "  git pull --rebase origin main && git push origin main"
