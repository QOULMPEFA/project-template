# Project Backup Guide

## Overview

Standard backup procedure for this project. Follow these steps each time you complete a meaningful unit of work.

## Backup Workflow

### 1. Sync Working Copies

If the project runs on multiple machines, ensure all working copies are in sync before backing up:

```bash
# On each remote machine:
git fetch origin && git reset --hard origin/main
```

> Skip this step if remote machines are unreachable or already synced.

### 2. Commit & Push

```bash
# Stage all changes
git add .

# Commit with a descriptive message
git commit -m "feat: <description of changes>"

# Push to remote
git push origin main
```

### 3. Tag the Release

Each backup should be tagged with a version number:

```bash
# Create an annotated tag
git tag -a vX.Y -m "vX.Y — <summary of changes>"

# Push tags to remote
git push --tags
```

> **Version format**: `v<major>.<minor>` (e.g. v1.0, v1.1, v1.2 …)
> Increment the version number with each backup.

### 4. Log the Backup

Create a dated log entry under `log/backup/`:

```bash
# Format: YYYYMMDD_HHMMSS.md
echo "# Backup $(date +%Y%m%d_%H%M%S)" > log/backup/$(date +%Y%m%d_%H%M%S).md
```

Include in each log entry:
- Date and time
- Version tag
- Summary of changes
- Any issues or notes

## Restore Workflow

```bash
# Clone the repository
git clone <repository-url>
cd <project-directory>

# Checkout a specific version
git checkout vX.Y
```

## Automated Backup (Optional)

Add a cron job or scheduled task to automate backups:

```bash
# Example: daily backup at 2:00 AM
0 2 * * * cd /path/to/project && /path/to/backup_script.sh
```
