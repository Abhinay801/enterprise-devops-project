# Day 10 - Zombie Process Cleanup Engine

## Features

- Detect zombie processes
- Count zombie processes
- Generate timestamp-based reports
- Maintain cleanup history logs

## Commands Used

- ps
- awk
- grep
- date

## Report Location

auto-healing/zombie-cleanup/reports/

## Log Location

auto-healing/zombie-cleanup/logs/

| Command   | Purpose                   |
| --------- | ------------------------- |
| `ps -eo`  | Display process details   |
| `awk`     | Filter and process output |
| `grep -c` | Count matching lines      |
| `date`    | Generate timestamps       |

