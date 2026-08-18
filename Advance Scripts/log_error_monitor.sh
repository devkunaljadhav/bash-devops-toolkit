#!/bin/bash
# ==============================================================================
# Author      : Kunal Jadhav
# Date        : 18-08-2026
# Description : Scans log files for errors, warnings, and shows recent error logs.
# ==============================================================================

echo "=================================================================="
echo "                       LOG ERROR MONITOR                          "
echo "=================================================================="

# Log file path (can be passed as argument or default to /var/log/syslog)
LOG_FILE="${1:-/var/log/syslog}"

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "[ERROR] Log file $LOG_FILE not found!"
    echo "Usage: ./log_error_monitor.sh /path/to/logfile.log"
    exit 1
fi

echo "[INFO] Scanning Log File: $LOG_FILE"
echo "------------------------------------------------------------------"

# Count errors and warnings
ERROR_COUNT=$(grep -i -c "error" "$LOG_FILE" 2>/dev/null || echo "0")
WARN_COUNT=$(grep -i -c "warning" "$LOG_FILE" 2>/dev/null || echo "0")
CRITICAL_COUNT=$(grep -i -c "critical" "$LOG_FILE" 2>/dev/null || echo "0")

echo "Total Errors   : $ERROR_COUNT"
echo "Total Warnings : $WARN_COUNT"
echo "Total Critical : $CRITICAL_COUNT"
echo "------------------------------------------------------------------"

# Display last 5 error messages
if [ "$ERROR_COUNT" -gt 0 ]; then
    echo "[ALERT] Last 5 Error entries in log:"
    grep -i -n "error" "$LOG_FILE" | tail -n 5
else
    echo "[OK] No errors found in $LOG_FILE."
fi

echo "=================================================================="
