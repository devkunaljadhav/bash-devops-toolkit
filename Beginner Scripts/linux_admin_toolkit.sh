#!/bin/bash

while true
do

echo ""
echo "================================"
echo "     LINUX ADMIN TOOLKIT"
echo "================================"
echo "1. System Information"
echo "2. Disk Usage"
echo "3. Memory Usage"
echo "4. Running Processes"
echo "5. Network Check"
echo "6. Service Status"
echo "7. Exit"
echo "================================"

read -p "Enter your choice: " CHOICE

if [ "$CHOICE" -eq 1 ]
then
    echo ""
    echo "Hostname : $(hostname)"
    echo "OS       : $(grep '^PRETTY_NAME=' /etc/os-release | cut -d '"' -f2)"
    echo "Kernel   : $(uname -r)"
    echo "Uptime   : $(uptime -p)"

elif [ "$CHOICE" -eq 2 ]
then
    echo ""
    df -h /

elif [ "$CHOICE" -eq 3 ]
then
    echo ""
    free -h

elif [ "$CHOICE" -eq 4 ]
then
    echo ""
    ps aux --sort=-%cpu | head

elif [ "$CHOICE" -eq 5 ]
then
    echo ""
    if ping -c 2 8.8.8.8 > /dev/null 2>&1
    then
        echo "Internet : Connected"
    else
        echo "Internet : Not Connected"
    fi

elif [ "$CHOICE" -eq 6 ]
then
    read -p "Enter service name: " SERVICE

    if systemctl is-active --quiet "$SERVICE"
    then
        echo "$SERVICE : Running"
    else
        echo "$SERVICE : Stopped"
    fi

elif [ "$CHOICE" -eq 7 ]
then
    echo "Exiting toolkit..."
    exit 0

else
    echo "Invalid choice."
fi

done