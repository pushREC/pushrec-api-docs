---
created: 2026-01-09
tags: [type/api-reference, api/ticket]
api_name: Netlify's API documentation
category: ticket
endpoint_count: 2
---

# Netlify's API documentation - Ticket

[[README|Back to Overview]]

---

## POST /oauth/tickets

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `client_id` | query | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/oauth/tickets"
```

---

## GET /oauth/tickets/{ticket_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `ticket_id` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/oauth/tickets/{ticket_id}"
```

---
