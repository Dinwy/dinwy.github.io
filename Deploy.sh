#!/bin/bash

echo "Generating site"
hugo

echo "Updating gh-pages branch"
cd public
git add .
git commit -m "Publishing to gh-pages (publish.sh)"
git push upstream master