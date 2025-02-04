# System Cleanup Script

This script is designed to clean up logs, bash history, and sensitive data for the **current active session** only. It will not affect older logs or history. The script also removes the `audit` package (if installed) and wipes the current session's audit logs. It will automatically delete itself after execution.

## Features:
- Clears the bash history of the current active session.
- Removes log files created during the current session from `/var/log/`.
- Clears the current session's systemd journal logs.
- Removes the current session's audit logs and the `audit` package.
- Automatically deletes itself after execution.

## Instructions

### Prerequisites:
- The script requires root privileges to clear system logs and perform cleanup.
- It is assumed that the system has `auditd` (if present) installed.

### How to Use:

1. Download the script directly from GitHub using the following command:

   ```bash
   curl -O https://raw.githubusercontent.com/sumit-kumawat/wipe-traces/main/cleaner.sh

2. Make the script executable:

   ```bash
   chmod +x cleaner.sh

3. Run the script:

   ```bash
   sudo ./cleaner.sh

This project is open to the public, and freely available for Security Engineers and IT professionals. No license is required for usage, modification, or distribution.
