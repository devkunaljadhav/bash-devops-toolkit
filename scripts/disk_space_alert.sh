echo "=============================================================================="
echo "                                DISK SPACE CHECK                              "
echo "=============================================================================="
#####################################################################################

#Author : Kunal
#Date : 18-08-2026
#This Script Shows The Disk Space and Skow the alert

####################################################################################

#set -o

#df -h

#df -h / | awk 'NR==2{print $5}'

THRESHOLD=80
DISK_USAGE=$(df -h / | awk 'NR==2{print $5}' | tr -d '%')

echo "Disk Usage : ${DISK_USAGE}%"
echo "THRESHOLD  : ${THRESHOLD}%"


if [ "$DISK_USAGE" -ge "$THRESHOLD" ]; then
	echo "WARNING : Disk usage is above ${THRESHOLD}%!"
else 
	echo "Disk usage is Normal."
fi

echo "================================================================================"


