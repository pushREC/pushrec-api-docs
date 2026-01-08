---
created: 2026-01-08
tags: [type/api-reference, api/email-addresses]
api_name: Clerk Backend API
category: Email Addresses
endpoint_count: 4
---

# Clerk Backend API - Email Addresses

[[README|Back to Overview]]

---

## POST /email_addresses

**Create an email address**

Create a new email address

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/email_addresses"
```

---

## GET /email_addresses/{email_address_id}

**Retrieve an email address**

Returns the details of an email address.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `email_address_id` | path | string | Yes | The ID of the email address to retrieve |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/email_addresses/{email_address_id}"
```

---

## DELETE /email_addresses/{email_address_id}

**Delete an email address**

Delete the email address with the given ID

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `email_address_id` | path | string | Yes | The ID of the email address to delete |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/email_addresses/{email_address_id}"
```

---

## PATCH /email_addresses/{email_address_id}

**Update an email address**

Updates an email address.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `email_address_id` | path | string | Yes | The ID of the email address to update |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/email_addresses/{email_address_id}"
```

---
