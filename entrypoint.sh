#!/bin/sh -l

who_to_greet=$1
working_directory=$2

echo "docker pwd $(pwd)"
echo "workflow workspace $working_directory"

echo "Hello $who_to_greet"
time=$(date)
tag=refs/tags/1.1.0-rc.3
echo ::set-output name=time::$time
echo ::set-output name=os::$OSTYPE
echo ::set-output name=tag::$OSTYPE
echo ::set-output name=branch::$OSTYPE