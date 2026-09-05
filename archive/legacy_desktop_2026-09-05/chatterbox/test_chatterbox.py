import json
import urllib.request

url = "http://localhost:5001/v1/audio/speech"
payload = {"input": "test one two three", "voice": "alloy"}

req = urllib.request.Request(
    url,
    data=json.dumps(payload).encode("utf8"),
    headers={"Content Type": "application/json"},
    method="POST",
)

with urllib.request.urlopen(req, timeout=30) as r:
    audio = r.read()

with open("out.wav", "wb") as f:
    f.write(audio)

print("wrote out.wav bytes", len(audio))

