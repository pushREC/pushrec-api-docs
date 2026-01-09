---
created: 2026-01-09
tags: [type/api-reference, api/general]
api_name: The Jira Cloud platform REST API
category: general
endpoint_count: 1
---

# The Jira Cloud platform REST API - General

[[README|Back to Overview]]

---

## POST /rest/internal/api/latest/worklog/bulk

**Get worklogs by issue id and worklog id**

Returns worklog details for a list of issue ID and worklog ID pairs.

This is an internal API for bulk fetching worklogs by their issue and worklog IDs. Worklogs that don't exist will be filtered out from the response.

The returned list of worklogs is limited to 1000 items.

**[Permissions](#permissions) required:** This is an internal service-to-service API that requires ASAP authentication. No user permission checks are performed as this bypasses normal user context.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/internal/api/latest/worklog/bulk"
```

---
