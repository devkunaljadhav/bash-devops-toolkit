# 🛠️ Bash DevOps Toolkit

[![Bash](https://img.shields.io/badge/Language-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux-blue.svg)]()
[![DevOps](https://img.shields.io/badge/DevOps-Automation-orange.svg)]()
[![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)](LICENSE)

A practical collection of **Beginner** and **Advance** Bash scripts for Linux administration, DevOps automation, system monitoring, network diagnostics, Docker maintenance, database backups, and daily operational tasks.

This repository is created for learning, hands-on practice, and portfolio building, focusing on real-world scripting problems commonly encountered in DevOps and system administration.

---

## 📌 Table of Contents

- [Features](#-features)
- [Repository Structure](#-repository-structure)
- [🟢 Beginner Scripts](#-beginner-scripts)
  - [1. System Info Collector (`system_info_collector.sh`)](#1-system-info-collector)
  - [2. System Health Checker (`system_health_checker.sh`)](#2-system-health-checker)
  - [3. Disk Space Alert (`disk_space_alert.sh`)](#3-disk-space-alert)
  - [4. Network Connectivity Checker (`network_checker.sh`)](#4-network-connectivity-checker)
  - [5. Service Status Monitor (`service_monitor.sh`)](#5-service-status-monitor)
  - [6. High CPU Process Killer (`process_killer.sh`)](#6-high-cpu-process-killer)
- [🚀 Advance Scripts](#-advance-scripts)
  - [1. Backup with Rotation (`backup_with_rotation.sh`)](#1-backup-with-rotation)
  - [2. Log Error Monitor (`log_error_monitor.sh`)](#2-log-error-monitor)
  - [3. Docker System Cleanup (`docker_cleanup.sh`)](#3-docker-system-cleanup)
  - [4. MySQL Database Backup (`mysql_db_backup.sh`)](#4-mysql-database-backup)
  - [5. SSL Certificate Expiry Checker (`ssl_cert_expiry_checker.sh`)](#5-ssl-certificate-expiry-checker)
  - [6. System Resource Alert Email (`system_alert_email.sh`)](#6-system-resource-alert-email)
  - [7. User Account Manager (`user_account_manager.sh`)](#7-user-account-manager)
  - [8. DevOps Port Scanner (`port_scanner_checker.sh`)](#8-devops-port-scanner)
  - [9. Automated Git Repo Sync (`auto_git_sync.sh`)](#9-automated-git-repo-sync)
  - [10. Resource Spike Logger (`cpu_memory_spike_logger.sh`)](#10-resource-spike-logger)
- [Requirements](#-requirements)
- [How to Use](#-how-to-use)
- [Learning Goals](#-learning-goals)
- [Author](#-author)
- [License](#-license)

---

## 🚀 Features

- 🖥️ **System Information & Health**: Collect hardware specs, OS details, CPU/Memory load, and disk utilization.
- 💾 **Automated Backups & Rotation**: Automated directory and MySQL database backups with 7-day retention cleanup.
- 🐳 **Docker System Cleanup**: Clean stopped containers, dangling images, unused networks, and volumes safely.
- 🔒 **Security & Access Control**: SSL/TLS certificate expiry checking and automated user/sudo account management.
- 🌐 **Networking & Diagnostics**: Ping, DNS, HTTP/S checks, and DevOps open-port scanner.
- 📊 **Monitoring & Logging**: Resource spike logger, log error scanner, and high-usage process management.

---

## 📂 Repository Structure

```text
bash-devops-toolkit/
├── LICENSE
├── README.md
├── Beginner Scripts/
│   ├── system_info_collector.sh    # Collects system & hardware metrics
│   ├── system_health_checker.sh    # Quick health check report
│   ├── disk_space_alert.sh         # Disk usage check and threshold warning
│   ├── network_checker.sh          # Checks Internet, DNS & HTTP connectivity
│   ├── service_monitor.sh          # Checks status of SSH, Nginx, and Apache
│   └── process_killer.sh           # Identifies and kills high-CPU processes
└── Advance Scripts/
    ├── backup_with_rotation.sh     # Compressed .tar.gz backup with 7-day retention
    ├── log_error_monitor.sh        # Scans logs for Errors, Warnings & Critical issues
    ├── docker_cleanup.sh           # Cleans unused containers, images, volumes & networks
    ├── mysql_db_backup.sh          # Automated MySQL dump with gzip & retention
    ├── ssl_cert_expiry_checker.sh  # Checks SSL certificate expiration date for domains
    ├── system_alert_email.sh       # High CPU/RAM threshold alert monitor
    ├── user_account_manager.sh     # Interactive user creation, deletion & sudo privileges
    ├── port_scanner_checker.sh     # Scans key DevOps ports (22, 80, 443, 3306, 8080, etc.)
    ├── auto_git_sync.sh            # Pulls latest Git changes automatically for deployments
    └── cpu_memory_spike_logger.sh  # Records timestamped CPU/Memory spikes to log file
```

---

## 🟢 Beginner Scripts

### 1. System Info Collector
**File:** `Beginner Scripts/system_info_collector.sh`  
Displays essential details such as Hostname, OS version (`/etc/os-release`), Kernel version, CPU model, Memory (`free -h`), Disk usage (`df -h`), IP address, Uptime, and logged-in users.
```bash
./"Beginner Scripts/system_info_collector.sh"
```

### 2. System Health Checker
**File:** `Beginner Scripts/system_health_checker.sh`  
Generates a quick health report showing hostname, date, uptime, memory, and disk usage.
```bash
./"Beginner Scripts/system_health_checker.sh"
```

### 3. Disk Space Alert
**File:** `Beginner Scripts/disk_space_alert.sh`  
Checks root filesystem usage against an 80% threshold and alerts if disk space is low.
```bash
./"Beginner Scripts/disk_space_alert.sh"
```

### 4. Network Connectivity Checker
**File:** `Beginner Scripts/network_checker.sh`  
Tests Internet connectivity (`8.8.8.8`), DNS resolution (`google.com`), and HTTP reachability (`curl https://google.com`).
```bash
./"Beginner Scripts/network_checker.sh"
```

### 5. Service Status Monitor
**File:** `Beginner Scripts/service_monitor.sh`  
Checks active status of essential services (`ssh`, `nginx`, `httpd`) using `systemctl`.
```bash
./"Beginner Scripts/service_monitor.sh"
```

### 6. High CPU Process Killer
**File:** `Beginner Scripts/process_killer.sh`  
Lists top CPU-consuming processes and allows the user to enter a PID to terminate.
```bash
./"Beginner Scripts/process_killer.sh"
```

---

## 🚀 Advance Scripts

### 1. Backup with Rotation
**File:** `Advance Scripts/backup_with_rotation.sh`  
Creates a timestamped, gzip-compressed archive (`.tar.gz`) of a source directory and automatically deletes backups older than 7 days.
```bash
./"Advance Scripts/backup_with_rotation.sh"
```

### 2. Log Error Monitor
**File:** `Advance Scripts/log_error_monitor.sh`  
Scans system or application log files for `ERROR`, `WARNING`, and `CRITICAL` keywords, counts occurrences, and prints the last 5 error entries.
```bash
# Scan default syslog
./"Advance Scripts/log_error_monitor.sh"

# Scan specific application log
./"Advance Scripts/log_error_monitor.sh" /var/log/nginx/error.log
```

### 3. Docker System Cleanup
**File:** `Advance Scripts/docker_cleanup.sh`  
Frees up disk space by safely removing stopped containers, unused/dangling images, unused networks, and dangling volumes.
```bash
./"Advance Scripts/docker_cleanup.sh"
```

### 4. MySQL Database Backup
**File:** `Advance Scripts/mysql_db_backup.sh`  
Performs automated `mysqldump` of database, compresses output with `gzip`, verifies file creation, and applies an N-day retention policy.
```bash
./"Advance Scripts/mysql_db_backup.sh"
```

### 5. SSL Certificate Expiry Checker
**File:** `Advance Scripts/ssl_cert_expiry_checker.sh`  
Connects via OpenSSL to verify domain SSL/TLS certificate expiration dates and warns if expiry is within 30 days.
```bash
./"Advance Scripts/ssl_cert_expiry_checker.sh" google.com
```

### 6. System Resource Alert Email
**File:** `Advance Scripts/system_alert_email.sh`  
Monitors overall CPU and Memory utilization against 80% thresholds and triggers alert notifications.
```bash
./"Advance Scripts/system_alert_email.sh"
```

### 7. User Account Manager
**File:** `Advance Scripts/user_account_manager.sh`  
Interactive management script for Linux user administration (create user, set password, assign sudo access, delete user, check status).
```bash
sudo ./"Advance Scripts/user_account_manager.sh"
```

### 8. DevOps Port Scanner
**File:** `Advance Scripts/port_scanner_checker.sh`  
Checks whether common DevOps ports (SSH 22, HTTP 80, HTTPS 443, MySQL 3306, Postgres 5432, Jenkins 8080, Prometheus 9090, Grafana 3000) are open or listening.
```bash
./"Advance Scripts/port_scanner_checker.sh" 127.0.0.1
```

### 9. Automated Git Repo Sync
**File:** `Advance Scripts/auto_git_sync.sh`  
Checks Git remote repository for updates, pulls latest commits on the target branch, and displays deployment commit status.
```bash
./"Advance Scripts/auto_git_sync.sh" /path/to/repo main
```

### 10. Resource Spike Logger
**File:** `Advance Scripts/cpu_memory_spike_logger.sh`  
Detects CPU/Memory spikes over 75% and logs timestamped events along with top 5 resource-consuming processes to `system_spikes.log`.
```bash
./"Advance Scripts/cpu_memory_spike_logger.sh"
```

---

## 📋 Requirements

- **Operating System:** Linux (Ubuntu, Debian, CentOS, RHEL, Fedora, etc.)
- **Shell:** GNU Bash
- **Standard Utilities:** `df`, `free`, `top`, `ps`, `tar`, `gzip`, `grep`, `awk`, `curl`, `openssl`, `systemctl`

---

## ⚡ How to Use

### 1. Clone the Repository
```bash
git clone https://github.com/devkunaljadhav/bash-devops-toolkit.git
cd bash-devops-toolkit
```

### 2. Make All Scripts Executable
```bash
chmod +x "Beginner Scripts"/*.sh "Advance Scripts"/*.sh
```

### 3. Execute Any Script
```bash
# Run a Beginner script
./"Beginner Scripts/system_info_collector.sh"

# Run an Advance script
./"Advance Scripts/backup_with_rotation.sh"
```

---

## 🎯 Learning Goals

This project provides hands-on practice in:
- Bash scripting fundamentals, functions, and control flow
- Linux administration commands (`systemctl`, `df`, `free`, `ps`, `tar`, `openssl`)
- Log analysis, incident triage, and regex pattern matching (`grep`, `awk`, `cut`)
- DevOps automation workflows: backups, rotation, Docker maintenance, Git deployment
- Defensive programming, error checking, and user management

---

## 👤 Author

**Kunal Jadhav**  
*DevOps and Cloud Engineer*  
- GitHub: [@devkunaljadhav](https://github.com/devkunaljadhav)
- LinkedIn: [devkunaljadhav](https://www.linkedin.com/in/devkunaljadhav)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
