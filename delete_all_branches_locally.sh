#!/bin/bash
#Written by isajediknight
for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master)$'); do
    git branch -D "${branch##*/}"
done

#Run by executing:
#sh delete_all_branches_locally.sh
