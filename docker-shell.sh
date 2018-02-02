#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run \
  -it \
  -u $(id -u):$(id -g) \
  --mount type=bind,source=$DIR,destination=/project \
  --rm \
  hmh-env /project/shell-wrapper.sh
