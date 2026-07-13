# Contributing

Thank you for contributing! This guide covers how to set up your environment, follow conventions, and submit changes.

## Development Setup

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd <project-directory>
   ```

2. **Configure environment**

   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

3. **Install dependencies**

   ```bash
   # TODO: add install instructions for your language/stack
   ```

## Branch Naming

| Prefix | Purpose |
|--------|---------|
| `feature/` | New features (e.g. `feature/add-login`) |
| `fix/` | Bug fixes (e.g. `fix/memory-leak`) |
| `docs/` | Documentation only |
| `refactor/` | Code restructuring |
| `chore/` | Maintenance (deps, config, CI) |

## Commit Convention

This project follows [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>: <description>

feat: add user authentication
fix: resolve race condition in task queue
docs: update API reference
```

## Pull Request Checklist

Before submitting a PR, confirm:

- [ ] Code follows the project style (see [`.editorconfig`](.editorconfig))
- [ ] Changes are focused — one feature or fix per PR
- [ ] No new warnings or errors introduced
- [ ] Documentation updated if applicable
- [ ] Related issue is linked (e.g. `Closes #42`)

## Code Style

- Editor settings are defined in [`.editorconfig`](.editorconfig) — your editor should pick these up automatically
- Keep lines under 120 characters where practical
- Write clear comments explaining *why*, not *what*
