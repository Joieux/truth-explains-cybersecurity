# ElevenLabs voice settings for Auntie Truth

Add a body parameter in the n8n node ElevenLabs convert:

Name
voice_settings

Value as Expression
{{ { "stability": 0.48, "similarity_boost": 0.82, "style": 0.30, "use_speaker_boost": true } }}

Notes
Keep line breaks in scripts. ElevenLabs reads them as natural pauses.
Avoid exclamation points. Let the rhythm do the energy.
