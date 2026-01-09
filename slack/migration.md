---
created: 2026-01-09
tags: [type/api-reference, api/migration]
api_name: Slack Web API
category: migration
endpoint_count: 1
---

# Slack Web API - Migration

[[README|Back to Overview]]

---

## GET /migration.exchange

For Enterprise Grid workspaces, map local user IDs to global user IDs

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `tokens.basi |
| `users` | query | string | Yes | A comma-separated list of user ids, up to 400 per  |
| `team_id` | query | string | No | Specify team_id starts with `T` in case of Org Tok |
| `to_old` | query | string | No | Specify `true` to convert `W` global user IDs to w |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/migration.exchange"
```

---
