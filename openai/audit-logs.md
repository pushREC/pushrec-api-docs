---
created: 2026-01-08
tags: [type/api-reference, api/audit-logs]
api_name: OpenAI API
category: Audit Logs
endpoint_count: 1
---

# OpenAI API - Audit Logs

[[README|Back to Overview]]

---

## GET /organization/audit_logs

**List audit logs**

List user actions and configuration changes within this organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `effective_at` | query | object | No | Return only events whose `effective_at` (Unix seco |
| `project_ids[]` | query | array | No | Return only events for these projects. |
| `event_types[]` | query | array | No | Return only events with a `type` in one of these v |
| `actor_ids[]` | query | array | No | Return only events performed by these actors. Can  |
| `actor_emails[]` | query | array | No | Return only events performed by users with these e |
| `resource_ids[]` | query | array | No | Return only events performed on these targets. For |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |
| `before` | query | string | No | A cursor for use in pagination. `before` is an obj |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/audit_logs"
```

---
