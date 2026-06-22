#!/bin/bash

echo "Starting temporary file cleanup..."
echo "Cleanup started at: $(date)"

find /tmp -type f -mtime +7 -delete

echo "Cleanup completed successfully."
