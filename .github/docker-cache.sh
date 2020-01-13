#!/bin/bash

# given the directory that the Github Actions cache will use, this will load the image from cache making it available

# see BB-790 
cache_dir=${1-:$(mktemp)}
docker_image=$(cat .github/docker-image.txt)
docker_version=$(cat .github/docker-version.txt)

archive_file=$cache_dir/cache.tar.gz

echo "Docker Image = $docker_image -> $docker_version"

# pull and save the image to the cache file
if [[ ! -f "$archive_file" ]]; then
    mkdir -p $cache_dir
    docker pull $docker_version
    echo "Saving $docker_image to $archive_file"
    docker save --output $archive_file $docker_version
fi

echo "Loading $docker_image from $archive_file"

# always load the cache file so the image is available
docker load --input $archive_file