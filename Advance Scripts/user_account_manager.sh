#!/bin/bash
# ==============================================================================
# Author      : Kunal Jadhav
# Date        : 18-08-2026
# Description : Automates user account creation, deletion, and permission assignment.
# ==============================================================================

echo "=================================================================="
echo "                     USER ACCOUNT MANAGER                         "
echo "=================================================================="

# Check if script is run as root / sudo
if [ "$EUID" -ne 0 ]; then
    echo "[WARNING] Please run this script with sudo or as root."
fi

echo "1. Create New User"
echo "2. Delete Existing User"
echo "3. Check User Information"
echo "4. List All Sudo Users"
echo "------------------------------------------------------------------"
read -p "Enter your choice [1-4]: " CHOICE

case "$CHOICE" in
    1)
        read -p "Enter username to create: " USERNAME
        if id "$USERNAME" &>/dev/null; then
            echo "[ERROR] User '$USERNAME' already exists!"
            exit 1
        fi
        
        read -s -p "Enter password for $USERNAME: " PASSWORD
        echo ""
        
        useradd -m -s /bin/bash "$USERNAME"
        echo "$USERNAME:$PASSWORD" | chpasswd
        
        read -p "Do you want to grant sudo access to $USERNAME? [y/N]: " SUDO_ANS
        if [[ "$SUDO_ANS" =~ ^[yY]$ ]]; then
            usermod -aG sudo "$USERNAME" 2>/dev/null || usermod -aG wheel "$USERNAME" 2>/dev/null
            echo "[SUCCESS] Sudo access granted to $USERNAME."
        fi
        
        echo "[SUCCESS] User '$USERNAME' created successfully."
        ;;
    2)
        read -p "Enter username to delete: " USERNAME
        if ! id "$USERNAME" &>/dev/null; then
            echo "[ERROR] User '$USERNAME' does not exist!"
            exit 1
        fi
        
        read -p "Do you also want to remove home directory for $USERNAME? [y/N]: " REMOVE_HOME
        if [[ "$REMOVE_HOME" =~ ^[yY]$ ]]; then
            userdel -r "$USERNAME"
        else
            userdel "$USERNAME"
        fi
        echo "[SUCCESS] User '$USERNAME' deleted successfully."
        ;;
    3)
        read -p "Enter username to check: " USERNAME
        if id "$USERNAME" &>/dev/null; then
            echo "------------------------------------------------------------------"
            id "$USERNAME"
            echo "Home Directory : $(eval echo ~$USERNAME)"
            echo "Login Shell    : $(getent passwd "$USERNAME" | cut -d: -f7)"
        else
            echo "[ERROR] User '$USERNAME' not found."
        fi
        ;;
    4)
        echo "------------------------------------------------------------------"
        echo "Users with sudo privileges:"
        getent group sudo 2>/dev/null || getent group wheel 2>/dev/null
        ;;
    *)
        echo "[ERROR] Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "=================================================================="
