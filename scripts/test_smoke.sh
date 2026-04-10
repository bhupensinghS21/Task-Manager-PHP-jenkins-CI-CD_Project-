#!/bin/bash

echo "===== SMOKE TEST STARTED ====="

URL="http://127.0.0.1:33399/index.html"

STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)

echo "HTTP STATUS: $STATUS"

if [ "$STATUS" -eq 200 ]; then
  echo "SUCCESS: Smoke test passed"
else
  echo "ERROR: Smoke test failed"
  exit 1
fi

echo "===== SMOKE TEST COMPLETED ====="

