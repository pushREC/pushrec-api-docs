---
created: 2026-01-08
tags: [type/api-reference, api/webhooks]
api_name: Clerk Backend API
category: Webhooks
endpoint_count: 3
---

# Clerk Backend API - Webhooks

[[README|Back to Overview]]

---

## POST /webhooks/svix

**Create a Svix app**

Create a Svix app and associate it with the current instance

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/webhooks/svix"
```

---

## DELETE /webhooks/svix

**Delete a Svix app**

Delete a Svix app and disassociate it from the current instance

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/webhooks/svix"
```

---

## POST /webhooks/svix_url

**Create a Svix Dashboard URL**

Generate a new url for accessing the Svix's management dashboard for that particular instance

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/webhooks/svix_url"
```

---
