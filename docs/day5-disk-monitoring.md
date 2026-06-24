# Day 5 - Disk Monitoring Module

## Features

- Disk usage monitoring
- Threshold-based alerts
- Timestamp-based reports
- Available disk space reporting

## Threshold

Disk Threshold: 80%

## Commands Used

- df
- awk
- date

## Report Location

monitoring/disk/reports/
| Command | Purpose                                  |
| ------- | ---------------------------------------- |
| `df -h` | Show disk usage in human-readable format |
| `awk`   | Extract specific fields from output      |
| `gsub`  | Remove characters (like %) from text     |
| `date`  | Generate timestamps                      |

