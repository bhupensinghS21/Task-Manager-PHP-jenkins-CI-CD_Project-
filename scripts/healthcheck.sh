#!/bin/bash

echo "===== HEALTH CHECK STARTED ====="

URL="http://127.0.0.1:33399/index.html"

STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)

echo "HTTP STATUS: $STATUS"

if [ "$STATUS" -eq 200 ]; then
  echo "SUCCESS: Application is healthy"
else
  echo "ERROR: Application is not reachable"
  exit 1
fi

echo "===== HEALTH CHECK COMPLETED ====="

