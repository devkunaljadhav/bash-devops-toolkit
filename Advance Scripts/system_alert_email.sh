#!/bin/bash
# ==============================================================================
# Author      : Kunal Jadhav
# Date        : 18-08-2026
# Description : Monitors CPU and Memory usage and sends an alert if threshold exceeds.
# ==============================================================================

echo "=================================================================="
echo "                   SYSTEM RESOURCE ALERT MONITOR                  "
echo "=================================================================="

# Alert Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
ALERT_EMAIL="devops-admin@example.com"    # Change to your alert email

# 1. Get current CPU usage percentage
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d'.' -f1)
if [ -n "$CPU_IDLE" ]; then
    CPU_USAGE=$((100 - CPU_IDLE))
else
    CPU_USAGE=0
fi

# 2. Get current Memory usage percentage
MEM_TOTAL=$(free | awk '/Mem:/ {print $2}')
MEM_USED=$(free | awk '/Mem:/ {print $3}')
if [ "$MEM_TOTAL" -gt 0 ]; then
    MEM_USAGE=$((MEM_USED * 100 / MEM_TOTAL))
else
    MEM_USAGE=0
fi

echo "Current CPU Usage : ${CPU_USAGE}% (Threshold: ${CPU_THRESHOLD}%)"
echo "Current RAM Usage : ${MEM_USAGE}% (Threshold: ${MEM_THRESHOLD}%)"
echo "------------------------------------------------------------------"

ALERT_TRIGGERED=false
ALERT_MSG="System Resource Alert on $(hostname) at $(date):\n\n"

if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ]; then
    echo "[WARNING] High CPU usage detected: ${CPU_USAGE}%"
    ALERT_MSG="${ALERT_MSG}- CPU Usage is High: ${CPU_USAGE}%\n"
    ALERT_TRIGGERED=true
fi

if [ "$MEM_USAGE" -ge "$MEM_THRESHOLD" ]; then
    echo "[WARNING] High Memory usage detected: ${MEM_USAGE}%"
    ALERT_MSG="${ALERT_MSG}- Memory Usage is High: ${MEM_USAGE}%\n"
    ALERT_TRIGGERED=true
fi

if [ "$ALERT_TRIGGERED" = true ]; then
    echo "[ALERT] Sending notification to $ALERT_EMAIL ..."
    # Send email if mail command is installed
    if command -v mail &> /dev/null; then
        echo -e "$ALERT_MSG" | mail -s "ALERT: High Resource Usage on $(hostname)" "$ALERT_EMAIL"
        echo "[SUCCESS] Alert email sent."
    else
        echo "[INFO] 'mail' command not installed. Displaying alert on screen:"
        echo -e "$ALERT_MSG"
    fi
else
    echo "[OK] System resources are within normal limits."
fi

echo "=================================================================="
