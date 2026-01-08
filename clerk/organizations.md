---
created: 2026-01-08
tags: [type/api-reference, api/organizations]
api_name: Clerk Backend API
category: Organizations
endpoint_count: 8
---

# Clerk Backend API - Organizations

[[README|Back to Overview]]

---

## GET /organizations

**Get a list of organizations for an instance**

This request returns the list of organizations for an instance.
Results can be paginated using the optional `limit` and `offset` query parameters.
The organizations are ordered by descending creation date.
Most recent organizations will be returned first.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `include_members_count` | query | boolean | No | Flag to denote whether the member counts of each o |
| `include_missing_member_with_elevated_permissions` | query | boolean | No | Flag to denote whether or not to include a member  |
| `query` | query | string | No | Returns organizations with ID, name, or slug that  |
| `user_id` | query | array | No | Returns organizations with the user ids specified. |
| `organization_id` | query | array | No | Returns organizations with the organization ids sp |
| `order_by` | query | string | No | Allows to return organizations in a particular ord |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations"
```

---

## POST /organizations

**Create an organization**

Creates a new organization with the given name for an instance.
You can specify an optional slug for the new organization.
If provided, the organization slug can contain only lowercase alphanumeric characters (letters and digits) and the dash "-".
Organization slugs must be unique for the instance.
You can provide additional metadata for the organization and set any custom attribute you want.
Organizations support private and public metadata.
Private metadata can only be accessed from the Backend API.
Public metadata can be accessed from the Backend API, and are read-only from the Frontend API.
The `created_by` user will see this as their [active organization](https://clerk.com/docs/organizations/overview#active-organization)
the next time they create a session, presuming they don't explicitly set a different organization as active before then.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations"
```

---

## GET /organizations/{organization_id}

**Retrieve an organization by ID or slug**

Fetches the organization whose ID or slug matches the provided `id_or_slug` URL query parameter.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The ID or slug of the organization |
| `include_members_count` | query | boolean | No | Flag to denote whether or not the organization's m |
| `include_missing_member_with_elevated_permissions` | query | boolean | No | Flag to denote whether or not to include a member  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}"
```

---

## PATCH /organizations/{organization_id}

**Update an organization**

Updates an existing organization

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The ID of the organization to update |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}"
```

---

## DELETE /organizations/{organization_id}

**Delete an organization**

Deletes the given organization.
Please note that deleting an organization will also delete all memberships and invitations.
This is not reversible.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The ID of the organization to delete |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}"
```

---

## PATCH /organizations/{organization_id}/metadata

**Merge and update metadata for an organization**

Update organization metadata attributes by merging existing values with the provided parameters.
Metadata values will be updated via a deep merge.
Deep meaning that any nested JSON objects will be merged as well.
You can remove metadata keys at any level by setting their value to `null`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The ID of the organization for which metadata will |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/metadata"
```

---

## PUT /organizations/{organization_id}/logo

**Upload a logo for the organization**

Set or replace an organization's logo, by uploading an image file.
This endpoint uses the `multipart/form-data` request content type and accepts a file of image type.
The file size cannot exceed 10MB.
Only the following file content types are supported: `image/jpeg`, `image/png`, `image/gif`, `image/webp`, `image/x-icon`, `image/vnd.microsoft.icon`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The ID of the organization for which to upload a l |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/logo"
```

---

## DELETE /organizations/{organization_id}/logo

**Delete the organization's logo.**

Delete the organization's logo.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `organization_id` | path | string | Yes | The ID of the organization for which the logo will |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/organizations/{organization_id}/logo"
```

---
