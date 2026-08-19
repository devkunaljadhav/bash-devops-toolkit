#!/bin/bash

echo "=============================="
echo "    WEBSITE UPTIME CHECKER"
echo "=============================="

read -p "Enter website URL: " WEBSITE

if curl -Is --max-time 10 "$WEBSITE" > /dev/null 2>&1
then
    echo "Website : UP"
else
    echo "Website : DOWN"
fi

echo "=============================="