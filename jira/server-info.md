---
created: 2026-01-09
tags: [type/api-reference, api/server-info]
api_name: The Jira Cloud platform REST API
category: Server info
endpoint_count: 1
---

# The Jira Cloud platform REST API - Server Info

[[README|Back to Overview]]

---

## GET /rest/api/3/serverInfo

**Get Jira instance info**

Returns information about the Jira instance.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/serverInfo"
```

---
