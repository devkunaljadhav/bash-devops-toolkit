#!/bin/bash

echo "=============================="
echo "       PACKAGE INSTALLER"
echo "=============================="

sudo apt update

sudo apt install -y git curl wget vim htop net-tools

echo "=============================="
echo "Packages installed successfully"
echo "=============================="