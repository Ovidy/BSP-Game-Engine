# BSP Game Engine - Documentation

Currently the documentation is only self-hosted, so you should follow this
tutorial to run the documentation.

## Requirements

- [`Docker`](https://docs.docker.com/engine/install/)
- [`Docker Compose`](https://docs.docker.com/compose/install/)

## Hosting the Documentation
First you *must initialize the environment variables* (example in `.env.example`). Create all of the Envs in a file called `.env` in the `Docs` directory.

Run the following command:
```bash
docker compose up
```

If everything is running successfully you should see on [`http://localhost:6875`](http://localhost:6875) the documentation page.

## 💾 Data Management & Backups

This repository uses a hybrid backup approach. We track application configurations and uploaded images directly, but we rely on database dumps for the actual written documentation to prevent Git bloat and database corruption.

**Do NOT commit changes manually.** Instead, use the provided `./backup.sh` script. 

### When to run `./backup.sh`:
*   **After Significant Edits:** Run the script after you finish writing a new chapter, uploading new assets, or making major revisions to the documentation.
*   **Before Server Maintenance:** Always run the script *before* running `docker compose down` or updating the BookStack/MariaDB container images.
*   **Before Pushing:** If you are collaborating, run the script immediately before you `git push` to ensure the remote repository has the absolute latest snapshot of the database. 

*Note: The script requires the Docker containers to be actively running, as it extracts the data directly from the live MariaDB instance.*

### 🔄 Disaster Recovery & Restoration

If you are moving to a new server or need to roll back from a catastrophic failure, use the tracked `bookstack_backup.sql` file to restore your instance. 

**Do NOT run raw database injection commands.** Instead, use the provided safety script to prevent accidental overwrites. Follow these steps in order:

1.  **Clone & Setup:** Clone this repository and copy `.env.example` to `.env` (filling in your actual passwords and keys).
2.  **Start the Database First:**
    ```bash
    docker compose up -d mariadb
    ```
    *(Wait 1-2 minutes for MariaDB to fully initialize for the first time).*
3.  **Restore the Data:** Run the restoration script. It will prompt you for a final confirmation before replacing the live database data with the backup file.
    ```bash
    ./restore.sh
    