#!/bin/sh -l

who_to_greet=$1
working_directory=$2

echo "docker pwd $(pwd)"
echo "workflow workspace $working_directory"

touch hello-world.txt
file="$workding_directory/hello-world.txt"

echo "Hello $who_to_greet"
time=$(date)
tag=refs/tags/1.1.0-rc.3
echo ::set-output name=time::$time
echo ::set-output name=os::$OSTYPE
echo ::set-output name=file::$file
