# Bash DevOps Toolkit

A collection of practical Bash scripts for Linux administration, DevOps automation, monitoring, backup, and daily system tasks.

This repository is created for learning, practice, and portfolio building.  
It focuses on real-world scripting problems that are useful in DevOps and system administration.

## Features

- System information collection
- Disk usage monitoring
- CPU and memory monitoring
- Backup and cleanup automation
- Service status checks
- Log file scanning
- User and permission management
- Basic deployment helpers
- Cron job-based automation
- Linux troubleshooting scripts

## Repository Structure

bash
bash-devops-toolkit/
├── README.md
├── scripts/
│   ├── system_info.sh
│   ├── disk_monitor.sh
│   ├── backup_files.sh
│   ├── service_check.sh
│   ├── log_scanner.sh
│   └── cleanup_temp.sh
├── examples/
└── output/


## Scripts Included

### 1. system_info.sh
Displays system details such as OS version, hostname, uptime, CPU, memory, and disk usage.

### 2. disk_monitor.sh
Checks disk usage and warns when a partition crosses a defined threshold.

### 3. backup_files.sh
Creates compressed backups of important files or directories.

### 4. service_check.sh
Checks whether a service is running and restarts it if needed.

### 5. log_scanner.sh
Searches log files for errors, warnings, or failed login attempts.

### 6. cleanup_temp.sh
Removes temporary files, old logs, and unused files safely.

## Requirements

- Linux OS
- Bash shell
- Standard Linux utilities like `df`, `free`, `top`, `tar`, `grep`, `awk`, and `systemctl`

## How to Use

1. Clone the repository:
bash
git clone https://github.com/your-username/bash-devops-toolkit.git
cd bash-devops-toolkit


2. Make the scripts executable:
bash
chmod +x scripts/*.sh


3. Run any script:
bash
./scripts/system_info.sh


## Example Usage

bash
./scripts/disk_monitor.sh
./scripts/backup_files.sh
./scripts/service_check.sh nginx


## Learning Goals

This project helped me practice:

- Bash scripting fundamentals
- Linux command-line tools
- File handling and automation
- Error handling
- DevOps-style task automation

## Future Improvements

- Add more advanced automation scripts
- Add email alerts
- Add cron integration
- Add AWS-related Bash scripts
- Add logging and better error handling

## Contributing

Contributions, suggestions, and improvements are welcome.

##Author 
Kunal Jadhav 
DevOps and Cloud Enginer
## License

This project is for learning and portfolio purposes.
