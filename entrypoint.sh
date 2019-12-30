#!/bin/sh -l

who_to_greet=$1
staging_dir=/github/home

echo "docker pwd $(pwd)"

message="Hello $who_to_greet"


#https://help.github.com/en/actions/automating-your-workflow-with-github-actions/development-tools-for-github-actions#add-a-system-path-add-path
file="hello-world.txt"
file_path="$staging_dir/$file"

echo "Saving $message to $file_path"
echo "$message" > $file

ls -l /github/home


time=$(date)
tag=refs/tags/1.1.0-rc.3

echo ::set-output name=message::$message
echo ::set-output name=time::$time
echo ::set-output name=os::$OSTYPE
echo ::set-output name=file::$file_path
