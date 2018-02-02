#!/bin/sh

yarn
cd /project/frontend
npm install
cd /project
HOME=/project heroku login
