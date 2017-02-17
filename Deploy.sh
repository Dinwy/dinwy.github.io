#!/bin/bash

echo "Generating site"
hugo
git add content/
git commit -m "Publishing to hugo content"
git push upstream hugo

echo "Updating gh-pages branch"
cd public
git add .
git commit -m "Publishing to gh-pages (publish.sh)"
git push upstream master