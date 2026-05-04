#!/bin/bash

# 1. Check if the backup file actually exists before doing anything
if [ ! -f "bookstack_backup.sql" ]; then
    echo "❌ Error: 'bookstack_backup.sql' not found in the current directory."
    echo "Make sure you are in the correct folder."
    exit 1
fi

# 2. Display a highly visible warning
echo "==========================================================="
echo "🚨 WARNING: DATABASE RESTORATION 🚨"
echo "==========================================================="
echo "You are about to RESTORE the database from 'bookstack_backup.sql'."
echo "This will completely OVERWRITE your current live BookStack data."
echo "Any pages or changes written since the last backup will be LOST FOREVER."
echo "==========================================================="
echo ""

# 3. Prompt for confirmation
read -p "Are you ABSOLUTELY sure you want to replace the data? (y/N): " confirm

# 4. Execute based on user input
if [[ "$confirm" == [yY] || "$confirm" == [yY][eE][sS] ]]; then
    echo ""
    echo "⏳ Restoring database..."
    
    # Inject the SQL dump into the live container
    docker exec -i mariadb sh -c 'mariadb -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE"' < bookstack_backup.sql
    
    echo "✅ Restoration complete! Your data has been successfully replaced."
else
    echo ""
    echo "🛑 Restoration cancelled. Your live data was NOT touched."
    exit 0
fi
