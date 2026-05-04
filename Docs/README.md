# BSP Game Engine - Documentation

Currently the documentation is only self-hosted, so you should follow this
tutorial to run the documentation.

## Requirements

- [`Docker`](https://docs.docker.com/engine/install/)
- [`Docker Compose`](https://docs.docker.com/compose/install/)

## Hosting the Documentation

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
