---
created: 2026-01-08
tags: [type/api-reference, api/connect]
api_name: Vercel API
category: connect
endpoint_count: 1
---

# Vercel API - Connect

[[README|Back to Overview]]

---

## PATCH /v1/projects/{idOrName}/shared-connect-links

**Configures Static IPs for a project**

Allows configuring Static IPs for a project

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/shared-connect-links"
```

---
