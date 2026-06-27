#!/bin/bash

CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

REPORT_DIR="/mnt/c/Users/ADMIN/devops-project/enterprise-devops-project/monitoring/server-health/reports"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

REPORT_FILE="$REPORT_DIR/server_health_$TIMESTAMP.txt"

HOSTNAME=$(hostname)

OS=$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2)

UPTIME=$(uptime -p)

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')

MEMORY_USAGE=$(free | awk '/Mem:/ {print int($3/$2 * 100)}')

DISK_USAGE=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

echo "=================================================" > "$REPORT_FILE"
echo "Enterprise Server Health Report" >> "$REPORT_FILE"
echo "Generated: $(date)" >> "$REPORT_FILE"
echo "=================================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "Hostname        : $HOSTNAME" >> "$REPORT_FILE"
echo "Operating System: $OS" >> "$REPORT_FILE"
echo "Uptime          : $UPTIME" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "CPU Usage       : ${CPU_USAGE}%" >> "$REPORT_FILE"
echo "Memory Usage    : ${MEMORY_USAGE}%" >> "$REPORT_FILE"
echo "Disk Usage      : ${DISK_USAGE}%" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ] || \
   [ "$MEMORY_USAGE" -ge "$MEMORY_THRESHOLD" ] || \
   [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then

    STATUS="UNHEALTHY"
else
    STATUS="HEALTHY"
fi

echo "Overall Status  : $STATUS" >> "$REPORT_FILE"

if [ "$STATUS" = "UNHEALTHY" ]; then
    echo "ALERT: Immediate attention required!" >> "$REPORT_FILE"
fi

echo "" >> "$REPORT_FILE"
echo "Top 5 CPU Processes:" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

ps -eo pid,user,%cpu,comm --sort=-%cpu | head -n 6 >> "$REPORT_FILE"

echo ""
echo "Health report generated successfully."
echo "Report location: $REPORT_FILE"
