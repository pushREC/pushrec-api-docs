---
created: 2026-01-09
tags: [type/api-reference, api/jobs]
api_name: Asana
category: Jobs
endpoint_count: 1
---

# Asana - Jobs

[[README|Back to Overview]]

---

## GET /jobs/{job_gid}

**Get a job by id**

Returns the full record for a job.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/jobs/{job_gid}"
```

---
