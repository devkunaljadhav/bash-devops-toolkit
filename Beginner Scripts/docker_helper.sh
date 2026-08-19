#!/bin/bash

echo "=============================="
echo "        DOCKER HELPER"
echo "=============================="

echo "1. Build Image"
echo "2. Run Container"
echo "3. Stop Container"
echo "4. Remove Container"

read -p "Enter choice: " CHOICE

if [ "$CHOICE" -eq 1 ]
then
    read -p "Enter image name: " IMAGE
    docker build -t "$IMAGE" .

elif [ "$CHOICE" -eq 2 ]
then
    read -p "Enter image name: " IMAGE
    read -p "Enter container name: " CONTAINER
    docker run -d --name "$CONTAINER" "$IMAGE"

elif [ "$CHOICE" -eq 3 ]
then
    read -p "Enter container name: " CONTAINER
    docker stop "$CONTAINER"

elif [ "$CHOICE" -eq 4 ]
then
    read -p "Enter container name: " CONTAINER
    docker rm "$CONTAINER"

else
    echo "Invalid choice."
fi

echo "=============================="