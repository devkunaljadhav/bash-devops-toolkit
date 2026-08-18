#!/bin/bash
# ==============================================================================
# Author      : Kunal Jadhav
# Date        : 18-08-2026
# Description : Checks SSL/TLS Certificate expiration date and alerts if expiring soon.
# ==============================================================================

echo "=================================================================="
echo "                   SSL CERTIFICATE EXPIRY CHECKER                 "
echo "=================================================================="

# Domain name to check (passed as argument or default to google.com)
DOMAIN="${1:-google.com}"
PORT="443"
ALERT_DAYS=30

echo "[INFO] Checking SSL certificate for: $DOMAIN:$PORT"

# Check if openssl is installed
if ! command -v openssl &> /dev/null; then
    echo "[ERROR] OpenSSL command is not installed!"
    exit 1
fi

# Fetch expiry date from SSL handshake
EXPIRY_DATE=$(echo | openssl s_client -servername "$DOMAIN" -connect "${DOMAIN}:${PORT}" 2>/dev/null | openssl x509 -noout -enddate 2>/dev/null | cut -d= -f2)

if [ -z "$EXPIRY_DATE" ]; then
    echo "[ERROR] Could not fetch SSL certificate for $DOMAIN"
    exit 1
fi

# Calculate days remaining
EXPIRY_EPOCH=$(date -d "$EXPIRY_DATE" +%s 2>/dev/null || date -j -f "%b %d %T %Y %Z" "$EXPIRY_DATE" +%s 2>/dev/null)
CURRENT_EPOCH=$(date +%s)
DAYS_REMAINING=$(( (EXPIRY_EPOCH - CURRENT_EPOCH) / 86400 ))

echo "Domain Name    : $DOMAIN"
echo "Certificate Expiry Date : $EXPIRY_DATE"
echo "Days Remaining : $DAYS_REMAINING day(s)"
echo "------------------------------------------------------------------"

if [ "$DAYS_REMAINING" -le 0 ]; then
    echo "[CRITICAL] SSL Certificate for $DOMAIN has EXPIRED!"
elif [ "$DAYS_REMAINING" -le "$ALERT_DAYS" ]; then
    echo "[WARNING] SSL Certificate will expire soon in $DAYS_REMAINING days! Please renew."
else
    echo "[OK] SSL Certificate is valid and healthy."
fi

echo "=================================================================="
