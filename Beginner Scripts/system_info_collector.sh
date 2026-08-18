#!/bin/bash
echo "============================================================================"
echo "                             SYSTEM INFORMATION                             "
echo "============================================================================"

###################################################################################

#Author : Kunal Jadhav
#Date : 18-08-2026
#This Script for collect the System Information

###################################################################################
#. /etc/os-release

#echo "Hostname     : $(hostname)"
#echo "OS           : $PRETTY_NAME"
#echo "Kernal       : $(uname -r)"
#echo "CPU          : $(lscpu | grep 'Model name' | cut -d ':' -f2 | xargs) "
#echo "Memory       : $(free -h) | awk 'Mem:/ {print $3 "/" $2}')"
#echo "Disk         : $(df -h / | awk 'NR==2 {print $3 "used /" $2" total ("$5")"}')"
#echo "IP Address   : $(hostanme -l | awk '{print $1}')"
#echo "Uptime       : $(uptime -p)"
#echo "Users Logged : $(who | wc -l)"

#echo "============================================================================="


echo "Hostname   :" $(hostname)

echo "OS         :" $(cat /etc/os-release | grep PRETTY_NAME)

echo "Kernel     :" $(uname -r)

echo "CPU        :" $(lscpu | grep "Model name")

echo "Memory     :" $(free -h)

echo "Disk       :" $(df -h /)

echo "IP Address :" $(hostname -I)

echo "Uptime     :" $(uptime -p)

echo "Users LoggedIn:" $(who)

echo "========================================"
