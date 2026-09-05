#!/usr/bin/env bash
set -euo pipefail

# Run from repo root:
#   bash scripts/add_episodes_02_05_shorts.sh

mkdir -p scripts shorts

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
