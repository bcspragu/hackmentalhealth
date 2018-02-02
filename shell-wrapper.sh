#!/bin/sh
set -e

if [ -e /project/.netrc ]
then
  cp /project/.netrc $HOME/.netrc
fi
/bin/sh
