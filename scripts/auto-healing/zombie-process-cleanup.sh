#!/bin/bash

BASE_DIR="/mnt/c/Users/ADMIN/devops-project/enterprise-devops-project"

REPORT_DIR="$BASE_DIR/auto-healing/zombie-cleanup/reports"

LOG_DIR="$BASE_DIR/auto-healing/zombie-cleanup/logs"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

REPORT_FILE="$REPORT_DIR/zombie_report_$TIMESTAMP.txt"

LOG_FILE="$LOG_DIR/zombie_cleanup_history.log"

echo "========================================" > "$REPORT_FILE"
echo "Zombie Process Cleanup Report" >> "$REPORT_FILE"
echo "Generated: $(date)" >> "$REPORT_FILE"
echo "========================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

ZOMBIES=$(ps -eo pid,ppid,state,comm | awk '$3=="Z"')

ZOMBIE_COUNT=$(echo "$ZOMBIES" | grep -c .)

echo "Zombie Process Count: $ZOMBIE_COUNT" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

if [ "$ZOMBIE_COUNT" -gt 0 ]; then

    echo "$ZOMBIES" | while read PID PPID STATE COMMAND
    do
        echo "Zombie PID : $PID" >> "$REPORT_FILE"
        echo "Parent PID : $PPID" >> "$REPORT_FILE"
        echo "Command    : $COMMAND" >> "$REPORT_FILE"
        echo "" >> "$REPORT_FILE"
    done

    echo "Action Taken:" >> "$REPORT_FILE"
    echo "Zombie processes logged for administrator review." >> "$REPORT_FILE"

    echo "$(date) : Found $ZOMBIE_COUNT zombie process(es)" >> "$LOG_FILE"

else

    echo "No zombie processes detected." >> "$REPORT_FILE"

    echo "$(date) : No zombie processes found" >> "$LOG_FILE"

fi

echo ""
echo "Zombie process scan completed."
echo "Report location: $REPORT_FILE"
