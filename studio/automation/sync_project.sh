#!/bin/bash

echo "Syncing Truth Explains project..."

./studio/automation/fix_project_structure.sh
./studio/automation/organize_project_files.sh
python studio/automation/update_launch_tracker.py
./studio/automation/check_project_structure.sh

echo "Sync complete."
