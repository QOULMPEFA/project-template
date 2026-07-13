# Git Workflow Guide

## Remote Repository

- **URL**: `<repository-url>`
- **Default Branch**: `main`

## Authentication

Use one of the following methods to authenticate with the remote:

### Option 1: Personal Access Token (HTTPS)

1. Generate a token at: GitHub → Settings → Developer settings → Personal access tokens
2. Store it in your Git credential manager:

   ```bash
   git config --global credential.helper cache
   ```

3. Use the token as your password when pushing.

> ⚠️ **Never commit tokens or credentials to the repository.** Use `.env` or a secrets manager for automation.

### Option 2: SSH Key

```bash
# Generate an SSH key (if you don't have one)
ssh-keygen -t ed25519 -C "your-email@example.com"

# Add to GitHub: Settings → SSH and GPG keys
# Test connection:
ssh -T git@github.com

# Use SSH remote URL:
git remote set-url origin git@github.com:<user>/<repo>.git
```

## Commit Convention

Follow [Conventional Commits](https://www.conventionalcommits.org/):

| Prefix | Purpose |
|--------|---------|
| `feat:` | New feature |
| `fix:` | Bug fix |
| `docs:` | Documentation only |
| `style:` | Formatting (no code change) |
| `refactor:` | Code restructuring |
| `test:` | Adding or fixing tests |
| `chore:` | Maintenance tasks |
| `ci:` | CI/CD changes |

## Version Tags

- **Format**: `v<major>.<minor>` (Semantic Versioning)
- **Create**: `git tag -a v1.0 -m "v1.0 — <summary>"`
- **Push**: `git push --tags`
- **List**: `git tag -l`
- **Rule**: increment the version with every backup; the tag message should briefly describe the change.

## Common Operations

```bash
# View commit history (compact)
git log --oneline --graph --all

# Discard local changes
git restore <file>

# Undo last commit (keep changes staged)
git reset --soft HEAD~1

# Stash work in progress
git stash
git stash pop

# Show what changed
git diff
git diff --staged
```

---

## Backup & Deployment

### Git Flow

```bash
# PC — commit, push, tag
git add . && git commit -m "feat: <description>"
git push origin main
git tag -a vX.Y -m "vX.Y — <summary>" && git push --tags

# Each device — pull latest, restart service
git fetch origin && git reset --hard origin/main
sudo systemctl restart <service>.service
```

> SSH into the device first if remote: `ssh <user>@<ip>`. Use `echo <pwd> | sudo -S …` if sudo needs a password.

### Devices

| Device | SSH / User | Workspace | Service | Notes |
|--------|-----------|-----------|---------|-------|
| `<name>` | `<ip>` / `<user>` | `<path>` | `<svc>.service` | `<extra>` |

### Deployment Steps (per device)

```bash
# 1. System deps
apt update && apt install -y <packages>

# 2. Project deps
pip install <packages>

# 3. Pull code
cd <workspace>
git fetch origin && git reset --hard origin/main

# 4. systemd service
systemctl daemon-reload
systemctl enable --now <service>.service
```

### Verify

```bash
systemctl is-active <service>   # active
ss -tlnp | grep <port>          # listening
journalctl -u <service> -n 20  # no errors
```

### Key Files

| File | Purpose |
|------|---------|
| `<entry-point>` | App entry point |
| `<config>` | Runtime config |
| `<data-dir>/` | Persistent data |

### Troubleshooting

| Problem | Fix |
|---------|-----|
| `<symptom>` | `<solution>` |

> ⚠️ Credentials (PAT, passwords) stay out of the repo.
