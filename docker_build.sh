#!/bin/bash

set -e

BASE_DIR=$(pwd)
export DOCKER_BUILDKIT=${DOCKER_BUILDKIT:-1}

if [[ -z $1 ]]; then
    echo Specify containers to run 'docker build . -t ARG --build-arg CACHE_DATE=$(date)' against/
    echo e.g. 'docker_build.sh base,steamcmd,l4d2,l4d2-metamod'
    exit 1
fi

for i in $(echo $1 | sed "s/,/ /g")
do
    echo "Building ${i}..."
    cd ${i}
    echo "Using CACHE_DATE in case updates have been made..."
        docker build \
        --build-arg CACHE_DATE="$(date)" \
        -t ${i} \
        -t ${i}:latest \
        -t ${i}:$(date +"%Y%m%d-%H%M%S") \
        .
    cd ${BASE_DIR}
done

echo "Done! Bye for now!"
