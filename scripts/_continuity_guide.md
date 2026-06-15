# Truth Explains — Continuity Guide
The contract every script must honor. Audit each new script against this
BEFORE narration is generated. Updated 2026-06-10 (v2 script generation).

---

## 1. The rituals (every episode, exact wording)

| Ritual | Line | Where |
|--------|------|-------|
| Open | "Hey, family." | First line |
| Wind-down | "Alright, family. / That's enough for today." | Start of close |
| Loyalty | "Stay with me. / We're building this together." | Close |
| Motto | "Understanding first. Tools second." | Close |
| Sign-off | "We've got this." (no exclamation point) | Final line |
| Tease | "Next time: ..." with a concrete promise | Before sign-off |

EP10/season finales may bend these deliberately ("That's enough — not just
for today", "Understanding first. Tools second. Always.").

## 2. The tease chain — promises are debts

Whatever "Next time:" promises, the next episode MUST deliver — ideally
echoing the exact phrase. Current chain, all paid:

| From → To | Promise | Payoff |
|-----------|---------|--------|
| 01 → 02 | strong passwords; stop forgetting; dog's name +1 is not it | long-beats-clever; manager; "Max is not a security strategy" |
| 02 → 03 | the deadbolt behind the lock; stolen password still fails | deadbolt episode opens "I keep that promise" |
| 03 → 04 | study the other side; spot it from across the room | costume episode; "spot a costume from across the room" |
| 04 → 05 | two switches that protect you while you sleep | auto-updates + auto-backups; "win while you sleep" |
| 05 → 06 | coffee shop; what's risky, what isn't; the one move | public room; sorting question; hotspot |
| 06 → 07 | we build; laptop; password manager step by step | build day, five steps |
| 07 → 08 | the DMs; the one rule about codes | three plays; "never share a login code" |
| 08 → 09 | phone is your wallet; lock the wallet | four locks |
| 09 → 10 | start in cybersecurity; 30 days; 15 min | the map |

**Rule: opening an episode by keeping the previous promise out loud
("Last time I made you a promise...") is the strongest open we have.**

## 3. Metaphor registry — one meaning each, forever

| Metaphor | Means | Introduced | Never confuse with |
|----------|-------|------------|--------------------|
| Doors | accounts/devices | EP01 | — |
| Peephole | checking before trusting | EP01 | — |
| Fishing / wide net | scammers want easy, not you | EP01 | phishing the technique (EP04) |
| The pause is the power | don't act under urgency | EP01 | — |
| Layers | stacked defenses | EP01 | — |
| Skeleton key | one reused password (BAD) | EP02 | master key |
| Locked keychain / vault | password manager | EP02 | — |
| Master password | the one you memorize (a sentence) | EP02/07 | master key |
| Master key | your EMAIL (guard it first) | EP03 | skeleton key |
| Deadbolt | two-factor authentication | EP03 | screen lock |
| Costume | phishing message | EP04 | — |
| Lock company recall | software updates | EP05 | — |
| Fireproof box | backups | EP05 | — |
| Public room | public WiFi | EP06 | — |
| The three plays | DM scam patterns | EP08 | — |
| Second channel | verify outside the chat | EP08 | — |
| Slab of glass / wallet | your phone | EP09 | — |
| Color wheel | the field's job map | EP10 (+branding) | — |

## 4. Standing facts (do not contradict)

- Email is always secured FIRST; rollout cadence is email → bank → socials
  (EP03 and EP07 use the identical cadence on purpose)
- 2FA ranking: SMS < authenticator app < passkeys/hardware keys
- Login codes are never shared with anyone, no exceptions
- Backups must live in a separate place; one copy is not a backup
- Auntie Truth never panics, never shames, never rushes the viewer
- Action steps say "today" — never "tonight" (viewers watch anytime)
- "Hacker" stays in the vocabulary — hacker culture is part of Auntie Truth's
  world ("Hack the system, not people"). What's RETIRED is the Hollywood
  costume: dark hoodies, green code rain, dramatic instant typing. EP01
  debunked that caricature once on the record; it never appears again, even
  ironically. Real attackers are written as they are: bored, automated,
  working at scale.

## 5. Voice and TTS rules (full detail in voice/elevenlabs_settings.md)

- No exclamation points (one per episode max, only at a true peak)
- *Italics* are editor cues — strip and convert key words to CAPS for ElevenLabs
- "Awnt" = phonetic spelling for spoken "Aunt"; never in captions/on-screen
- Write out "episode five" — never "EP05" — in anything that gets read aloud
- Episode word target: roughly 350–600 words

## 6. New-script audit checklist

1. Does it pay the previous episode's tease, preferably out loud?
2. Does its own tease make a promise the NEXT episode actually delivers?
3. Every backward reference ("episode five") — is the episode number right?
4. Every metaphor used — does it match the registry? New metaphor → add it here.
5. Rituals present and exact?
6. No "tonight", no "EP0X" spoken, no exclamation points, no "Awnt" in visible text?
7. Color tag in front matter matches branding/infosec_color_wheel.md?
