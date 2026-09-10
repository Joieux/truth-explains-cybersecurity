# Truth Explains Episode Producer

EP03 pilot using the OpenAI Agents SDK.

Pipeline: Cybersecurity Accuracy Editor -> Episode Director -> Visual Production Designer -> Audio Director -> Production QA and Cybersecurity Gate.

The run writes production outputs to `episodes/ep03/production/`. Media generation and publishing remain human-gated.

Run from `agents/episode_producer` after installing dependencies:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -e .
python main.py
```

The app loads `OPENAI_API_KEY` from the repository-root `.env.local`.
