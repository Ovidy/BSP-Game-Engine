#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"
cd "$SCRIPT_DIR"

DB_BACKUP="bookstack_backup.sql"
WWW_BACKUP="bookstack_www.tar.gz"
CONTAINER_ENGINE="${CONTAINER_ENGINE:-podman}"
if ! command -v "$CONTAINER_ENGINE" >/dev/null 2>&1; then
    echo "❌ Error: container engine '${CONTAINER_ENGINE}' was not found."
    echo "Set CONTAINER_ENGINE to 'docker' or 'podman'."
    exit 1
fi

# 1. Check that both parts of the backup exist before restoring either one.
if [ ! -f "$DB_BACKUP" ] || [ ! -f "$WWW_BACKUP" ]; then
    echo "❌ Error: one or more backup files are missing from the Docs directory."
    echo "Both '${DB_BACKUP}' and '${WWW_BACKUP}' are required. Make sure you are in the correct folder."
    exit 1
fi

# 2. Display a highly visible warning
echo "==========================================================="
echo "🚨 WARNING: DATABASE RESTORATION 🚨"
echo "==========================================================="
echo "You are about to RESTORE the database from 'bookstack_backup.sql'."
echo "The database will be overwritten, and files in the BookStack volume may be replaced."
echo "Any pages or file changes made since the backup may be LOST."
echo "==========================================================="
echo ""

# 3. Prompt for confirmation
read -p "Are you ABSOLUTELY sure you want to replace the data? (y/N): " confirm

# 4. Execute based on user input
if [[ "$confirm" == [yY] || "$confirm" == [yY][eE][sS] ]]; then
    echo ""
    echo "⏳ Restoring uploaded files..."
    "$CONTAINER_ENGINE" exec -i bookstack tar -xzf - -C /config < "$WWW_BACKUP"

    echo "⏳ Restoring database..."
    "$CONTAINER_ENGINE" exec -i mariadb sh -c 'mariadb -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE"' < "$DB_BACKUP"
    
    echo "✅ Restoration complete! Your database and BookStack files have been restored."
else
    echo ""
    echo "🛑 Restoration cancelled. Your live data was NOT touched."
    exit 0
fi
