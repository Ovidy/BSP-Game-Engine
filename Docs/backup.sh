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

DB_TEMP="$(mktemp "${SCRIPT_DIR}/.${DB_BACKUP}.XXXXXX")"
WWW_TEMP="$(mktemp "${SCRIPT_DIR}/.${WWW_BACKUP}.XXXXXX")"
WWW_STAGE="$(mktemp -d "${SCRIPT_DIR}/.bookstack-www.XXXXXX")"
trap 'rm -f "$DB_TEMP" "$WWW_TEMP"; rm -rf "$WWW_STAGE"' EXIT

echo "📦 Starting BookStack backup process..."

# 1. Back up the database and BookStack files from the running containers.
echo "💾 Dumping database to ${DB_BACKUP}..."
"$CONTAINER_ENGINE" exec mariadb sh -c 'mariadb-dump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE"' > "$DB_TEMP"

echo "📂 Collecting BookStack files from the container..."
"$CONTAINER_ENGINE" exec bookstack tar -cf - -C /config www | tar -xf - -C "$WWW_STAGE"

LEGACY_WWW="${SCRIPT_DIR}/config/bookstack/www"
if [ -d "$LEGACY_WWW" ]; then
    echo "📂 Including remaining files from ${LEGACY_WWW}..."
    mkdir -p "$WWW_STAGE/www"
    tar -cf - -C "$LEGACY_WWW" . | tar -kxf - -C "$WWW_STAGE/www"
fi

echo "🗜️  Archiving BookStack files to ${WWW_BACKUP}..."
tar -czf "$WWW_TEMP" -C "$WWW_STAGE" www

mv "$DB_TEMP" "$DB_BACKUP"
mv "$WWW_TEMP" "$WWW_BACKUP"

# 2. Stage the backup files.
echo "📂 Staging backup files for Git..."
git add "$DB_BACKUP" "$WWW_BACKUP"

# 3. Commit the backups with a timestamp.
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
echo "📝 Committing changes..."
git commit -m "Documentation backup: $TIMESTAMP"

# 4. (Optional) Push to remote repository
# Uncomment the line below if you want it to automatically push to GitHub/GitLab
# git push

echo "✅ Backup complete and committed to Git!"
