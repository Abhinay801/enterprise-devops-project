#!/bin/bash

REPORT_DIR="/mnt/c/Users/ADMIN/devops-project/enterprise-devops-project/monitoring/process/reports"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

REPORT_FILE="$REPORT_DIR/process_report_$TIMESTAMP.txt"

echo "=====================================" > "$REPORT_FILE"
echo "Process Monitoring Report" >> "$REPORT_FILE"
echo "Generated: $(date)" >> "$REPORT_FILE"
echo "=====================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "Top 5 CPU-consuming processes:" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

ps -eo pid,user,%cpu,comm --sort=-%cpu | head -n 6 >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "Report saved successfully."

echo "Process monitoring completed."
echo "Report location: $REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "Memory Usage Summary:" >> "$REPORT_FILE"
free -h >> "$REPORT_FILE"
