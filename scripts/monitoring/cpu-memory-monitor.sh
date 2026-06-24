#!/bin/bash

CPU_THRESHOLD=80
MEMORY_THRESHOLD=80

REPORT_DIR="/mnt/c/Users/ADMIN/devops-project/enterprise-devops-project/monitoring/cpu/reports"

# Create reports directory if it doesn't exist
mkdir -p "$REPORT_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="$REPORT_DIR/cpu_memory_report_$TIMESTAMP.txt"

# Get CPU and Memory usage
CPU_USAGE=$(top -bn1 | awk '/Cpu\(s\)/ {print int($2 + $4)}')
MEMORY_USAGE=$(free | awk '/Mem:/ {print int($3/$2 * 100)}')

echo "========================================" > "$REPORT_FILE"
echo "CPU & Memory Monitoring Report" >> "$REPORT_FILE"
echo "Generated: $(date)" >> "$REPORT_FILE"
echo "========================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "CPU Usage: $CPU_USAGE%" >> "$REPORT_FILE"
echo "Memory Usage: $MEMORY_USAGE%" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "STATUS:" >> "$REPORT_FILE"

# CPU Health Check
if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ]; then
    echo "ALERT: High CPU Usage Detected!" >> "$REPORT_FILE"
else
    echo "CPU Status: HEALTHY" >> "$REPORT_FILE"
fi

# Memory Health Check
if [ "$MEMORY_USAGE" -ge "$MEMORY_THRESHOLD" ]; then
    echo "ALERT: High Memory Usage Detected!" >> "$REPORT_FILE"
else
    echo "Memory Status: HEALTHY" >> "$REPORT_FILE"
fi

echo "========================================" >> "$REPORT_FILE"

echo "Report generated successfully."
echo "Report location: $REPORT_FILE"
