#!/bin/bash

echo "Deleting old publication"
rm -rf public
mkdir public
git worktree prune
rm -rf .git/worktrees/public/

echo "Checking out gh-pages branch into public"
git worktree add -B master public upstream/master

echo "Removing existing files"
rm -rf public/*

echo "Generating site"
hugo
git add .
git commit -m "Publishing to hugo content"
git push upstream hugo

echo "Updating gh-pages branch"
cp assets ./public/assets
cd public
git add .
git commit -m "Publishing to gh-pages (publish.sh)"
git push upstream master -f