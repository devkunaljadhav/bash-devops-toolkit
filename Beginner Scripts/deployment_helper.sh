#!/bin/bash

echo "=============================="
echo "      DEPLOYMENT HELPER"
echo "=============================="

read -p "Enter project directory: " PROJECT

cd "$PROJECT" || exit

echo ""
echo "Pulling latest code..."
git pull

echo ""
echo "Git status:"
git status

echo ""
read -p "Enter service name to restart: " SERVICE

sudo systemctl restart "$SERVICE"

echo ""
echo "$SERVICE restarted successfully."

echo "=============================="
echo "       DEPLOYMENT DONE"
echo "=============================="