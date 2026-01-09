---
created: 2026-01-09
tags: [type/api-reference, api/admin.inviterequests]
api_name: Slack Web API
category: admin.inviteRequests
endpoint_count: 3
---

# Slack Web API - Admin.Inviterequests

[[README|Back to Overview]]

---

## POST /admin.inviteRequests.approve

Approve a workspace invite request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.invit |
| `team_id` | formData | string | No | ID for the workspace where the invite request was  |
| `invite_request_id` | formData | string | Yes | ID of the request to invite. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.inviteRequests.approve"
```

---

## POST /admin.inviteRequests.deny

Deny a workspace invite request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.invit |
| `team_id` | formData | string | No | ID for the workspace where the invite request was  |
| `invite_request_id` | formData | string | Yes | ID of the request to invite. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.inviteRequests.deny"
```

---

## GET /admin.inviteRequests.list

List all pending workspace invite requests.

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
  "/admin.inviteRequests.list"
```

---
