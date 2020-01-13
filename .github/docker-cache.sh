#!/bin/bash

# reads the Dockerfile for the docker image name and sets it up for caching.
# NOTE: the first line of the Dockerfile must be `FROM docker-image`

set -e

# see BB-790 
cache_dir=${1-~/tmp/docker}
dockerfile_from_line=$(head -n 1 Dockerfile)

echo "line  $dockerfile_from_line"

docker_image=$(awk -F' '  '{print $2}' <<< $dockerfile_from_line)

archive_file=$cache_dir/cache.tar.gz

echo "Docker Image = $docker_image"

# pull and save the image to the cache file
if [[ ! -f "$archive_file" ]]; then
    mkdir -p $cache_dir
    docker pull $docker_image
    echo "Saving $docker_image to $archive_file"
    docker save --output $archive_file $docker_image
else
    echo "Image found in $archive_file"
fi

echo "Loading $docker_image from $archive_file"

# always load the cache file so the image is available
docker load --input $archive_file