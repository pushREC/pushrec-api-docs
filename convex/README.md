# Convex Management API Documentation

> **Status:** Spec Complete
> **Last Updated:** 2026-01-07

## Quick Start

```bash
# View spec structure
head -100 openapi.json | jq .

# List all endpoints
jq '.paths | keys' openapi.json
```

## Contents

| File | Description |
|------|-------------|
| `openapi.json` | Full OpenAPI 3.1.0 spec (715 lines, 9 endpoints) |
| `SOURCES.md` | Source URLs and scrape history |
| `COVERAGE.md` | Coverage report |

## API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/teams/{team_id}/create_project` | POST | Create a new project |
| `/projects` | GET | List projects |
| `/projects/{project_id}` | GET | Get project details |
| `/deployments` | GET | List deployments |
| `/deployments/{deployment_id}` | GET | Get deployment details |
| ... | ... | See spec for complete list |

## Important Notes

1. **This is the Management API** - For creating/managing projects and deployments
2. **Data API is different** - Use `npx convex function-spec --prod` to generate spec for your functions
3. **Authentication varies**:
   - Management API: OAuth or Team tokens from dashboard
   - Functions API: Deploy key (`Authorization: Convex <key>`)

## Authentication

```bash
# For Management API (OAuth or Team token)
curl -H "Authorization: Bearer $CONVEX_TOKEN" \
  https://api.convex.dev/v1/projects

# For Function calls (Deploy key)
curl -H "Authorization: Convex $CONVEX_DEPLOY_KEY" \
  https://your-deployment.convex.site/api/query \
  -d '{"path": "functions:myFunction", "args": {}}'
```

## Spec Source

```bash
# Refresh spec
curl -s "https://api.convex.dev/v1/openapi.json" -o openapi.json
```

## Additional Resources

- [Management API Docs](https://docs.convex.dev/management-api)
- [HTTP API Docs](https://docs.convex.dev/http-api/)
- [OpenAPI & Other Languages](https://docs.convex.dev/client/open-api)
- [GitHub](https://github.com/get-convex)
