#!/bin/bash

echo "===== DB BACKUP STARTED ====="

BACKUP_FILE="db_backup_$(date +%F).sql"

echo "Taking backup from Kubernetes MySQL..."

kubectl exec -n devops deployment/mysql -- \
  mysqldump -uroot -proot123 devopsdb > $BACKUP_FILE

if [ $? -eq 0 ]; then
  echo "SUCCESS: DB backup saved -> $BACKUP_FILE"
else
  echo "ERROR: Backup failed"
  exit 1
fi

echo "===== DB BACKUP COMPLETED ====="

