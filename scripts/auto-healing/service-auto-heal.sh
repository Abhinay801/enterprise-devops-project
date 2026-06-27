#!/bin/bash

SERVICE_NAME="cron"

BASE_DIR="/mnt/c/Users/ADMIN/devops-project/enterprise-devops-project"

REPORT_DIR="$BASE_DIR/auto-healing/service-recovery/reports"

LOG_DIR="$BASE_DIR/auto-healing/service-recovery/logs"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

REPORT_FILE="$REPORT_DIR/service_heal_$TIMESTAMP.txt"

LOG_FILE="$LOG_DIR/healing_history.log"

echo "======================================" > "$REPORT_FILE"
echo "Service Auto-Healing Report" >> "$REPORT_FILE"
echo "Generated: $(date)" >> "$REPORT_FILE"
echo "======================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

SERVICE_STATUS=$(systemctl is-active $SERVICE_NAME)

echo "Service Name: $SERVICE_NAME" >> "$REPORT_FILE"
echo "Current Status: $SERVICE_STATUS" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

if [ "$SERVICE_STATUS" != "active" ]; then

    echo "Service is DOWN." >> "$REPORT_FILE"
    echo "Attempting automatic restart..." >> "$REPORT_FILE"

    sudo systemctl restart $SERVICE_NAME

    sleep 3

    NEW_STATUS=$(systemctl is-active $SERVICE_NAME)

    if [ "$NEW_STATUS" = "active" ]; then

        echo "Service restarted successfully." >> "$REPORT_FILE"

        echo "$(date) : $SERVICE_NAME restarted successfully" >> "$LOG_FILE"

    else

        echo "Service restart FAILED." >> "$REPORT_FILE"

        echo "$(date) : Failed to restart $SERVICE_NAME" >> "$LOG_FILE"

    fi

else

    echo "Service is healthy." >> "$REPORT_FILE"

    echo "$(date) : $SERVICE_NAME healthy" >> "$LOG_FILE"

fi

echo ""
echo "Auto-healing completed."
echo "Report location: $REPORT_FILE"
