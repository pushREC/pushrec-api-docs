---
created: 2026-01-09
tags: [type/api-reference, api/applicationsessions]
api_name: ngrok OpenAPI
category: ApplicationSessions
endpoint_count: 3
---

# ngrok OpenAPI - Applicationsessions

[[README|Back to Overview]]

---

## GET /app/sessions

**List**

List all application sessions for this account.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `before_id` | query | string | No |  |
| `limit` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/app/sessions"
```

---

## GET /app/sessions/{id}

**Get**

Get an application session by ID.


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
  "https://api.ngrok.com/app/sessions/{id}"
```

---

## DELETE /app/sessions/{id}

**Delete**

Delete an application session by ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | a resource identifier
 |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/app/sessions/{id}"
```

---
