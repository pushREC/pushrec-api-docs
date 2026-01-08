---
created: 2026-01-08
tags: [type/api-reference, api/logs]
api_name: Vercel API
category: logs
endpoint_count: 1
---

# Vercel API - Logs

[[README|Back to Overview]]

---

## GET /v1/projects/{projectId}/deployments/{deploymentId}/runtime-logs

**Get logs for a deployment**

Returns a stream of logs for a given deployment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | path | string | Yes |  |
| `deploymentId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{projectId}/deployments/{deploymentId}/runtime-logs"
```

---
