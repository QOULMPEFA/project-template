<!--
  ╔══════════════════════════════════════════════════════════╗
  ║  Project Template                                        ║
  ║  Replace this block and all placeholders with your own   ║
  ╚══════════════════════════════════════════════════════════╝
-->

# Project Name

> Short, one-line description of what this project does.

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## Overview

A longer description explaining the purpose of this project, the problem it solves, and its key features.

## Directory Structure

```
.
├── code/                       # Source code
├── guide/                      # Documentation & guides
│   ├── ai/                     # AI-related documentation
│   └── user/                   # User-facing documentation
│       ├── backup.md           # Backup guide
│       └── git.md              # Git workflow guide
├── log/                        # Logs (gitignored)
│   ├── backup/                 # Backup logs
│   └── update/                 # Update logs
├── .github/                    # GitHub community files
│   ├── ISSUE_TEMPLATE/         # Issue forms (YAML)
│   │   ├── bug_report.yml
│   │   ├── feature_request.yml
│   │   └── config.yml
│   ├── workflows/
│   │   ├── ci.yml              # CI pipeline
│   │   └── stale.yml           # Stale issue/PR cleanup
│   ├── PULL_REQUEST_TEMPLATE.md
│   ├── FUNDING.yml
│   └── dependabot.yml
├── .vscode/                    # VS Code workspace settings
│   ├── settings.json
│   └── extensions.json
├── .editorconfig               # Editor configuration
├── .env.example                # Environment variable template
├── .gitattributes              # Git line-ending normalization
├── .gitignore                  # Git ignore rules
├── .pre-commit-config.yaml     # Pre-commit hooks
├── CHANGELOG.md                # Changelog
├── CLAUDE.md                   # Claude Code project instructions
├── CODE_OF_CONDUCT.md          # Code of conduct
├── CONTRIBUTING.md             # Contribution guidelines
├── LICENSE                     # License
├── Makefile                    # Task runner (setup, lint, test, backup)
├── SECURITY.md                 # Security policy
├── SUPPORT.md                  # Support info
└── README.md                   # This file
```

## Quick Start

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd <project-directory>
   ```

2. **Set up environment**

   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

3. **Install dependencies & set up hooks**

   ```bash
   make setup
   pre-commit install
   ```

4. **Run the project**

   ```bash
   make run
   ```

## Documentation

- [CLAUDE.md](CLAUDE.md) — Claude Code project instructions & commands
- [Backup Guide](guide/user/backup.md) — how to back up and tag releases
- [Git Workflow](guide/user/git.md) — git conventions and common operations
- Run `make help` to see all available tasks.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for development setup, branch naming, and commit conventions.

- [Issue Templates](.github/ISSUE_TEMPLATE/) — bug reports & feature requests
- [Pull Request Template](.github/PULL_REQUEST_TEMPLATE.md) — PR checklist
- [Code of Conduct](CODE_OF_CONDUCT.md) — community standards
- [Security Policy](SECURITY.md) — vulnerability reporting

## License

This project is licensed under the [MIT License](LICENSE).
