#!/bin/bash
echo "=========================================================================="
echo "                             Service Monitor                              "
echo "=========================================================================="
#################################################################################

#Author : Kunal
#Date : 18-08-2026
#This Script for only Check the Status of the Services
#Only For the SSH,Nginx,Apache Status Check 
################################################################################


if systemctl is-active --quiet ssh; then
	echo "SSH Service : Running"
else 
	echo "SSH Service :Not Running"
fi

if systemctl is-active --quiet nginx; then 
	echo "Nginx Service : Running"
else 
	echo "Nginx Service : Not Running"
fi

if systemctl is-active --quiet httpd; then
	echo "Apache Service : Running"
else 
	echo "Apache Service : Not Running"
fi
