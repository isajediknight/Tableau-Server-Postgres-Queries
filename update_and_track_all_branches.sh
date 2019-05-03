#!/bin/bash
#Written by: LB023593
#Purpose: To make all branches track remote HEAD
#         This is so when Luke merges in their code after a Release everyone's
#         local Branch will match what is in the remote repo

# For some reason ebi_dev gets returned 2x
# Once we switch to it once we won't switch to it again
ebi_dev_counter=0

# Delete old branches
git prune

# Delete old tags and re-add them
git tag -l | xargs git tag -d && git fetch -t

#Record the original branch so we can switch back to it
original_branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

#If there are modified tracked files which are uncommited the script will crash
#Catching that scenario here
if [[ `git status --porcelain --untracked-files=no` ]]; then
  echo ""
  echo "< Detected Uncommited Changes >"
  echo "Please commit your changes and run this script again"
  echo ""
else
  #We needto be in master branch to cleanup all other branches
  git checkout master
  sleep 0.2
  #Get all the updates to master if there are any
  git reset --hard origin/master
  sleep 0.2
  #Get updates to other branches if there are any
  git pull
  sleep 0.2
  echo ""
  echo "< Deleting local Branches >"
  echo ""
  #Loop through all branches and delete their local copies
  for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master)$'); do
	if [ "HEAD" == "${branch##*/}" ];then
      do_nothing=0
    elif [ "->" == "${branch##*/}" ];then
      do_nothing=0
    elif [ "ebi_dev" == "${branch##*/}" ] && [ $ebi_dev_counter -eq 0 ];then
      git branch -D "${branch##*/}"
      ebi_dev_counter=$((ebi_dev_counter+1))
    elif [ "ebi_dev" == "${branch##*/}" ] && [ $ebi_dev_counter -eq 1 ];then
      do_nothing=0
    else
      git branch -D "${branch##*/}"
    fi
	# Sometimes the scripts runs too quickly and we get an error
	sleep 0.2
  done
  
  echo ""
  echo "< Getting list of changes ... >"
  echo ""
  
  #Get list of changes
  git fetch origin
  
  echo ""
  echo "< Deleting local Branches which no longer exist in the remote repo >"
  echo ""
  
  #Delete branches locally which no longer exist in the remote repo
  git remote prune origin
  
  # For some reason ebi_dev gets returned 2x
  # Once we switch to it once we won't switch to it again
  ebi_dev_counter=0
  
  echo ""
  echo "< Recreating all local Branches and setting to track their remote HEAD >"
  echo ""
  
  #Loop through all branches and set their remote origin to be itself in the remote repo
  for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master)$'); do
	if [ "HEAD" == "${branch##*/}" ];then
      do_nothing=0
    elif [ "->" == "${branch##*/}" ];then
      do_nothing=0
    elif [ "ebi_dev" == "${branch##*/}" ] && [ $ebi_dev_counter == 0 ];then
      git branch --track "${branch##*/}" "$branch"
      ebi_dev_counter=$((ebi_dev_counter+1))
    elif [ "ebi_dev" == "${branch##*/}" ] && [ $ebi_dev_counter == 1 ];then
      do_nothing=0
    else
      git branch --track "${branch##*/}" "$branch"
    fi
	# Sometimes the scripts runs too quickly and we get an error
	sleep 0.2
  done
  
  echo ""
  echo "< Changing back to your Original Branch >"
  echo ""
  
  #Switch back to original branch we were on
  git checkout $original_branch
fi
