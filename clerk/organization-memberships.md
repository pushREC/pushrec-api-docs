---
created: 2026-01-08
tags: [type/api-reference, api/organization-memberships]
api_name: Clerk Backend API
category: Organization Memberships
endpoint_count: 6
---

# Clerk Backend API - Organization Memberships

[[README|Back to Overview]]

---

## POST /organizations/{organization_id}/memberships

**Create a new organization membership**

Adds a user as a member to the given organization.
Only users in the same instance as the organization can be added as members.

This organization will be the user's [active organization](https://clerk.com/docs/organizations/overview#active-organization)
the next time they create a session, presuming they don't explicitly set a
different organization as active before then.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The ID of the organization where the new membershi |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/memberships"
```

---

## GET /organizations/{organization_id}/memberships

**Get a list of all members of an organization**

Retrieves all user memberships for the given organization

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The organization ID. |
| `order_by` | query | string | No | Sorts organizations memberships by phone_number, e |
| `user_id` | query | array | No | Returns users with the user ids specified. For eac |
| `email_address` | query | array | No | Returns users with the specified email addresses.  |
| `phone_number` | query | array | No | Returns users with the specified phone numbers. Ac |
| `username` | query | array | No | Returns users with the specified usernames.
Accept |
| `web3_wallet` | query | array | No | Returns users with the specified web3 wallet addre |
| `role` | query | array | No | Returns users with the specified roles. Accepts up |
| `query` | query | string | No | Returns users that match the given query.
For poss |
| `email_address_query` | query | string | No | Returns users with emails that match the given que |
| `phone_number_query` | query | string | No | Returns users with phone numbers that match the gi |
| `username_query` | query | string | No | Returns users with usernames that match the given  |
| `name_query` | query | string | No | Returns users with names that match the given quer |
| `last_active_at_before` | query | integer | No | Returns users whose last session activity was befo |
| `last_active_at_after` | query | integer | No | Returns users whose last session activity was afte |
| `created_at_before` | query | integer | No | Returns users who have been created before the giv |
| `created_at_after` | query | integer | No | Returns users who have been created after the give |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/memberships"
```

---

## PATCH /organizations/{organization_id}/memberships/{user_id}

**Update an organization membership**

Updates the properties of an existing organization membership

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The ID of the organization the membership belongs  |
| `user_id` | path | string | Yes | The ID of the user that this membership belongs to |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/memberships/{user_id}"
```

---

## DELETE /organizations/{organization_id}/memberships/{user_id}

**Remove a member from an organization**

Removes the given membership from the organization

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The ID of the organization the membership belongs  |
| `user_id` | path | string | Yes | The ID of the user that this membership belongs to |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/memberships/{user_id}"
```

---

## PATCH /organizations/{organization_id}/memberships/{user_id}/metadata

**Merge and update organization membership metadata**

Update an organization membership's metadata attributes by merging existing values with the provided parameters.
Metadata values will be updated via a deep merge. Deep means that any nested JSON objects will be merged as well.
You can remove metadata keys at any level by setting their value to `null`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The ID of the organization the membership belongs  |
| `user_id` | path | string | Yes | The ID of the user that this membership belongs to |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/memberships/{user_id}/metadata"
```

---

## GET /organization_memberships

**Get a list of all organization memberships within an instance.**

Retrieves all organization user memberships for the given instance.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `order_by` | query | string | No | Sorts organizations memberships by phone_number, e |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organization_memberships"
```

---
