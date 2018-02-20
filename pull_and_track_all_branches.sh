#!/bin/bash
#Written by isajediknight
for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master)$'); do
    git branch --track "${branch##*/}" "$branch"
done

#Run by executing:
#sh pull_and_track_all_branches.sh
