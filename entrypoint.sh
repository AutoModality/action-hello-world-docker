#!/bin/sh -l

who_to_greet=$1
staging_dir=/github/home

message="Hello $who_to_greet"


file="hello-world.txt"
file_path="$staging_dir/$file"

echo "Saving $message to $file_path"
echo "$message" > $file_path

workflow_file_path="/home/runner/work/_temp/_github_home/$file"
time=$(date)
tag=refs/tags/1.1.0-rc.3

echo ::set-output name=message::$message
echo ::set-output name=time::$time
echo ::set-output name=os::$OSTYPE
echo ::set-output name=file::$workflow_file_path
