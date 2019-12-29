#!/bin/sh -l

who_to_greet=$1
shared_files=$2

echo "docker pwd $(pwd)"
echo "shared files $shared_files"
ls -l $shared_files

file="$shared_files/hello-world.txt"
touch $file
ls -l $file

echo "Hello $who_to_greet"
time=$(date)
tag=refs/tags/1.1.0-rc.3
echo ::set-output name=time::$time
echo ::set-output name=os::$OSTYPE
echo ::set-output name=file::$file
