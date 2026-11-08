# BSP Game Engine - Documentation

Currently the documentation is only self-hosted, so you should follow this
tutorial to run the documentation.

## Requirements

- A container engine: [`Docker`](https://docs.docker.com/engine/install/) or [`Podman`](https://podman.io/docs/installation)
- Compose support: `docker compose` or `podman compose` (with a Compose provider)

## Hosting the Documentation
First you *must initialize the environment variables* (example in `.env.example`). Create all of the Envs in a file called `.env` in the `Docs` directory.

Start the documentation with your container engine:
```bash
# Docker
docker compose up

# Or Podman
podman compose up
```

If everything is running successfully you should see on [`http://localhost:6875`](http://localhost:6875) the documentation page.

## 💾 Data Management & Backups

This repository uses a hybrid backup approach. The backup script saves the database as `bookstack_backup.sql` and the BookStack `/config/www` files as `bookstack_www.tar.gz`. It combines files from the running container with any files still present in `config/bookstack/www`; existing container files take precedence when paths collide.

**Do NOT commit changes manually.** Instead, use the provided `./backup.sh` script. 

### When to run `./backup.sh`:
*   **After Significant Edits:** Run the script after you finish writing a new chapter, uploading new assets, or making major revisions to the documentation.
*   **Before Server Maintenance:** Always run the script *before* running `docker compose down` or `podman compose down`, or updating the BookStack/MariaDB container images.
*   **Before Pushing:** If you are collaborating, run the script immediately before you `git push` to ensure the remote repository has the absolute latest snapshot of the database. 

*Note: The scripts default to Podman. Set `CONTAINER_ENGINE=docker` when using Docker; the `mariadb` and `bookstack` containers must be running.*

```bash
# Podman (default)
./backup.sh

# Docker
CONTAINER_ENGINE=docker ./backup.sh
```

### 🔄 Disaster Recovery & Restoration

If you are moving to a new server or need to roll back from a catastrophic failure, use the tracked `bookstack_backup.sql` and `bookstack_www.tar.gz` files to restore your instance.

**Do NOT run raw database injection commands.** Instead, use the provided safety script to prevent accidental overwrites. Follow these steps in order:

1.  **Clone & Setup:** Clone this repository and copy `.env.example` to `.env` (filling in your actual passwords and keys).
2.  **Start the Database First** (choose Docker or Podman):
    ```bash
    # Docker
    docker compose up -d mariadb

    # Or Podman
    podman compose up -d mariadb
    ```
3.  **Start BookStack:** The restore script also restores files into its `/config` volume, so start BookStack before running it:
    ```bash
    # Docker
    docker compose up -d bookstack

    # Or Podman
    podman compose up -d bookstack
    ```
4.  **Restore the Backup:** Wait for both containers to initialize, then run the restoration script. It prompts for confirmation before replacing the live database and files. Select the same engine used to start the containers.
    ```bash
    # Podman (default)
    ./restore.sh

    # Docker
    CONTAINER_ENGINE=docker ./restore.sh
    ```
    