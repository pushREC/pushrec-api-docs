---
created: 2026-01-08
tags: [type/api-reference, api/phone-numbers]
api_name: Clerk Backend API
category: Phone Numbers
endpoint_count: 4
---

# Clerk Backend API - Phone Numbers

[[README|Back to Overview]]

---

## POST /phone_numbers

**Create a phone number**

Create a new phone number

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/phone_numbers"
```

---

## GET /phone_numbers/{phone_number_id}

**Retrieve a phone number**

Returns the details of a phone number

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `phone_number_id` | path | string | Yes | The ID of the phone number to retrieve |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/phone_numbers/{phone_number_id}"
```

---

## DELETE /phone_numbers/{phone_number_id}

**Delete a phone number**

Delete the phone number with the given ID

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `phone_number_id` | path | string | Yes | The ID of the phone number to delete |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/phone_numbers/{phone_number_id}"
```

---

## PATCH /phone_numbers/{phone_number_id}

**Update a phone number**

Updates a phone number

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `phone_number_id` | path | string | Yes | The ID of the phone number to update |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/phone_numbers/{phone_number_id}"
```

---
