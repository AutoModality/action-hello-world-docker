#!/bin/sh -l

who_to_greet=$1
shared_files=$2

echo "docker pwd $(pwd)"

message="Hello $who_to_greet"


#https://help.github.com/en/actions/automating-your-workflow-with-github-actions/development-tools-for-github-actions#add-a-system-path-add-path
file="hello-world.txt"
file_path="::add-path::/$file"
echo "$message" > $file

time=$(date)
tag=refs/tags/1.1.0-rc.3

echo ::set-output name=message::$message
echo ::set-output name=time::$time
echo ::set-output name=os::$OSTYPE
echo ::set-output name=file::$file_path
