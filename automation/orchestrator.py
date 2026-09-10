#!/usr/bin/env python3
from pathlib import Path
import argparse,json
p=argparse.ArgumentParser()
p.add_argument("state")
p.add_argument("--status",action="store_true")
a=p.parse_args()
s=json.loads(Path(a.state).read_text())
print("Episode:",s["episode"])
print("Stage:",s["stage"])
print("Paid generation authorized:",s["paid_generation"]["authorized"])
for k,v in s["gates"].items(): print("Gate",k+":",v)
for k,v in s["platforms"].items(): print("Platform",k+":",v["status"])
print("Foundation mode: paid generation and publishing are hard-disabled.")
