#!/bin/bash

# set -x
set -e

VERSION=${1:-24}
echo $VERSION
docker build -t heroku-buildpack-imagemagick-webp -f "Dockerfile.$VERSION" .
mkdir -p build

docker run --rm -t -v $PWD/build:/data heroku-buildpack-imagemagick-webp sh -c 'cp -f /usr/src/imagemagick/build/*.tar.gz /data/'
