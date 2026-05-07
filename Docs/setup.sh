#!/bin/bash

ENV_FILE=".env"

echo "=== Environment Configuration ==="

# 1. Prompt for Environment Variables
# Using -s hides the password input for security
read -s -p "Enter Database Password (DB_PASSWORD): " USER_DB_PASSWORD
echo "" # Add a newline after the hidden input

read -p "Enter App URL (APP_URL) [Example: http://localhost:6875]: " USER_APP_URL

echo ""
echo "Note: You can generate your APP_KEY using this command in another terminal:"
echo "  docker run -it --rm --entrypoint /bin/bash lscr.io/linuxserver/bookstack:latest appkey"
read -p "Enter App Key (APP_KEY): " USER_APP_KEY
echo "================================="
echo ""

# 2. Generate the .env file with the provided values
echo "Generating ${ENV_FILE}..."

cat << EOF > "${ENV_FILE}"
DB_PASSWORD=${USER_DB_PASSWORD}
APP_URL=${USER_APP_URL}
APP_KEY=${USER_APP_KEY}
EOF

echo "✅ ${ENV_FILE} has been securely created."
echo ""

# 3. Start the environment
echo "Starting the Docker environment..."
docker compose up -d

# Wait a moment to let the containers initialize before restoring
echo "Waiting 5 seconds for containers to initialize..."
sleep 5

# 4. Run the restore script
echo "Preparing to run restore script..."
if [ -f "./restore.sh" ]; then
    chmod +x ./restore.sh
    echo "Executing ./restore.sh..."
    ./restore.sh
else
    echo "❌ Error: ./restore.sh does not exist in the current directory."
    exit 1
fi

echo "✅ Process complete!"
