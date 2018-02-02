#!/bin/sh
# docker-init.sh sets up the directory with all the dependencies for our NodeJS
# server and Angular5 client. It also logs us into our Heroku account.
set -e

# Install our server dependencies.
yarn

# Go into the frontend directory.
cd /project/frontend
# Install our frontend dependencies.
npm install

# Go back to the root project directory
cd /project
heroku login
cp $HOME/.netrc /project
