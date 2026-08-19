#!/bin/bash

echo "=============================="
echo "        SYSTEM CLEANUP"
echo "=============================="

echo "Cleaning temporary files..."
sudo rm -rf /tmp/*

echo "Cleaning package cache..."
sudo apt clean

echo "Removing unused packages..."
sudo apt autoremove -y

echo "Cleaning completed."

echo "=============================="