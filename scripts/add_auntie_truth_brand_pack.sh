#!/usr/bin/env bash
set -euo pipefail

mkdir -p scripts
mkdir -p docs
mkdir -p shorts
mkdir -p n8n/docs

cat > n8n/docs/elevenlabs_voice_settings.md <<'EOT'
# ElevenLabs voice settings for Auntie Truth

Add a body parameter in the n8n node ElevenLabs convert:

Name
voice_settings

Value as Expression
{{ { "stability": 0.48, "similarity_boost": 0.82, "style": 0.30, "use_speaker_boost": true } }}

Notes
Keep line breaks in scripts. ElevenLabs reads them as natural pauses.
Avoid exclamation points. Let the rhythm do the energy.
EOT

cat > docs/auntie_truth_reference_bank.md <<'EOT'
# Auntie Truth reference bank

Use these as quick inserts. If a viewer misses the reference, the lesson still makes sense.

Everyday life
1. Front door logic  
Lock it. Check first. Do not open up just because someone sounds confident.
2. Group chat energy  
If the message feels off, pause. Ask a friend. Verify.
3. Extended warranty robocalls  
Same scam pattern. Same volume. They are not personal. They are fishing.
4. Package delivery texts  
If it is urgent and sloppy, it is usually a trap.

School and work
1. Integrity is the grade change  
You did the work, but the record got altered.
2. Availability is the system outage  
You need it now, but it is down. That is real impact.
3. Confidentiality is private notes  
If the wrong people can see it, it is a problem.

Pop culture friendly, light, evergreen
1. Not a spy movie  
No dramatic music. No instant hacking. Most attacks are boring and repetitive.
2. Sci fi green code myth  
Real attacks are usually social engineering and bad habits, not magic typing.
3. Supervillain button energy  
If a link feels like a trap button, do not press it.

Cyber phrases translated
1. Phishing  
A scam dressed up like something you trust.
2. Social engineering  
Someone talking you into giving them access.
3. Malware  
A harmful program you did not invite.
4. Ransomware  
Your files get locked and they demand payment.
5. Two factor  
A second lock for your digital front door.

Quick laugh lines
1. If an email is yelling at you, that is already suspicious.
2. Nobody needs your password that bad.
3. If it feels rushed, that is the scam working.
4. We are not aiming for perfect. We are aiming for harder to hack.
EOT

cat > docs/visual_style_guide.md <<'EOT'
# Visual style guide for Auntie Truth

Goal
Hip, warm, modern, clean. Cyber without looking like a hacker movie.

Channel identity
Name
Auntie Truth

Tagline
Cybersecurity explained by Truth with patience

Thumbnails
1. Big readable text, max 4 words
2. One strong image or icon
3. Consistent border or corner mark
4. Keep it clean and high contrast

Text patterns
1. Stop doing this
2. Here is the trick
3. Do not click that
4. Passwords, for real
5. Two factor saves you
6. Spot the scam

On screen text
1. Short captions that match spoken rhythm
2. Highlight key terms in one line
3. Simple arrows and callouts

Pacing
1. Switch visuals every 3 to 6 seconds
2. Definitions as quick captions
3. Simple diagrams when needed

Music
1. Low volume, steady, no lyrics
2. Keep it consistent across episodes
3. Lower music before changing voice settings
EOT

cat > shorts/shorts_template.md <<'EOT'
# Auntie Truth Shorts template

Length
25 to 40 seconds

Structure
1. Hook in 1 line
2. One clear point
3. One real life analogy
4. One action step
5. Closing micro line

Template
Hook  
Pause  
What it is  
Pause  
Real life analogy  
Pause  
Do this today  
Pause  
Closing

Closing micro line options
1. Stay with me. We are moving smarter online.
2. Auntie Truth. Make it make sense.
EOT

cat > scripts/video_02_passwords_that_do_not_get_you_hacked.md <<'EOT'
title: Passwords that do not get you hacked
episode: 02

script
Welcome.

I’m Auntie Truth,

and we’re going to make cybersecurity
make sense.

Today we are talking about passwords.

Because yes,
your password can still be the reason
somebody walks right into your account.

And no,
this is not a spy movie.

It is usually just
one weak password,
reused everywhere,
and a breach you never heard about.

A password is a lock.
But a weak password is like
locking your front door
and leaving the spare key
under the mat.

Everybody checks the mat.

Rule one,
do not reuse passwords.

