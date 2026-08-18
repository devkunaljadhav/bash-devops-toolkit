# 🛠️ Bash DevOps Toolkit

[![Bash](https://img.shields.io/badge/Language-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux-blue.svg)]()
[![DevOps](https://img.shields.io/badge/DevOps-Automation-orange.svg)]()
[![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)](LICENSE)

A practical collection of Bash scripts for Linux administration, DevOps automation, system monitoring, network diagnostics, and daily operational tasks.

This repository is created for learning, hands-on practice, and portfolio building, focusing on real-world scripting problems commonly encountered in DevOps and system administration.

---

## 📌 Table of Contents

- [Features](#-features)
- [Repository Structure](#-repository-structure)
- [Scripts Included](#-scripts-included)
  - [1. System Information Collector (`system_info_collector.sh`)](#1-system-info-collector-system_info_collectorsh)
  - [2. System Health Checker (`system_health_checker.sh`)](#2-system-health-checker-system_health_checkersh)
  - [3. Disk Space Alert (`disk_space_alert.sh`)](#3-disk-space-alert-disk_space_alertsh)
  - [4. Network Connectivity Checker (`network_checker.sh`)](#4-network-connectivity-checker-network_checkersh)
  - [5. Service Status Monitor (`service_monitor.sh`)](#5-service-status-monitor-service_monitorsh)
  - [6. High CPU Process Killer (`process_killer.sh`)](#6-high-cpu-process-killer-process_killersh)
- [Requirements](#-requirements)
- [How to Use](#-how-to-use)
- [Learning Goals](#-learning-goals)
- [Future Improvements](#-future-improvements)
- [Contributing](#-contributing)
- [Author](#-author)
- [License](#-license)

---

## 🚀 Features

- 🖥️ **System Information Collection**: Gather hardware, OS, kernel, memory, disk, IP, and uptime metrics.
- 🩺 **System Health Monitoring**: Quick health reporting of basic system resources.
- 💾 **Disk Usage Alerts**: Threshold-based disk space monitoring for critical root partition.
- 🌐 **Network Diagnostics**: Connectivity checks for Internet, DNS resolution, and HTTP reachability.
- ⚙️ **Service Status Monitoring**: Automated status checks for key services (SSH, Nginx, Apache).
- 🛑 **Process Management**: Identify high-CPU consuming processes and terminate by PID.

---

## 📂 Repository Structure

```text
bash-devops-toolkit/
├── LICENSE
├── README.md
└── scripts/
    ├── system_info_collector.sh    # Collects detailed system & hardware information
    ├── system_health_checker.sh    # Generates a quick system health report
    ├── disk_space_alert.sh         # Checks disk usage and displays threshold alert
    ├── network_checker.sh          # Checks Internet, DNS, and HTTP connectivity
    ├── service_monitor.sh          # Checks active status for SSH, Nginx, and Apache
    └── process_killer.sh           # Finds high CPU processes and allows killing by PID
```

---

## 📜 Scripts Included

### 1. System Info Collector (`system_info_collector.sh`)
Displays essential system details including Hostname, OS distribution (`/etc/os-release`), Kernel version, CPU model, Memory (`free -h`), Disk usage (`df -h`), IP address, Uptime, and currently logged-in users.

**Usage:**
```bash
./scripts/system_info_collector.sh
```

---

### 2. System Health Checker (`system_health_checker.sh`)
Generates a quick health report showing hostname, current date/time, uptime, memory status, and disk usage.

**Usage:**
```bash
./scripts/system_health_checker.sh
```

---

### 3. Disk Space Alert (`disk_space_alert.sh`)
Checks the root filesystem (`/`) usage percentage and compares it against an alert threshold (80%). Displays a `WARNING` if usage exceeds the threshold, or confirms normal status.

**Usage:**
```bash
./scripts/disk_space_alert.sh
```

---

### 4. Network Connectivity Checker (`network_checker.sh`)
Tests network connectivity by performing:
- Internet check via ping (`8.8.8.8`)
- DNS resolution check (`google.com`)
- HTTP reachability check via `curl` (`https://google.com`)

**Usage:**
```bash
./scripts/network_checker.sh
```

---

### 5. Service Status Monitor (`service_monitor.sh`)
Checks whether critical daemon services (`ssh`, `nginx`, `httpd`) are currently active and running using `systemctl`.

**Usage:**
```bash
./scripts/service_monitor.sh
```

---

### 6. High CPU Process Killer (`process_killer.sh`)
Lists top processes consuming the highest CPU using `ps aux --sort=-%cpu` and prompts the user for a PID to terminate.

**Usage:**
```bash
./scripts/process_killer.sh
```

---

## 📋 Requirements

- **Operating System:** Linux (Ubuntu, Debian, CentOS, RHEL, Fedora, etc.)
- **Shell:** GNU Bash
- **Standard Linux Utilities:** `df`, `free`, `top`, `ps`, `grep`, `awk`, `ping`, `curl`, `systemctl`

---

## ⚡ How to Use

### 1. Clone the Repository
```bash
git clone https://github.com/devkunaljadhav/bash-devops-toolkit.git
cd bash-devops-toolkit
```

### 2. Make the Scripts Executable
```bash
chmod +x scripts/*.sh
```

### 3. Run Any Script
```bash
# Example: Check system info
./scripts/system_info_collector.sh

# Example: Check network connectivity
./scripts/network_checker.sh

# Example: Monitor disk space
./scripts/disk_space_alert.sh

# Example: Monitor service statuses
./scripts/service_monitor.sh
```

---

## 🎯 Learning Goals

This project provides hands-on practice in:
- Bash scripting fundamentals and CLI output formatting
- Linux administration commands (`systemctl`, `df`, `free`, `ps`, `ping`, `curl`)
- Parsing and filtering command outputs using `awk`, `grep`, and `cut`
- Conditional statements (`if-else`) and environment inspection
- DevOps task automation and monitoring concepts

---

## 🔮 Future Improvements

- [ ] Add automated backup script with `.tar.gz` compression and rotation
- [ ] Add log file scanner for error keyword tracking
- [ ] Add safe temporary file cleanup utility
- [ ] Add email/Slack notification alerts for threshold breaches
- [ ] Add interactive CLI dashboard runner

---

## 🤝 Contributing

Contributions, suggestions, and feature requests are welcome! Feel free to open an issue or submit a pull request.

---

## 👤 Author

**Kunal Jadhav**  
*DevOps and Cloud Engineer*  
- GitHub: [@devkunaljadhav](https://github.com/devkunaljadhav)
- LinkedIn: [devkunaljadhav](https://www.linkedin.com/in/devkunaljadhav)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
