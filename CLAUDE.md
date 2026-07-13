# CLAUDE.md — Project Instructions for Claude Code

## Project Overview

- **Name**: `<project-name>`
- **Stack**: `<language/framework>` (e.g. Python 3.12 / FastAPI, Node 22 / Express)
- **Entry point**: `code/`

## Commands

| Task | Command |
|------|---------|
| Setup | `make setup` |
| Lint | `make lint` |
| Test | `make test` |
| Run | `make run` |
| Backup | `make backup` |

## Code Conventions

- See [`.editorconfig`](.editorconfig) for formatting rules
- Follow [Conventional Commits](https://www.conventionalcommits.org/) for commit messages
- Branch naming: `feature/`, `fix/`, `docs/`, `refactor/`, `chore/`

## Directory Conventions

| Directory | Purpose |
|-----------|---------|
| `code/` | Source code |
| `guide/ai/` | AI assistant prompts & configuration |
| `guide/user/` | User-facing documentation & guides |
| `log/` | Runtime logs (gitignored, `.gitkeep`-tracked dirs) |

## Workflows

### Before committing

1. Run `make lint` and fix issues
2. Run `make test` and ensure all pass
3. Pre-commit hooks will auto-check line endings, trailing whitespace, and secrets

### Backup procedure

See [guide/user/backup.md](guide/user/backup.md) for the full backup workflow including tagging and logging.
