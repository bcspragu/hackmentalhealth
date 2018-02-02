#!/bin/sh
cd /project/frontend
npm run ng build
cd /project
git push heroku master
