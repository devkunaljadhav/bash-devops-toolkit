#!/bin/bash
# ==============================================================================
# Author      : Kunal Jadhav
# Date        : 18-08-2026
# Description : Logs CPU and Memory spike events with top processes into a log file.
# ==============================================================================

echo "=================================================================="
echo "                  RESOURCE SPIKE LOGGER                           "
echo "=================================================================="

LOG_FILE="./system_spikes.log"
CPU_LIMIT=75
MEM_LIMIT=75
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Check current CPU and RAM usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d'.' -f1)
MEM_USAGE=$(free | awk '/Mem:/ {printf "%.0f", $3*100/$2}')

echo "Timestamp     : $TIMESTAMP"
echo "Current CPU % : ${CPU_USAGE}%"
echo "Current RAM % : ${MEM_USAGE}%"
echo "Log File      : $LOG_FILE"
echo "------------------------------------------------------------------"

if [ "$CPU_USAGE" -ge "$CPU_LIMIT" ] || [ "$MEM_USAGE" -ge "$MEM_LIMIT" ]; then
    echo "[WARNING] Resource spike detected! Logging top processes..."
    
    {
        echo "=========================================================="
        echo "SPIKE EVENT AT: $TIMESTAMP"
        echo "CPU Usage: ${CPU_USAGE}% | Memory Usage: ${MEM_USAGE}%"
        echo "----------------------------------------------------------"
        echo "TOP 5 CPU PROCESSES:"
        ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 6
        echo ""
        echo "TOP 5 MEMORY PROCESSES:"
        ps -eo pid,user,%cpu,%mem,comm --sort=-%mem | head -n 6
        echo "=========================================================="
        echo ""
    } >> "$LOG_FILE"
    
    echo "[SUCCESS] Spike details recorded in $LOG_FILE"
else
    echo "[OK] No spikes detected. System load is within normal thresholds."
fi

echo "=================================================================="
