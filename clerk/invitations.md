---
created: 2026-01-08
tags: [type/api-reference, api/invitations]
api_name: Clerk Backend API
category: Invitations
endpoint_count: 4
---

# Clerk Backend API - Invitations

[[README|Back to Overview]]

---

## POST /invitations

**Create an invitation**

Creates a new invitation for the given email address and sends the invitation email.
Keep in mind that you cannot create an invitation if there is already one for the given email address.
Also, trying to create an invitation for an email address that already exists in your application will result to an error.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/invitations"
```

---

## GET /invitations

**List all invitations**

Returns all non-revoked invitations for your application, sorted by creation date

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `status` | query | string | No | Filter invitations based on their status |
| `query` | query | string | No | Filter invitations based on their `email_address`  |
| `order_by` | query | string | No | Allows to return organizations in a particular ord |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/invitations"
```

---

## POST /invitations/bulk

**Create multiple invitations**

Use this API operation to create multiple invitations for the provided email addresses. You can choose to send the
invitations as emails by setting the `notify` parameter to `true`. There cannot be an existing invitation for any
of the email addresses you provide unless you set `ignore_existing` to `true` for specific email addresses. Please
note that there must be no existing user for any of the email addresses you provide, and this rule cannot be bypassed.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/invitations/bulk"
```

---

## POST /invitations/{invitation_id}/revoke

**Revokes an invitation**

Revokes the given invitation.
Revoking an invitation will prevent the user from using the invitation link that was sent to them.
However, it doesn't prevent the user from signing up if they follow the sign up flow.
Only active (i.e. non-revoked) invitations can be revoked.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `invitation_id` | path | string | Yes | The ID of the invitation to be revoked |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/invitations/{invitation_id}/revoke"
```

---
