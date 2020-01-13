#!/bin/bash

# given the directory that the Github Actions cache will use, this will load the image from cache making it available

# see BB-790 
cache_dir=$1
docker_image=$(cat .github/docker-image.txt)
docker_version=$(cat .github/docker-version.txt)

if [[ -n $cache_dir ]]; then
    echo "usage: ./docker-cache.sh {path to cache dir}"
fi
archive_file=$cache_dir/cache.tar.gz

echo "Docker Image = $docker_image -> $docker_version"

# pull and save the image to the cache file
if [[ ! -f "$FILE" ]]; then
    mkdir -p $cache_dir
    docker pull $docker_version
    docker save --output $archive_file $docker_image
fi

# always load the cache file so the image is available
docker load --input $archive_file