---
created: 2026-01-08
tags: [type/api-reference, api/organization-invitations]
api_name: Clerk Backend API
category: Organization Invitations
endpoint_count: 7
---

# Clerk Backend API - Organization Invitations

[[README|Back to Overview]]

---

## GET /organization_invitations

**Get a list of organization invitations for the current instance**

This request returns the list of organization invitations for the instance.
Results can be paginated using the optional `limit` and `offset` query parameters.
You can filter them by providing the 'status' query parameter, that accepts multiple values.
You can change the order by providing the 'order' query parameter, that accepts multiple values.
You can filter by the invited user email address providing the `query` query parameter.
The organization invitations are ordered by descending creation date by default.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `order_by` | query | string | No | Allows to return organization invitations in a par |
| `status` | query | string | No | Filter organization invitations based on their sta |
| `query` | query | string | No | Filter organization invitations based on their `em |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organization_invitations"
```

---

## POST /organizations/{organization_id}/invitations

**Create and send an organization invitation**

Creates a new organization invitation and sends an email to the provided `email_address` with a link to accept the invitation and join the organization.
You can specify the `role` for the invited organization member.

New organization invitations get a "pending" status until they are revoked by an organization administrator or accepted by the invitee.

The request body supports passing an optional `redirect_url` parameter.
When the invited user clicks the link to accept the invitation, they will be redirected to the URL provided.
Use this parameter to implement a custom invitation acceptance flow.

You can specify the ID of the user that will send the invitation with the `inviter_user_id` parameter.
That user must be a member with administrator privileges in the organization.
Only "admin" members can create organization invitations.

You can optionally provide public and private metadata for the organization invitation.
The public metadata are visible by both the Frontend and the Backend whereas the private ones only by the Backend.
When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The ID of the organization for which to send the i |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/invitations"
```

---

## GET /organizations/{organization_id}/invitations

**Get a list of organization invitations**

This request returns the list of organization invitations.
Results can be paginated using the optional `limit` and `offset` query parameters.
You can filter them by providing the 'status' query parameter, that accepts multiple values.
The organization invitations are ordered by descending creation date.
Most recent invitations will be returned first.
Any invitations created as a result of an Organization Domain are not included in the results.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The organization ID. |
| `status` | query | string | No | Filter organization invitations based on their sta |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/invitations"
```

---

## POST /organizations/{organization_id}/invitations/bulk

**Bulk create and send organization invitations**

Creates new organization invitations in bulk and sends out emails to the provided email addresses with a link to accept the invitation and join the organization.
You can specify a different `role` for each invited organization member.
New organization invitations get a "pending" status until they are revoked by an organization administrator or accepted by the invitee.
The request body supports passing an optional `redirect_url` parameter for each invitation.
When the invited user clicks the link to accept the invitation, they will be redirected to the provided URL.
Use this parameter to implement a custom invitation acceptance flow.
You can specify the ID of the user that will send the invitation with the `inviter_user_id` parameter. Each invitation
can have a different inviter user.
Inviter users must be members with administrator privileges in the organization.
Only "admin" members can create organization invitations.
You can optionally provide public and private metadata for each organization invitation. The public metadata are visible
by both the Frontend and the Backend, whereas the private metadata are only visible by the Backend.
When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The organization ID. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/invitations/bulk"
```

---

## GET /organizations/{organization_id}/invitations/pending

**Get a list of pending organization invitations**

This request returns the list of organization invitations with "pending" status.
These are the organization invitations that can still be used to join the organization, but have not been accepted by the invited user yet.
Results can be paginated using the optional `limit` and `offset` query parameters.
The organization invitations are ordered by descending creation date.
Most recent invitations will be returned first.
Any invitations created as a result of an Organization Domain are not included in the results.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The organization ID. |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/invitations/pending"
```

---

## GET /organizations/{organization_id}/invitations/{invitation_id}

**Retrieve an organization invitation by ID**

Use this request to get an existing organization invitation by ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The organization ID. |
| `invitation_id` | path | string | Yes | The organization invitation ID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/invitations/{invitation_id}"
```

---

## POST /organizations/{organization_id}/invitations/{invitation_id}/revoke

**Revoke a pending organization invitation**

Use this request to revoke a previously issued organization invitation.
Revoking an organization invitation makes it invalid; the invited user will no longer be able to join the organization with the revoked invitation.
Only organization invitations with "pending" status can be revoked.
The request accepts the `requesting_user_id` parameter to specify the user which revokes the invitation.
Only users with "admin" role can revoke invitations.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The organization ID. |
| `invitation_id` | path | string | Yes | The organization invitation ID. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/invitations/{invitation_id}/revoke"
```

---
