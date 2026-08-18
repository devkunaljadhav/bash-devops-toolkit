#!/bin/bash
# ==============================================================================
# Author      : Kunal Jadhav
# Date        : 18-08-2026
# Description : Takes MySQL/MariaDB database dump, compresses with gzip, and manages rotation.
# ==============================================================================

echo "=================================================================="
echo "                    MYSQL DATABASE BACKUP                         "
echo "=================================================================="

# Database Credentials & Configuration
DB_USER="root"
DB_PASS="password123"            # Set your DB Password here
DB_NAME="mydb"                   # Set your Database Name here
BACKUP_DIR="/backup/mysql"
RETENTION_DAYS=7

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_backup_${DATE}.sql.gz"

# 1. Create backup directory if not exists
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# 2. Check if mysqldump command exists
if ! command -v mysqldump &> /dev/null; then
    echo "[ERROR] mysqldump utility is not installed!"
    exit 1
fi

echo "[INFO] Taking backup of database: $DB_NAME ..."

# 3. Take MySQL Dump and compress directly
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" 2>/dev/null | gzip > "$BACKUP_FILE"

if [ $? -eq 0 ] && [ -s "$BACKUP_FILE" ]; then
    SIZE=$(ls -lh "$BACKUP_FILE" | awk '{print $5}')
    echo "[SUCCESS] Database backup completed: $BACKUP_FILE"
    echo "[INFO] Backup File Size: $SIZE"
else
    echo "[ERROR] Database backup failed! Check credentials or DB name."
    rm -f "$BACKUP_FILE"
    exit 1
fi

# 4. Clean old DB backups
echo "[INFO] Cleaning backups older than $RETENTION_DAYS days..."
find "$BACKUP_DIR" -type f -name "${DB_NAME}_backup_*.sql.gz" -mtime +$RETENTION_DAYS -exec rm -f {} \;

echo "[SUCCESS] Backup workflow finished successfully."
echo "=================================================================="
