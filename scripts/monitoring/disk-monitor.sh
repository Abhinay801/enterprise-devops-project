#!/bin/bash

DISK_THRESHOLD=80

REPORT_DIR="/mnt/c/Users/ADMIN/devops-project/enterprise-devops-project/monitoring/disk/reports"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

REPORT_FILE="$REPORT_DIR/disk_report_$TIMESTAMP.txt"

DISK_USAGE=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

echo "=====================================" > "$REPORT_FILE"
echo "Disk Monitoring Report" >> "$REPORT_FILE"
echo "Generated: $(date)" >> "$REPORT_FILE"
echo "=====================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "Filesystem: /" >> "$REPORT_FILE"
echo "Disk Usage: ${DISK_USAGE}%" >> "$REPORT_FILE"
AVAILABLE_SPACE=$(df -h / | awk 'NR==2 {print $4}')

echo "Available Space: $AVAILABLE_SPACE" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "STATUS:" >> "$REPORT_FILE"

if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    echo "ALERT: Disk usage exceeded threshold!" >> "$REPORT_FILE"
else
    echo "DISK STATUS: HEALTHY" >> "$REPORT_FILE"
fi

echo ""
echo "Disk monitoring completed."
echo "Report location: $REPORT_FILE"
