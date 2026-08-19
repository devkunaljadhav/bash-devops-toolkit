#!/bin/bash

echo "=============================="
echo "         LOG CLEANER"
echo "=============================="

LOG_DIR="/var/log"

echo "Old log files:"
sudo find "$LOG_DIR" -type f -name "*.log" -mtime +30

echo ""
echo "Log cleaning completed."
echo "=============================="