---
created: 2026-01-09
tags: [type/api-reference, api/files.comments]
api_name: Slack Web API
category: files.comments
endpoint_count: 1
---

# Slack Web API - Files.Comments

[[README|Back to Overview]]

---

## POST /files.comments.delete

Deletes an existing comment on a file.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `files:write |
| `file` | formData | string | No | File to delete a comment from. |
| `id` | formData | string | No | The comment to delete. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/files.comments.delete"
```

---
