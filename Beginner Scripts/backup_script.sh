#!/bin/bash

echo "=============================="
echo "        BACKUP SCRIPT"
echo "=============================="

SOURCE="$HOME/Documents"
BACKUP_DIR="$HOME/backups"

mkdir -p "$BACKUP_DIR"

DATE=$(date +%Y-%m-%d_%H-%M-%S)

tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz" "$SOURCE"

echo "Backup completed successfully."
echo "Backup location: $BACKUP_DIR"
echo "=============================="