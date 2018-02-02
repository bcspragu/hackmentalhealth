#!/bin/bash
# build-docker-container.sh builds the Dockerfile in this directory, and then
# runs a setup script. The Docker image comes with NodeJS, NPM, Yarn, Git, and
# the Heroku command-line tool. The setup script downloads all dependencies 
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t hmh-env $DIR
docker run \
  -it \
  -p 8080:8080 \
  -u $(id -u):$(id -g) \
  --mount type=bind,source=$DIR,destination=/project \
  --rm \
  hmh-env /project/docker-init.sh
