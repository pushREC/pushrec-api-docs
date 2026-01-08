---
created: 2026-01-08
tags: [type/api-reference, api/invites]
api_name: OpenAI API
category: Invites
endpoint_count: 4
---

# OpenAI API - Invites

[[README|Back to Overview]]

---

## GET /organization/invites

**List invites**

Returns a list of invites in the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/invites"
```

---

## POST /organization/invites

**Create invite**

Create an invite for a user to the organization. The invite must be accepted by the user before they have access to the organization.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/invites"
```

---

## GET /organization/invites/{invite_id}

**Retrieve invite**

Retrieves an invite.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `invite_id` | path | string | Yes | The ID of the invite to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/invites/{invite_id}"
```

---

## DELETE /organization/invites/{invite_id}

**Delete invite**

Delete an invite. If the invite has already been accepted, it cannot be deleted.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `invite_id` | path | string | Yes | The ID of the invite to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/invites/{invite_id}"
```

---
