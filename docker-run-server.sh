#!/bin/bash
# docker-run-server.sh runs the backend HTTP and WebSocket server, which serves
# the frontend and sends requests to the DialogFlow (API.ai) backend. To
# rebuild the frontend when files change, run the
# ./docker-build-frontend-dev.sh script.
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t hmh-env $DIR
docker run \
  -it \
  -p 8080:8080 \
  -u $(id -u):$(id -g) \
  --mount type=bind,source=$DIR,destination=/project \
  --rm \
  hmh-env node index.js
