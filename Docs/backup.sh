#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "📦 Starting BookStack backup process..."

# 1. Create the database dump from the running MariaDB container
echo "💾 Dumping database to bookstack_backup.sql..."
docker exec mariadb mariadb-dump -u bookstack -pbookstack bookstack > bookstack_backup.sql

# 2. Stage all changes (the SQL file, config changes, and new image uploads)
echo "📂 Staging files for Git..."
git add .

# 3. Create a commit with a timestamp
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
echo "📝 Committing changes..."
git commit -m "Documentation backup: $TIMESTAMP"

# 4. (Optional) Push to remote repository
# Uncomment the line below if you want it to automatically push to GitHub/GitLab
# git push

echo "✅ Backup complete and committed to Git!"
