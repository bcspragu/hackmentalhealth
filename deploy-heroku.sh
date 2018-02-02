#!/bin/sh

# Go into the frontend directory and build a compiled version of our site.
cd /project/frontend
npm run build

cd /project
# Update Heroku's configuration to include the latest variables from our prod
# environment configuration.
sed 's/#[^("|'')]*$//;s/^#.*$//' prod.env | xargs heroku config:set

# Deploy to Heroku.
git push heroku master