If one site gets breached,
scammers try that same password
on your email,
your bank,
your socials,
everything.

Rule two,
use a password manager.

Not because you are forgetful,
because you are human.

Rule three,
your best password is a sentence.

Long beats complicated.

Action step.

Pick one important account.
Email is best.
Change it to a long unique password.
Then put it in a password manager.

If this helped you,
stay with me.

We’re learning how to move smarter online,
not trying to be perfect.

And if this felt useful,
liking, sharing, or subscribing
helps it reach more people
who need it.
EOT

cat > scripts/video_03_phishing_and_social_engineering.md <<'EOT'
title: Phishing and social engineering
episode: 03

script
Welcome.

I’m Auntie Truth,

and we’re going to make cybersecurity
make sense.

Today we are talking about phishing.

Phishing is a scam
dressed up like something you trust.

And it works best when you are rushed.

If a message feels urgent,
pause.

Do not click the link.

Go to the app yourself.
Type the site yourself.

Verify using a second channel.

Action step.

Turn on two factor
for your email and socials.

If this helped you,
stay with me.

We’re learning how to move smarter online,
not trying to be perfect.

And if this felt useful,
liking, sharing, or subscribing
helps it reach more people
who need it.
EOT

cat > scripts/video_04_two_factor_is_your_second_lock.md <<'EOT'
title: Two factor is your second lock
episode: 04

script
Welcome.

I’m Auntie Truth,

and we’re going to make cybersecurity
make sense.

Today we are talking about two factor.

Two factor is your second lock.

Password is lock one.
Two factor is lock two.

Best choice for most people
is an authenticator app.

Start with email first.

Action step.

Turn on two factor for email.
Save backup codes somewhere safe.

If this helped you,
stay with me.

We’re learning how to move smarter online,
not trying to be perfect.

And if this felt useful,
liking, sharing, or subscribing
helps it reach more people
who need it.
EOT

cat > scripts/video_05_updates_and_backups.md <<'EOT'
title: Updates and backups
episode: 05

script
Welcome.

I’m Auntie Truth,

and we’re going to make cybersecurity
make sense.

Today we are talking about updates and backups.

Updates patch known problems.

Backups are your reset button.

Action step.

Turn on automatic updates.
Turn on cloud backup for your phone.

If this helped you,
stay with me.

We’re learning how to move smarter online,
not trying to be perfect.

And if this felt useful,
liking, sharing, or subscribing
helps it reach more people
who need it.
EOT

cat > shorts/short_02_passwords_hook.md <<'EOT'
title: Passwords are not vibes
episode: 02
length_seconds: 35

script
Quick question.

Is your password reused anywhere.

Because if one site gets breached,
scammers try that same password
everywhere.

Do this today.

Use a password manager.
Make one long unique password
for your email.

Stay with me.
We are moving smarter online.
EOT

cat > shorts/short_03_phishing_pause.md <<'EOT'
title: If it feels rushed, pause
episode: 03
length_seconds: 30

script
If a message feels urgent,
pause.

Do not click the link.

Go to the app yourself.
Type the site yourself.

That pause
will save you.

Auntie Truth.
Make it make sense.
EOT

cat > shorts/short_04_two_factor_second_lock.md <<'EOT'
title: Two factor is your second lock
episode: 04
length_seconds: 30

script
Your password is one lock.

Two factor is the second lock.

Turn on two factor for your email today.

Stay with me.
EOT

cat > shorts/short_05_updates_are_protection.md <<'EOT'
title: Updates are protection
episode: 05
length_seconds: 30

script
Updates patch known problems.

So update your phone.
Update your laptop.

Then turn on automatic updates.

Protect your future self.

Auntie Truth.
EOT

git add n8n/docs/elevenlabs_voice_settings.md docs/auntie_truth_reference_bank.md docs/visual_style_guide.md
git add shorts/shorts_template.md shorts/short_02_passwords_hook.md shorts/short_03_phishing_pause.md shorts/short_04_two_factor_second_lock.md shorts/short_05_updates_are_protection.md
git add scripts/video_02_passwords_that_do_not_get_you_hacked.md scripts/video_03_phishing_and_social_engineering.md scripts/video_04_two_factor_is_your_second_lock.md scripts/video_05_updates_and_backups.md
git add scripts/add_auntie_truth_brand_pack.sh

git commit -m "Add episodes 02-05 plus reference bank visual guide and shorts"
echo "Created files and committed. Now run: git push origin main"
