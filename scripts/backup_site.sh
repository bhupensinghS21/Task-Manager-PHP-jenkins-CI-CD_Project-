#!/bin/bash

echo "===== SITE BACKUP STARTED ====="

DATE=$(date +%F)
FILE="site_backup_$DATE.tar.gz"

echo "Creating backup: $FILE"

tar czf $FILE ./app

if [ $? -eq 0 ]; then
    echo "SUCCESS: Site backup completed"
else
    echo "ERROR: Site backup failed"
    exit 1
fi

echo "===== SITE BACKUP FINISHED ====="
