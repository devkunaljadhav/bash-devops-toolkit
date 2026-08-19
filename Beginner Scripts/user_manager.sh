#!/bin/bash

echo "=============================="
echo "        USER MANAGER"
echo "=============================="

read -p "Enter username: " USER

sudo useradd "$USER"

sudo passwd "$USER"

sudo usermod -aG sudo "$USER"

echo "User $USER created successfully."

echo "Locking user..."
sudo passwd -l "$USER"

echo "Unlocking user..."
sudo passwd -u "$USER"

echo "User management completed."

echo "=============================="