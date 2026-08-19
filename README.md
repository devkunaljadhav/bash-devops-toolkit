# 🛠️ Bash DevOps Toolkit

[![Bash](https://img.shields.io/badge/Language-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux-blue.svg)]()
[![DevOps](https://img.shields.io/badge/DevOps-Automation-orange.svg)]()
[![Maintained](https://img.shields.io/badge/Maintained-Actively%20Updated-brightgreen.svg)]()
[![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)](LICENSE)

An expanding, modular collection of practical **Bash scripts** designed for Linux system administration, DevOps automation, continuous monitoring, backups, Docker maintenance, and infrastructure operations.

This repository is organized into **Beginner** and **Advance** categories, allowing engineers and learners to quickly locate, run, or add practical automation scripts for daily tasks.

---

## 📌 Table of Contents

- [Overview & Architecture](#-overview--architecture)
- [🟢 Beginner Scripts](#-beginner-scripts-foundations)
- [🚀 Advance Scripts](#-advance-scripts-automation--ops)
- [⚡ Quick Start & Execution Guide](#-quick-start--execution-guide)
- [📋 System Requirements](#-system-requirements)
- [➕ Adding New Scripts (Guidelines)](#-adding-new-scripts-guidelines)
- [🎯 Learning Goals](#-learning-goals)
- [🔮 Planned & Upcoming Scripts](#-planned--upcoming-scripts)
- [👤 Author & Connect](#-author)
- [📄 License](#-license)

---

## 📂 Overview & Architecture

The toolkit is cleanly split into two core tiers so you can easily browse or drop new scripts at any time:

```text
bash-devops-toolkit/
├── LICENSE
├── README.md
├── Beginner Scripts/       # Core Linux administration & fundamental tasks
│   ├── disk_space_alert.sh
│   ├── network_checker.sh
│   ├── process_killer.sh
│   ├── service_monitor.sh
│   ├── system_health_checker.sh
│   └── system_info_collector.sh
└── Advance Scripts/        # Production automation, Docker, backups, and security
    ├── auto_git_sync.sh
    ├── backup_with_rotation.sh
    ├── cpu_memory_spike_logger.sh
    ├── docker_cleanup.sh
    ├── log_error_monitor.sh
    ├── mysql_db_backup.sh
    ├── port_scanner_checker.sh
    ├── ssl_cert_expiry_checker.sh
    ├── system_alert_email.sh
    └── user_account_manager.sh
```

---

## 🟢 Beginner Scripts (Foundations)

These scripts focus on fundamental Linux operations, resource diagnostics, and command-line monitoring:

| Script Name | Purpose & Description | Quick Command |
| :--- | :--- | :--- |
| **`system_info_collector.sh`** | Displays OS details, Kernel version, CPU, Memory, Disk, and IP | `./"Beginner Scripts/system_info_collector.sh"` |
| **`system_health_checker.sh`** | Quick health summary showing hostname, date, uptime, and RAM | `./"Beginner Scripts/system_health_checker.sh"` |
| **`disk_space_alert.sh`** | Alerts if root (`/`) filesystem exceeds 80% usage threshold | `./"Beginner Scripts/disk_space_alert.sh"` |
| **`network_checker.sh`** | Verifies Internet (`8.8.8.8`), DNS resolution, and HTTP status | `./"Beginner Scripts/network_checker.sh"` |
| **`service_monitor.sh`** | Checks running status of SSH, Nginx, and Apache services | `./"Beginner Scripts/service_monitor.sh"` |
| **`process_killer.sh`** | Lists top CPU processes and prompts for PID termination | `./"Beginner Scripts/process_killer.sh"` |

---

## 🚀 Advance Scripts (Automation & Ops)

These scripts solve real-world DevOps problems including automated backups, Docker maintenance, security audits, and log parsing:

| Script Name | Purpose & Description | Quick Command |
| :--- | :--- | :--- |
| **`backup_with_rotation.sh`** | Creates compressed `.tar.gz` backup and purges archives older than 7 days | `./"Advance Scripts/backup_with_rotation.sh"` |
| **`log_error_monitor.sh`** | Scans log files for `ERROR`, `WARNING`, `CRITICAL` & shows recent errors | `./"Advance Scripts/log_error_monitor.sh"` |
| **`docker_cleanup.sh`** | Cleans stopped containers, dangling images, unused volumes & networks | `./"Advance Scripts/docker_cleanup.sh"` |
| **`mysql_db_backup.sh`** | Automated `mysqldump` database backup with gzip compression & rotation | `./"Advance Scripts/mysql_db_backup.sh"` |
| **`ssl_cert_expiry_checker.sh`** | Checks SSL/TLS certificate expiry date for domains & alerts if expiring | `./"Advance Scripts/ssl_cert_expiry_checker.sh"` |
| **`system_alert_email.sh`** | Triggers email/terminal alert when CPU or RAM crosses 80% threshold | `./"Advance Scripts/system_alert_email.sh"` |
| **`user_account_manager.sh`** | Interactive menu for user creation, deletion, and sudo privilege setup | `sudo ./"Advance Scripts/user_account_manager.sh"` |
| **`port_scanner_checker.sh`** | Checks status of DevOps ports (22, 80, 443, 3306, 8080, 9090, 3000) | `./"Advance Scripts/port_scanner_checker.sh"` |
| **`auto_git_sync.sh`** | Pulls latest Git branch commits automatically for deployment updates | `./"Advance Scripts/auto_git_sync.sh"` |
| **`cpu_memory_spike_logger.sh`** | Logs CPU/RAM spikes with top processes to `system_spikes.log` | `./"Advance Scripts/cpu_memory_spike_logger.sh"` |

---

## ⚡ Quick Start & Execution Guide

### 1. Clone the Repository
```bash
git clone https://github.com/devkunaljadhav/bash-devops-toolkit.git
cd bash-devops-toolkit
```

### 2. Make All Scripts Executable
Grant executable permissions once across all script directories:
```bash
chmod +x "Beginner Scripts"/*.sh "Advance Scripts"/*.sh
```

### 3. Run Any Script
Simply run the desired script using its relative path:
```bash
# Example: Run Beginner script
./"Beginner Scripts/system_info_collector.sh"

# Example: Run Advance script (with optional argument)
./"Advance Scripts/ssl_cert_expiry_checker.sh" github.com
```

---

## 📋 System Requirements

- **OS:** Linux (Ubuntu, Debian, RHEL, CentOS, Rocky Linux, Fedora, Alpine) or macOS
- **Shell:** GNU Bash 4.x / 5.x
- **Standard Linux Utilities:** `df`, `free`, `top`, `ps`, `tar`, `gzip`, `grep`, `awk`, `curl`, `openssl`, `systemctl`

---

## ➕ Adding New Scripts (Guidelines)

Whenever you add new scripts to this repository, follow these simple conventions to maintain consistency:

1. **Choose the Right Folder**:
   - Place foundational / learning scripts in **`Beginner Scripts/`**.
   - Place automation, deployment, Docker, cloud, or monitoring scripts in **`Advance Scripts/`**.
2. **Include the Standard Header**:
   ```bash
   #!/bin/bash
   # ==============================================================================
   # Author      : Kunal Jadhav
   # Date        : DD-MM-YYYY
   # Description : Brief summary of what this script does.
   # ==============================================================================
   ```
3. **Make it Executable**:
   ```bash
   chmod +x "Folder Name/your_new_script.sh"
   ```

---

## 🎯 Learning Goals

This project provides hands-on practice in:
- Bash scripting fundamentals, functions, and control flow
- Linux administration commands (`systemctl`, `df`, `free`, `ps`, `tar`, `openssl`)
- Log analysis, incident triage, and regex pattern matching (`grep`, `awk`, `cut`)
- DevOps automation workflows: backups, rotation, Docker maintenance, Git deployment
- Defensive scripting, error checking, and system access control

---

## 🔮 Planned & Upcoming Scripts

- [ ] **AWS / Cloud Automation:** EC2 instance state monitor and S3 bucket backup uploader
- [ ] **CI/CD & Webhook Helpers:** Webhook alert triggers for Slack and Discord
- [ ] **Kubernetes / Container Helpers:** Pod health checker and restart tracker
- [ ] **Database Helpers:** PostgreSQL and MongoDB automated backup scripts
- [ ] **Cron Automation:** Automated cron installation and schedule helper

---

## 👤 Author

**Kunal Jadhav**  
*DevOps and Cloud Engineer*  
- 🐙 **GitHub:** [@devkunaljadhav](https://github.com/devkunaljadhav)
- 💼 **LinkedIn:** [devkunaljadhav](https://www.linkedin.com/in/devkunaljadhav)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
