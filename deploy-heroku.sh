#!/bin/sh

# Go into the frontend directory and build a compiled version of our site.
cd /project/frontend
npm run build

cd /project

git checkout -b release
git add -f frontend/dist/
git config user.name 'Heroku'
git config user.email '<>'
git commit -m "AUTOMATED PUSH TO HEROKU"

# Update Heroku's configuration to include the latest variables from our prod
# environment configuration.
sed 's/#[^("|'')]*$//;s/^#.*$//' prod.env | xargs heroku config:set

# Deploy to Heroku.
git push heroku release:master
git checkout master
git branch -D release
