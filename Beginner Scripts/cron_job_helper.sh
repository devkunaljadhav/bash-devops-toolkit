#!/bin/bash

echo "=============================="
echo "       CRON JOB HELPER"
echo "=============================="

echo ""
echo "Your Cron Jobs:"
crontab -l 2>/dev/null

echo ""
echo "System Cron Directories:"
ls -l /etc/cron.*

echo ""
echo "Cron Helper Completed."
echo "=============================="