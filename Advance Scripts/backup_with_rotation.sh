#!/bin/bash
# ==============================================================================
# Author      : Kunal Jadhav
# Date        : 18-08-2026
# Description : Takes a compressed .tar.gz backup and deletes backups older than 7 days.
# ==============================================================================

echo "=================================================================="
echo "                     AUTOMATED BACKUP & ROTATION                  "
echo "=================================================================="

# Directories to configure
SOURCE_DIR="/var/www/html"          # Change this to your source directory
BACKUP_DIR="/backup/daily"          # Change this to your backup directory
RETENTION_DAYS=7                    # Keep backups for 7 days

# Date format for backup file name
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="${BACKUP_DIR}/backup_${DATE}.tar.gz"

# 1. Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "[ERROR] Source directory $SOURCE_DIR does not exist!"
    exit 1
fi

# 2. Create backup destination folder if not present
if [ ! -d "$BACKUP_DIR" ]; then
    echo "[INFO] Creating backup directory $BACKUP_DIR..."
    mkdir -p "$BACKUP_DIR"
fi

# 3. Create compressed backup
echo "[INFO] Starting backup of $SOURCE_DIR..."
tar -czf "$BACKUP_FILE" "$SOURCE_DIR" 2>/dev/null

if [ $? -eq 0 ]; then
    BACKUP_SIZE=$(ls -lh "$BACKUP_FILE" | awk '{print $5}')
    echo "[SUCCESS] Backup created successfully: $BACKUP_FILE"
    echo "[INFO] Backup File Size: $BACKUP_SIZE"
else
    echo "[ERROR] Backup creation failed!"
    exit 1
fi

# 4. Remove backups older than 7 days (Rotation)
echo "[INFO] Cleaning up backups older than $RETENTION_DAYS days..."
find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +$RETENTION_DAYS -exec rm -f {} \;

echo "[SUCCESS] Old backups cleaned up successfully."
echo "=================================================================="
