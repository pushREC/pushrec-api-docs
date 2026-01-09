---
created: 2026-01-09
tags: [type/api-reference, api/admin.inviterequests.denied]
api_name: Slack Web API
category: admin.inviteRequests.denied
endpoint_count: 1
---

# Slack Web API - Admin.Inviterequests.Denied

[[README|Back to Overview]]

---

## GET /admin.inviteRequests.denied.list

List all denied workspace invite requests.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.invit |
| `team_id` | query | string | No | ID for the workspace where the invite requests wer |
| `cursor` | query | string | No | Value of the `next_cursor` field sent as part of t |
| `limit` | query | string | No | The number of results that will be returned by the |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.inviteRequests.denied.list"
```

---
