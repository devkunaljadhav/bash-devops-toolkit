#!/bin/bash
# ==============================================================================
# Author      : Kunal Jadhav
# Date        : 18-08-2026
# Description : Scans and checks status of key DevOps network ports on a host.
# ==============================================================================

echo "=================================================================="
echo "                     DEVOPS PORT SCANNER                          "
echo "=================================================================="

# Target Host (default is localhost)
HOST="${1:-127.0.0.1}"
TIMEOUT=2

# Common DevOps ports to scan
PORTS=(22 80 443 3306 5432 6379 8080 9090 3000)
PORT_NAMES=("SSH" "HTTP" "HTTPS" "MySQL" "PostgreSQL" "Redis" "Jenkins/App" "Prometheus" "Grafana/Node")

echo "[INFO] Scanning ports on host: $HOST"
echo "------------------------------------------------------------------"
printf "%-10s %-18s %-12s\n" "Port" "Service" "Status"
echo "------------------------------------------------------------------"

for i in "${!PORTS[@]}"; do
    PORT="${PORTS[$i]}"
    SERVICE="${PORT_NAMES[$i]}"
    
    # Check port using bash TCP pseudo-device with timeout
    if (echo > /dev/tcp/"$HOST"/"$PORT") >/dev/null 2>&1; then
        STATUS="OPEN [OK]"
    else
        STATUS="CLOSED"
    fi
    
    printf "%-10s %-18s %-12s\n" "$PORT" "$SERVICE" "$STATUS"
done

echo "------------------------------------------------------------------"
echo "[SUCCESS] Port scan completed."
echo "=================================================================="
