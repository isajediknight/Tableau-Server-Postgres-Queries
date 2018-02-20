#!/bin/bash
echo "< If you have any uncommited changes this script will fail >"
git checkout master
sh delete_all_branches_locally.sh
git fetch origin
sh pull_and_track_all_branches.sh
echo "< Be sure to change back to your original Feature Branch now >"
