#!/bin/sh

yarn
cd /project/frontend
npm install
cd /project
heroku login
rm -rf .ash_history .cache/ .config/ .local/ .npm/ .yarnrc
