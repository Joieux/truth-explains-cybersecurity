"""
EP01 narration generator — run this from your Mac terminal.
Uses Chatterbox TTS with your cloned voice reference.

v2: Rechunked into larger idea-complete blocks so connector phrases
    and section transitions stay inside a single generation pass.
    This fixes the robotic reset between sentences.

Usage:
    cd ~/Desktop/Truth\ Explains
    python3 generate_ep01_narration.py
"""
import torch
import torchaudio
import os

VOICE_REF = os.path.expanduser(
    "~/Desktop/Truth Explains/audio/Feb_02__1739_200s_202602031226_85uob.mp4"
)
OUTPUT_DIR = os.path.expanduser(
    "~/Desktop/Truth Explains/remotion/public/audio"
)
OUTPUT_WAV = os.path.join(OUTPUT_DIR, "ep01_narration.wav")
OUTPUT_MP3 = os.path.join(OUTPUT_DIR, "ep01_narration.mp3")

# Chunked by IDEA, not by sentence.
# Rule: if two lines flow into each other, they stay in the same chunk.
# Connector phrases MUST stay with what they introduce.
CHUNKS = [
    # ── OPEN ──────────────────────────────────────────────────────────────────
    "Hey, family. Real glad you're here.",

    "Cybersecurity sounds like something for people who own server racks and have three monitors — and it's not.",

    # ── THE FLIP ──────────────────────────────────────────────────────────────
    "And here's what I want you to sit with. You've been doing cybersecurity your whole life. You just didn't have a name for it.",

    # ── THE ANALOGY ───────────────────────────────────────────────────────────
    "Think about it — you lock your door every night, and you check who's there before you open it. You would never hand your house keys to somebody you just met on the street — not in a million years — and that's cybersecurity.",

    # ── WHAT'S AT STAKE ───────────────────────────────────────────────────────
    "Because those doors are everywhere now. Your phone, your laptop, your email, your bank, your photos, your whole identity — all of that is a door now. Everything you've worked for, everything you count on, sitting on a device you sometimes use half-asleep on the couch. And because it's worth something to you — it's worth something to somebody else too.",

    # ── WHO THE ATTACKER IS ───────────────────────────────────────────────────
    "The person trying to get through those doors? They're not what the movies told you. Not a genius. Not somebody in a dark hoodie with dramatic music playing. Just a regular person. Might be in sweats right now. Eating some chips. Running the same copy-paste message to a thousand different people at the exact same time.",

    # ── THE METHOD ────────────────────────────────────────────────────────────
    "Same template. Different name. Hit send. Move on. All day long. They're not hunting you specifically. They're fishing — casting a big net over wide water. Just waiting for whoever bites.",

    # ── WHO GETS CAUGHT ───────────────────────────────────────────────────────
    "And who bites? Usually the person who's tired. The one who's rushing. The one who's got forty tabs open and didn't really read the email before clicking the link. We've all been there. And that is exactly what they're counting on.",

    # ── THE REFRAME ───────────────────────────────────────────────────────────
    "And that's why I'm telling you this. Not to scare you. But to steady you. Because once you actually see how simple this game is — you stop being the person they can play.",

    # ── THE MAP + CIA TRIAD INTRO (named upfront so pillars have a frame) ─────
    "So let me give you the map. Every cybersecurity threat on this earth — every single one — comes down to three things. They call it the CIA Triad. And no, not that CIA. We're talking Confidentiality, Integrity, and Availability. Let me walk you through each one.",

    # ── CONFIDENTIALITY (complete block — no split) ───────────────────────────
    "The first one is Confidentiality — which is just a fancy word for keeping private things private. Your passwords, your bank info, your personal messages, the photos that are yours and nobody else's business. If someone who shouldn't see it can see it — that's a breach of confidentiality, simple as that, your private life stays yours.",

    # ── INTEGRITY (complete block) ────────────────────────────────────────────
    "The second one is Integrity — keeping your information accurate, meaning true. Picture somebody quietly changing your grade, or altering the amount on a payment, or tweaking something in your medical record. You never knew it happened. But it did. The data's still sitting there — it just isn't true anymore. That's an integrity attack, and the scary part is, you might never find out.",

    # ── AVAILABILITY (complete block) ─────────────────────────────────────────
    "And the third one is Availability — being able to get to your own stuff when you need it. Say a ransomware attack locks your files, or a system crashes and your account goes dark. Your data still exists — you just can't reach it. And safe data you can't reach is not actually safe for you.",

    # ── CIA TRIAD WRAP (reinforcement, not introduction — named it upfront) ───
    "That's the CIA Triad. Every breach, every scam, every attack — is going after one of those three things. That's the whole game.",

    # ── THE PROTECTION ────────────────────────────────────────────────────────
    "And here's the good news — you protect yourself with layers. Not panic. Not expertise. Just habits. Use a strong password. Keep it in a password manager so you're not reusing the same one everywhere — because that is how one breach turns into ten. Use two-factor authentication — because that's a second lock on the door. And the habit that matters more than all of them combined: slow down.",

    # ── THE ONE THING ─────────────────────────────────────────────────────────
    "And that last one — I want to sit with that for a second. Because this is the thing I really need you to take out of this video. If something feels urgent — stop. If someone is rushing you — stop. If it feels like pressure — stop. That is the attack.",

    # ── WHY IT WORKS ──────────────────────────────────────────────────────────
    "That urgency you feel? It was engineered — on purpose. Every scam works because it makes you feel like you don't have time to think. That one second where you pause — where you don't click — that is your entire defense, and the pause is the power.",

    # ── CLOSE ─────────────────────────────────────────────────────────────────
    "Look, you don't have to become a hacker to protect yourself. You just need habits that make you harder to fool. And you've already got what it takes — that's why you showed up.",

    # ── SIGN OFF ──────────────────────────────────────────────────────────────
    "Alright, family. That's enough for today. If this landed — stay with me. We're building this together, understanding first, tools second.",

    # ── TEASE ─────────────────────────────────────────────────────────────────
    "Next time we're talking passwords — what makes one actually strong, how to stop forgetting them, and why your dog's name with a one at the end — I'm looking at you — is absolutely not it. I'll see you then. We've got this.",
]


