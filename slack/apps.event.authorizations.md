---
created: 2026-01-09
tags: [type/api-reference, api/apps.event.authorizations]
api_name: Slack Web API
category: apps.event.authorizations
endpoint_count: 1
---

# Slack Web API - Apps.Event.Authorizations

[[README|Back to Overview]]

---

## GET /apps.event.authorizations.list

Get a list of authorizations for the given event context. Each authorization represents an app installation that the event is visible to.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `authorizati |
| `event_context` | query | string | Yes |  |
| `cursor` | query | string | No |  |
| `limit` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/apps.event.authorizations.list"
```

---
