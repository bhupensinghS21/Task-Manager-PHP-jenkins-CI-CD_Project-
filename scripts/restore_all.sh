#!/bin/bash

echo "===== RESTORE STARTED ====="

# Get latest backups automatically
SITE_BACKUP=$(ls -t site_backup_*.tar.gz 2>/dev/null | head -n 1)
DB_BACKUP=$(ls -t db_backup_*.sql 2>/dev/null | head -n 1)

if [ -z "$SITE_BACKUP" ]; then
  echo "ERROR: No site backup found"
  exit 1
fi

if [ -z "$DB_BACKUP" ]; then
  echo "ERROR: No DB backup found"
  exit 1
fi

echo "Using site backup: $SITE_BACKUP"
echo "Using DB backup: $DB_BACKUP"

echo "Restoring site..."
tar xzf $SITE_BACKUP -C ./app

echo "Restoring DB from Kubernetes..."
kubectl exec -i -n devops deployment/mysql -- \
  mysql -uroot -proot123 devopsdb < $DB_BACKUP

echo "SUCCESS: Restore completed"

echo "===== RESTORE COMPLETED ====="

