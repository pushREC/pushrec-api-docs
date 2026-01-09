---
created: 2026-01-09
tags: [type/api-reference, api/batch-api]
api_name: Asana
category: Batch API
endpoint_count: 1
---

# Asana - Batch Api

[[README|Back to Overview]]

---

## POST /batch

**Submit parallel requests**

Make multiple requests in parallel to Asana's API.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/batch"
```

---
