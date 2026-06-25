#!/bin/bash

LOG_FILE="/mnt/c/Users/ADMIN/devops-project/enterprise-devops-project/logs/application/app.log"

REPORT_DIR="/mnt/c/Users/ADMIN/devops-project/enterprise-devops-project/monitoring/logs/reports"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

REPORT_FILE="$REPORT_DIR/log_report_$TIMESTAMP.txt"

ERROR_COUNT=$(grep -c "ERROR" "$LOG_FILE")
WARNING_COUNT=$(grep -c "WARNING" "$LOG_FILE")
CRITICAL_COUNT=$(grep -c "CRITICAL" "$LOG_FILE")

echo "========================================" > "$REPORT_FILE"
echo "Log Monitoring Report" >> "$REPORT_FILE"
echo "Generated: $(date)" >> "$REPORT_FILE"
echo "========================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "Total ERROR entries   : $ERROR_COUNT" >> "$REPORT_FILE"
echo "Total WARNING entries : $WARNING_COUNT" >> "$REPORT_FILE"
echo "Total CRITICAL entries: $CRITICAL_COUNT" >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "Recent Issues:" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

grep -E "ERROR|WARNING|CRITICAL" "$LOG_FILE" >> "$REPORT_FILE"
if [ "$CRITICAL_COUNT" -gt 0 ]; then
    echo "" >> "$REPORT_FILE"
    echo "ALERT: Critical issues detected!" >> "$REPORT_FILE"
fi

echo ""
echo "Log monitoring completed."
echo "Report location: $REPORT_FILE"
