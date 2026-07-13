# Git Backup Info

## Remote
- URL: `https://github.com/<user>/<repo>`
- PAT: `<github_pat_...>` (Expires on <date>)

## Backup Flow
1. PC: commit changes → `git push origin main`
2. PC: `git tag -a vX.Y -m "vX.Y — <summary>" && git push --tags`
3. Device 1: `git fetch origin && git reset --hard origin/main`
4. Device 1: `echo <pwd> | sudo -S systemctl restart <service>.service`
5. Device 2: `git fetch origin && git reset --hard origin/main`
6. Device 2: `sudo systemctl restart <service>.service`

## Version Tags
- 格式：`v<主>.<次>`，如 v1.0, v1.1, v1.2 ...
- 每次备份必须递增版本号并打 tag
- Tag 信息简要描述本次变更

## Device 1 (example)
- SSH: `<ip>:<port>` | User: `<user>` | Pass: `<password>`
- Workspace: `<path>`
- Service: `<service>.service`
- Sudo password: `<password>`
- Active modules: <list>
- Web GUI: `<url>`

## Device 2 (example)
- Service: `<service>.service`
- Restart: `echo <password> | sudo -S systemctl restart <service>.service`
