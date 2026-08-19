#!/bin/bash

echo "=============================="
echo "       PERMISSION FIXER"
echo "=============================="

read -p "Enter file name: " FILE

if [ -f "$FILE" ]
then
    echo "Current permissions:"
    ls -l "$FILE"

    chmod 644 "$FILE"

    echo "Permissions fixed:"
    ls -l "$FILE"
else
    echo "File does not exist."
fi

echo "=============================="