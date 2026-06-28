#!/bin/bash

DISK_THRESHOLD=80

BASE_DIR="/mnt/c/Users/ADMIN/devops-project/enterprise-devops-project"

OLD_LOG_DIR="$BASE_DIR/logs/old-logs"

REPORT_DIR="$BASE_DIR/auto-healing/disk-cleanup/reports"

LOG_DIR="$BASE_DIR/auto-healing/disk-cleanup/logs"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

REPORT_FILE="$REPORT_DIR/disk_cleanup_$TIMESTAMP.txt"

LOG_FILE="$LOG_DIR/cleanup_history.log"

DISK_USAGE=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

echo "========================================" > "$REPORT_FILE"
echo "Disk Auto-Healing Report" >> "$REPORT_FILE"
echo "Generated: $(date)" >> "$REPORT_FILE"
echo "========================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "Current Disk Usage: ${DISK_USAGE}%" >> "$REPORT_FILE"
echo "Threshold: ${DISK_THRESHOLD}%" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then

    echo "Threshold exceeded." >> "$REPORT_FILE"
    echo "Starting cleanup..." >> "$REPORT_FILE"

    FILES_DELETED=$(find "$OLD_LOG_DIR" -type f | wc -l)

    find "$OLD_LOG_DIR" -type f -delete

    echo "Deleted Files: $FILES_DELETED" >> "$REPORT_FILE"
    echo "Cleanup completed successfully." >> "$REPORT_FILE"

    echo "$(date) : Deleted $FILES_DELETED files" >> "$LOG_FILE"

else

    echo "Disk usage is healthy." >> "$REPORT_FILE"

    echo "$(date) : No cleanup required" >> "$LOG_FILE"

fi

echo ""
echo "Disk auto-healing completed."
echo "Report location: $REPORT_FILE"
