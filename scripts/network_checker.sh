#!/bin/bash
echo "================================================================"
echo "                       NETWORK CHECKER                          "
echo "================================================================"
#####################################################################################

#Author : Kunal jadhav
#Date : 18-08-2026
#This Script Check the Network 

####################################################################################


if ping -c 2 8.8.8.8 > /dev/null 2>&1 
then
	echo "Internet : OK"
else 
	echo "Internet : DOWN"
fi

if ping -c 2 google.com > /dev/null 2>&1
then
	echo "DNS : Working"
else 
	echo "DNS : Not Working"
fi

if curl -ls https://google.com > /dev/null 2>&1
then
	echo "Google : Working"
else 
	echo "Google : Not Working"
fi

			
#echo "DNS     :$(nslookup google.com)"
#echo "Google  :$(dig google.com)"
#echo "Port 22 :$(curl -l https://google.com)"