def main():
    from chatterbox.tts import ChatterboxTTS

    print("Loading Chatterbox model...")
    device = "mps" if torch.backends.mps.is_available() else "cpu"
    print(f"Using device: {device}")
    model = ChatterboxTTS.from_pretrained(device=device)

    print(f"\nGenerating {len(CHUNKS)} chunks with your voice...")
    print(f"Voice reference: {VOICE_REF}\n")

    all_wavs = []
    sample_rate = None

    for i, chunk in enumerate(CHUNKS):
        print(f"  [{i+1}/{len(CHUNKS)}] {chunk[:70]}...")
        wav = model.generate(
            chunk,
            audio_prompt_path=VOICE_REF,
            exaggeration=0.50,  # slightly more natural, less pushed
            cfg_weight=0.35,    # looser pacing — flows more like real speech
        )
        all_wavs.append(wav)
        if sample_rate is None:
            sample_rate = model.sr

    print("\nStitching chunks...")
    # Tighter gap between chunks — 0.2 sec feels like a breath, not a reset
    silence = torch.zeros(1, int(sample_rate * 0.20))
    combined = []
    for i, w in enumerate(all_wavs):
        combined.append(w)
        if i < len(all_wavs) - 1:
            combined.append(silence)

    final = torch.cat(combined, dim=1)

    os.makedirs(OUTPUT_DIR, exist_ok=True)
    torchaudio.save(OUTPUT_WAV, final, sample_rate)

    duration = final.shape[1] / sample_rate
    print(f"\nSaved: {OUTPUT_WAV}")
    print(f"Duration: {duration:.1f} sec ({duration/60:.1f} min)")
    print(f"\nUpdate manifest.ts:")
    print(f"  TOTAL_AUDIO_DURATION_SEC = {int(duration) + 1}")

    try:
        os.system(f'ffmpeg -i "{OUTPUT_WAV}" -q:a 2 "{OUTPUT_MP3}" -y')
        print(f"Also saved as: {OUTPUT_MP3}")
    except Exception:
        print("Note: install ffmpeg to also get an MP3 version.")


if __name__ == "__main__":
    main()
