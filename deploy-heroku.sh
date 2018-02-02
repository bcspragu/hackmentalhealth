#!/bin/sh
cd /project/frontend
npm run ng build
cd /project
sed 's/#[^("|'')]*$//;s/^#.*$//' prod.env | xargs heroku config:set
git push heroku master
