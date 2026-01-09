---
created: 2026-01-09
tags: [type/api-reference, api/logs]
api_name: Apify API
category: Logs
endpoint_count: 1
---

# Apify API - Logs

[[README|Back to Overview]]

---

## GET /v2/logs/{buildOrRunId}

**Get log**

Retrieves logs for a specific Actor build or run.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `buildOrRunId` | path | string | Yes | ID of the Actor build or run. |
| `stream` | query | boolean | Yes | If `true` or `1` then the logs will be streamed as |
| `download` | query | boolean | Yes | If `true` or `1` then the web browser will downloa |
| `raw` | query | boolean | No | If `true` or `1`, the logs will be kept verbatim.  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/logs/{buildOrRunId}"
```

---
