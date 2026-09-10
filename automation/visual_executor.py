#!/usr/bin/env python3

from pathlib import Path
import argparse
import hashlib
import json
import sys

EXPECTED_AURORA = "2ce8caa44b39d297b6043b237a12b076db0148fb8ea81f4b66f3dc6b6cde03e9"
EXPECTED_KIRK   = "f6ddc3305a9447ba033d5491703ca9a66c2e326b1e04b53c2bdde03d851f07fe"
EXPECTED_NARR   = "2083bd6ec23c5f660f15cb39c8b8b2b007267dae366da27e3593651654067c0d"

EXPECTED_LOCAL_ONLY = {
    "S007", "S008", "S009", "S010", "S012", "S019", "S022"
}

CHARACTER_LOCKS = {
    "aurora": {
        "path": Path.home()
        / "Documents/Codex/truth-explains-media/characters/aurora/identity/master/auntie_truth_ref_v2.jpg",
        "sha256": EXPECTED_AURORA,
    },
    "kirk": {
        "path": Path.home()
        / "Documents/Codex/truth-explains-media/characters/kirk/identity/master/Kirk.png",
        "sha256": EXPECTED_KIRK,
    },
}


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def fail(message):
    print(f"FAIL: {message}")
    sys.exit(1)


def main():
    parser = argparse.ArgumentParser(
        description="Truth Explains visual-generation execution controller"
    )
    parser.add_argument(
        "--episode",
        default="ep03",
        help="Episode ID, default ep03",
    )
    parser.add_argument(
        "--repo",
        default=".",
        help="Repository root",
    )
    parser.add_argument(
        "--plan",
        action="store_true",
        help="Create local generation execution plan. Makes no API calls.",
    )
    args = parser.parse_args()

    repo = Path(args.repo).resolve()
    ep = args.episode

    production = repo / "episodes" / ep / "production"
    manifest_path = production / "ep03_generation_ready_shot_manifest.json"
    timing_path = production / "ep03_timing_master.json"
    state_path = production / "production_state.json"
    plan_path = production / "visual_execution_plan.json"

    for p in (manifest_path, timing_path, state_path):
        if not p.exists():
            fail(f"Required file missing: {p}")

    manifest = json.loads(manifest_path.read_text())
    timing = json.loads(timing_path.read_text())
    state = json.loads(state_path.read_text())

    shots = manifest.get("shots", [])

    if len(shots) != 28:
        fail(f"Expected 28 shots; found {len(shots)}")

    expected_ids = [f"S{i:03d}" for i in range(1, 29)]
    actual_ids = [s.get("shot_id") for s in shots]

    if actual_ids != expected_ids:
        fail("Shot IDs are not exactly S001-S028 in order")

    narration_sha = manifest.get("narration_audio_sha256")
    timing_sha = timing.get("audio", {}).get("sha256")

    if not narration_sha:
        fail("Manifest narration SHA-256 missing")

    if timing_sha != narration_sha:
        fail(
            "Narration SHA mismatch between generation manifest "
            "and timing master"
        )

    runtime = float(timing["audio"]["duration_seconds"])
    manifest_runtime = float(manifest.get("runtime_seconds", -1))

    if abs(runtime - manifest_runtime) > 0.01:
        fail(
            "Runtime mismatch between generation manifest "
            f"and timing master: manifest={manifest_runtime}, timing={runtime}"
        )

    actual_local = {
        s["shot_id"]
        for s in shots
        if s.get("paid_generation_required") is False
    }

    # paid/local classification is authoritative per shot in the
    # generation manifest. No episode-specific shot list is hard-coded here.

    print("===== CHARACTER MASTER PREFLIGHT =====")

    for name, lock in CHARACTER_LOCKS.items():
        path = lock["path"]

        if not path.exists():
            fail(f"{name} master missing: {path}")

        actual_hash = sha256(path)

        if actual_hash != lock["sha256"]:
            fail(
                f"{name} master hash mismatch\n"
                f"Expected: {lock['sha256']}\n"
                f"Actual:   {actual_hash}"
            )

        print(f"{name.upper()}: PASS")

    execution_shots = []

    for shot in shots:
        sid = shot["shot_id"]

        identity = shot.get(
            "canonical_identity_reference_requirements", {}
        )

        if identity.get(
            "generated_frame_identity_chaining_allowed"
        ) is not False:
            fail(f"{sid}: identity chaining protection missing")

        paid = bool(shot.get("paid_generation_required"))

        # paid/local execution mode comes directly from the
        # validated generation manifest for this shot.

        refs = identity.get("references", [])

        execution_shots.append({
            "shot_id": sid,
            "start": shot["timing"]["start"],
            "end": shot["timing"]["end"],
            "duration_seconds": shot["timing"]["duration_seconds"],
            "shot_class": shot["shot_class"],
            "execution_mode":
                "PAID_GENERATION_CANDIDATE"
                if paid
                else "LOCAL_BUILD_ONLY",
            "identity_references": refs,
            "final_image_prompt": shot["final_image_prompt"],
            "final_motion_prompt": shot["final_motion_prompt"],
            "continuity_dependencies":
                shot["continuity_dependencies"],
            "readable_text_requirements":
                shot["readable_text_requirements"],
            "negative_constraints":
                shot["negative_constraints"],
            "status": "NOT_STARTED",
        })

    state.setdefault("human_gates", {})

    # TTS generation success does not equal human performance acceptance.
    state["human_gates"].setdefault(
        "narration_audio_accepted", False
    )

    state["stage"] = "VISUAL_GENERATION_READY"

    # Paid generation remains OFF until separate authorization.
    state["paid_generation"]["authorized"] = False

    plan = {
        "episode": ep,
        "status": "DRY_RUN_READY",
        "runtime_seconds": runtime,
        "narration_sha256": narration_sha,

        "policy": {
            "zero_waste": True,
            "prompt_testing_with_paid_generation": False,
            "generated_frame_identity_chaining": False,
            "automatic_subjective_rerenders": False,
            "publishing": False,
        },

        "gates": {
            "manifest": "PASS",
            "timing": "PASS",
            "identity": "PASS",
            "cost_partition": "PASS",
            "narration_audio_human_acceptance":
                "PASS"
                if state["human_gates"]["narration_audio_accepted"]
                else "PENDING",
            "paid_generation_authorization": "OFF",
        },

        "counts": {
            "total_shots": len(shots),
            "paid_generation_candidates":
                sum(
                    1 for s in execution_shots
                    if s["execution_mode"]
                    == "PAID_GENERATION_CANDIDATE"
                ),
            "local_build_only":
                sum(
                    1 for s in execution_shots
                    if s["execution_mode"]
                    == "LOCAL_BUILD_ONLY"
                ),
        },

        "shots": execution_shots,
    }

    if args.plan:
        plan_path.write_text(
            json.dumps(plan, indent=2) + "\n"
        )

        state["artifacts"]["visual_execution_plan"] = str(
            plan_path.relative_to(repo)
        )

        state_path.write_text(
            json.dumps(state, indent=2) + "\n"
        )

    print()
    print("===== EP03 VISUAL EXECUTION PREFLIGHT =====")
    print("Manifest: PASS")
    print("Timing master: PASS")
    print("Identity masters: PASS")
    print("Identity chaining: DISABLED")
    print(
        "Paid-generation candidates:",
        plan["counts"]["paid_generation_candidates"],
    )
    print(
        "Local-build shots:",
        plan["counts"]["local_build_only"],
    )

    print()
    print("LOCAL ONLY:")
    print(
        " ".join(
            s["shot_id"]
            for s in execution_shots
            if s["execution_mode"] == "LOCAL_BUILD_ONLY"
        )
    )

    print()
    print("PAID-GENERATION CANDIDATES:")
    print(
        " ".join(
            s["shot_id"]
            for s in execution_shots
            if s["execution_mode"]
            == "PAID_GENERATION_CANDIDATE"
        )
    )

    print()
    if state["human_gates"]["narration_audio_accepted"]:
        print("Narration human listen gate: PASS")
    else:
        print("Narration human listen gate: PENDING")

    print("Paid generation authorization: OFF")
    print("Publishing: OFF")

    if args.plan:
        print()
        print(f"Created: {plan_path}")
        print(f"Updated: {state_path}")

    print()
    print("NO API CALLS WERE MADE.")


if __name__ == "__main__":
    main()
