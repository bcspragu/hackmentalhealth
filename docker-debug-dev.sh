#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t hmh-env $DIR
docker run \
  -it \
  -u $(id -u):$(id -g) \
  --mount type=bind,source=$DIR,destination=/project \
  --rm \
  hmh-env /bin/sh
