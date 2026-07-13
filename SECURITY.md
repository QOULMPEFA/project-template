# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability, **please do not open a public issue**.

Instead, report it privately:

- **Email**: `<security-contact@example.com>`
- **Expected response**: within 48 hours
- **Disclosure**: We follow a 90-day coordinated disclosure timeline

## Supported Versions

Only the latest release receives security updates.

| Version | Supported |
|---------|-----------|
| Latest  | ✅ Yes    |
| < 1.0   | ❌ No     |

## Security Best Practices

- Never commit secrets (API keys, tokens, passwords) — use `.env`
- Review the [`.gitignore`](.gitignore) to ensure sensitive files are excluded
- Keep dependencies updated — Dependabot is configured in [`.github/dependabot.yml`](.github/dependabot.yml)
- Rotate credentials regularly
- Use environment-specific configurations (dev / staging / production)
