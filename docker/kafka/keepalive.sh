#!/bin/bash

cleanup ()
{
    echo "process ended"
    exit 0
}

trap cleanup SIGINT SIGTERM

while [ 1 ]
do
    eval "$@"
    echo "restart -> $@"
    sleep 5s
done