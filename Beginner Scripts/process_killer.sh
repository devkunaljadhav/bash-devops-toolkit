#!/bin/bash
echo "================================================================================"
echo "                                  PROCESS KILLER                                "
echo "================================================================================"

######################################################################################

#Author : Kunal Jadhav
#Date : 18-08-2026
#This Script is finding Process they get high CPU and Kill The Process

######################################################################################

ps aux --sort=-%cpu | head

read -p "Enter PID to Kill :"PID

kill $PID

echo "Process $PID killed"
