#!/bin/bash

echo "=============================="
echo "        LINUX AUDIT"
echo "=============================="

echo ""
echo "1. SSH STATUS"
systemctl is-active ssh

echo ""
echo "2. OPEN PORTS"
sudo ss -tuln

echo ""
echo "3. FIREWALL STATUS"
sudo ufw status

echo ""
echo "4. SUDO USERS"
getent group sudo

echo ""
echo "=============================="
echo "       AUDIT COMPLETED"
echo "=============================="