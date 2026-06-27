# Day 8 - Service Auto-Healing Engine

## Features

- Service health check
- Automatic service restart
- Healing history logging
- Report generation

## Service Monitored

cron

## Commands Used

- systemctl
- restart
- is-active
- sleep

## Output Locations

auto-healing/service-recovery/reports/
auto-healing/service-recovery/logs/
| Command               | Purpose                    |
| --------------------- | -------------------------- |
| `systemctl status`    | Check service status       |
| `systemctl start`     | Start service              |
| `systemctl stop`      | Stop service               |
| `systemctl restart`   | Restart service            |
| `systemctl is-active` | Check if service is active |
| `sleep`               | Pause script execution     |

