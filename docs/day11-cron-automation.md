# Day 11 - Cron Automation

## Objective

Automate all monitoring and auto-healing modules.

## Scheduled Tasks

- CPU Monitoring (5 mins)
- Memory Monitoring (5 mins)
- Disk Monitoring (10 mins)
- Log Monitoring (15 mins)
- Health Report (Hourly)
- Service Auto-Healing (5 mins)
- Disk Cleanup (30 mins)
- Zombie Scan (15 mins)

## Commands Used

- crontab -e
- crontab -l
- systemctl status cron

## Benefits

- Fully automated platform
- Reduced manual intervention
- Continuous monitoring

| Command                 | Purpose                   |
| ----------------------- | ------------------------- |
| `crontab -e`            | Edit cron jobs            |
| `crontab -l`            | List cron jobs            |
| `systemctl status cron` | Check cron service status |
| `pwd`                   | Get absolute path         |
| `ls -ltr`               | View files sorted by time |

