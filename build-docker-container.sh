#!/bin/bash
# setup-environment.sh handles watching the files in the frontend
# directory, and rebuilding them when they change. The compiled files are built
# to frontend/dist. To serve those files, run the backend with the
# ./docker-run-server.sh script.
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
