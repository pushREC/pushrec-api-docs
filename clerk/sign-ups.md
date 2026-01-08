---
created: 2026-01-08
tags: [type/api-reference, api/sign-ups]
api_name: Clerk Backend API
category: Sign Ups
endpoint_count: 2
---

# Clerk Backend API - Sign Ups

[[README|Back to Overview]]

---

## GET /sign_ups/{id}

**Retrieve a sign-up by ID**

Retrieve the details of the sign-up with the given ID

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the sign-up to retrieve |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/sign_ups/{id}"
```

---

## PATCH /sign_ups/{id}

**Update a sign-up**

Update the sign-up with the given ID

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the sign-up to update |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/sign_ups/{id}"
```

---
