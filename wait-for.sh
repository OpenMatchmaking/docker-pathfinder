#!/usr/bin/env bash


MAX_TRIES=5

HOST=$1
PORT=$2
TIMEOUT=$3
CONTAINER_NAME=$4

attempt=1
while [ $attempt -le $MAX_TRIES ]; do
    netcat_check=$(nc -z ${HOST} ${PORT} 2>&1)

    if [[ $? == 0 ]]; then
        echo -e "\033[32m$CONTAINER_NAME container is up!\033[0m"
        break
    fi

    echo -e "\033[33mWaiting for $CONTAINER_NAME container... (attempt: $((attempt++)))\033[0m"
    sleep $TIMEOUT
done


if [ $attempt -gt $MAX_TRIES ]; then
    echo -e "\033[31mError: $CONTAINER_NAME is not responding, cancelling set up.\033[0m"
    exit 1
fi
