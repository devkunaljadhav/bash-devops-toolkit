#!/bin/bash
# ==============================================================================
# Author      : Kunal Jadhav
# Date        : 18-08-2026
# Description : Cleans stopped Docker containers, unused images, networks & volumes.
# ==============================================================================

echo "=================================================================="
echo "                       DOCKER SYSTEM CLEANUP                      "
echo "=================================================================="

# Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo "[ERROR] Docker is not installed on this system!"
    exit 1
fi

# Check if Docker daemon is running
if ! docker info > /dev/null 2>&1; then
    echo "[ERROR] Docker service is not running. Please start docker first."
    exit 1
fi

echo "[INFO] Showing Docker disk usage before cleanup:"
docker system df
echo "------------------------------------------------------------------"

echo "[INFO] Removing stopped containers..."
docker container prune -f

echo "[INFO] Removing unused and dangling images..."
docker image prune -f

echo "[INFO] Removing unused networks..."
docker network prune -f

echo "[INFO] Removing unused volumes..."
docker volume prune -f

echo "------------------------------------------------------------------"
echo "[SUCCESS] Docker cleanup completed!"
echo "[INFO] Docker disk usage after cleanup:"
docker system df
echo "=================================================================="
