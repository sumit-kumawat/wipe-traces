# System Cleanup Script

This script is designed to clean up system logs, bash history, and sensitive data. It also removes the `audit` package if installed and wipes audit logs. The script is designed to be executed directly and will automatically delete itself once the process is completed.

## Features:
- Clears bash history.
- Removes log files from `/var/log/`.
- Clears systemd journal logs.
- Removes audit logs and the `audit` package.
- Automatically deletes itself after execution.

## Instructions

### Prerequisites:
- The script requires root privileges to clear system logs and perform cleanup.
- It is assumed that the system has `auditd` (if present) installed.

### How to Use:

1. Download the script directly from GitHub using the following command:

   ```bash
   curl -O https://raw.githubusercontent.com/sumit-kumawat/wipe-traces/main/cleaner.sh
