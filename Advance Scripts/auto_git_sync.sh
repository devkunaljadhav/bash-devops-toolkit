#!/bin/bash
# ==============================================================================
# Author      : Kunal Jadhav
# Date        : 18-08-2026
# Description : Automatically pulls latest git changes and manages repo deployments.
# ==============================================================================

echo "=================================================================="
echo "                   AUTOMATED GIT REPO SYNC                        "
echo "=================================================================="

# Repository Path (current folder by default or passed as argument)
REPO_DIR="${1:-$(pwd)}"
BRANCH="${2:-main}"

# 1. Check if directory exists
if [ ! -d "$REPO_DIR" ]; then
    echo "[ERROR] Directory $REPO_DIR does not exist!"
    exit 1
fi

cd "$REPO_DIR" || exit 1

# 2. Check if directory is a git repository
if [ ! -d ".git" ]; then
    echo "[ERROR] $REPO_DIR is not a valid Git repository."
    exit 1
fi

echo "[INFO] Working Directory : $REPO_DIR"
echo "[INFO] Target Branch      : $BRANCH"
echo "------------------------------------------------------------------"

# 3. Fetch remote updates
echo "[INFO] Fetching latest updates from origin..."
git fetch origin

LOCAL_HASH=$(git rev-parse HEAD 2>/dev/null)
REMOTE_HASH=$(git rev-parse origin/"$BRANCH" 2>/dev/null)

if [ "$LOCAL_HASH" = "$REMOTE_HASH" ]; then
    echo "[OK] Repository is already up-to-date. No deployment needed."
else
    echo "[INFO] New updates detected! Pulling latest changes..."
    git checkout "$BRANCH" 2>/dev/null
    git pull origin "$BRANCH"
    
    if [ $? -eq 0 ]; then
        echo "[SUCCESS] Git sync completed successfully."
        echo "[INFO] Latest commit:"
        git log -1 --oneline
    else
        echo "[ERROR] Git pull failed! Please check for conflicts or authentication."
        exit 1
    fi
fi

echo "=================================================================="
