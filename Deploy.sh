#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo

git add .
git commit -m "Update hugo `date`"
# Push source and build repos.
  git push origin hugo

# Add changes to git.
cd public
git add .

git push origin master
# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
  fi
  git commit -m "$msg"