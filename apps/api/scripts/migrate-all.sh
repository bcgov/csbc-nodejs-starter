#!/bin/sh
# Auto-discover and run all database migrations
# Scans drizzle/ directory for subdirectories containing drizzle.config.ts

set -e

echo "Starting database migrations..."

failed=0
count=0

for config in ./drizzle/*/drizzle.config.ts; do
  if [ -f "$config" ]; then
    db_name=$(dirname "$config" | xargs basename)
    count=$((count + 1))
    echo ""
    echo "[$count] Running migrations for database: $db_name"
    echo "    Config: $config"

    if npx drizzle-kit migrate --config="$config"; then
      echo "    Status: SUCCESS"
    else
      echo "    Status: FAILED"
      failed=1
    fi
  fi
done

echo ""
if [ $count -eq 0 ]; then
  echo "No database configurations found in drizzle/*/"
  exit 1
fi

if [ $failed -eq 0 ]; then
  echo "All $count database migration(s) completed successfully."
else
  echo "One or more migrations failed."
  exit 1
fi
