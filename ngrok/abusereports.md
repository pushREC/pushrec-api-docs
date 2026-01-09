---
created: 2026-01-09
tags: [type/api-reference, api/abusereports]
api_name: ngrok OpenAPI
category: AbuseReports
endpoint_count: 2
---

# ngrok OpenAPI - Abusereports

[[README|Back to Overview]]

---

## POST /abuse_reports

**Create**

Creates a new abuse report which will be reviewed by our system and abuse response team. This API is only available to authorized accounts. Contact abuse@ngrok.com to request access


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/abuse_reports"
```

---

## GET /abuse_reports/{id}

**Get**

Get the detailed status of abuse report by ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | a resource identifier
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/abuse_reports/{id}"
```

---
