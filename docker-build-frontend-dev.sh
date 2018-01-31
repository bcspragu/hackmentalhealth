#!/bin/bash
# docker-build-frontend-dev.sh handles watching the files in the frontend
# directory, and rebuilding them when they change. The compiled files are built
# to frontend/dist. To serve those files, run the backend with the
# ./docker-run-server.sh script.
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t hmh-env $DIR
docker run \
  -it \
  -u $(id -u):$(id -g) \
  --mount type=bind,source=$DIR,destination=/project \
  --rm \
  --workdir /project/frontend \
  hmh-env yarn exec ng build -- --watch
