# Vercel API Documentation

> **Status:** Spec Complete
> **Last Updated:** 2026-01-07

## Quick Start

```bash
# View available endpoints
grep "operationId" openapi.yaml | head -20

# Search for specific endpoint
grep -A 20 "/v9/projects" openapi.yaml

# List all paths
grep -E '^\s+"/' openapi.yaml | head -50
```

## Contents

| File | Description |
|------|-------------|
| `openapi.yaml` | Full OpenAPI 3.0.3 spec (108K lines, 169 endpoints) |
| `SOURCES.md` | Source URLs and scrape history |
| `COVERAGE.md` | Coverage report |

## API Categories

| Category | Description |
|----------|-------------|
| Projects | Create, list, update, delete projects |
| Deployments | Deploy, promote, cancel deployments |
| Domains | Domain management and DNS |
| Teams | Team and member management |
| Edge Config | Edge configuration stores |
| Environment Variables | Project env var management |
| Logs | Access logs and log drains |
| Webhooks | Webhook configuration |
| Access Groups | Access control |
| Artifacts | Build artifact caching |
| Checks | Deployment checks |
| Integrations | Third-party integrations |

## Authentication

```bash
# Set your token
export VERCEL_TOKEN="your-token-here"

# Test API access
curl -H "Authorization: Bearer $VERCEL_TOKEN" \
  https://api.vercel.com/v2/user
```

## Spec Source

```bash
# Refresh spec
curl -s "https://openapi.vercel.sh/" -o openapi.yaml
```

## Resources

- [REST API Docs](https://vercel.com/docs/rest-api)
- [API Reference](https://vercel.com/docs/rest-api/reference)
