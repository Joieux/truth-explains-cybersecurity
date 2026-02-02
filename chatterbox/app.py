from flask import Flask, request, send_file, jsonify
import io
import wave
import os

app = Flask(__name__)


@app.get("/health")
def health():
    """Health check endpoint for container monitoring."""
    return {"status": "healthy"}


@app.post("/v1/audio/speech")
def speech():
    data = request.get_json(force=True, silent=True) or {}
    text = (data.get("input") or "").strip()
    output_path = data.get("output_path")

    if not text:
        return {"error": "missing input"}, 400

    # Generate audio (1 second of silence as placeholder)
    buf = io.BytesIO()
    with wave.open(buf, "wb") as wf:
        wf.setnchannels(1)
        wf.setsampwidth(2)
        wf.setframerate(16000)
        wf.writeframes(b"\x00\x00" * 16000)  # 1 second of silence

    audio_data = buf.getvalue()

    # If output_path is provided, save to file and return success
    if output_path:
        try:
            # Ensure directory exists
            os.makedirs(os.path.dirname(output_path), exist_ok=True)

            # Write the file
            with open(output_path, "wb") as f:
                f.write(audio_data)

            return jsonify({"success": True, "path": output_path})
        except Exception as e:
            return jsonify({"error": str(e)}), 500
    else:
        # Return audio data as before
        buf.seek(0)
        return send_file(
            buf, mimetype="audio/wav", as_attachment=False, download_name="speech.wav"
        )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
