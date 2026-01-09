---
created: 2026-01-09
tags: [type/api-reference, api/users]
api_name: Asana
category: Users
endpoint_count: 8
---

# Asana - Users

[[README|Back to Overview]]

---

## GET /users

**Get multiple users**

<b>Required scope: </b><code>users:read</code>

Returns the user records for all users in all workspaces and organizations accessible to the authenticated user. Accepts an optional workspace ID parameter.
Results are sorted by user ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/users"
```

---

## GET /users/{user_gid}

**Get a user**

<b>Required scope: </b><code>users:read</code>

Returns the full user record for the single user with the provided ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/users/{user_gid}"
```

---

## PUT /users/{user_gid}

**Update a user**

A specific, existing user can be updated by making a PUT request on the
URL for that user. Only the fields provided in the `data` block will be
updated; any unspecified fields will remain unchanged.

Returns the complete updated user record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/users/{user_gid}"
```

---

## GET /users/{user_gid}/favorites

**Get a user's favorites**

<b>Required scope: </b><code>users:read</code>

Returns all of a user's favorites within a specified workspace and of a given type. The results are ordered exactly as they appear in the user's Asana sidebar in the web application. Note that this endpoint currently only returns favorites for the current user (i.e., the user associated with the authentication token).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/users/{user_gid}/favorites"
```

---

## GET /teams/{team_gid}/users

**Get users in a team**

<b>Required scope: </b><code>users:read</code>

Returns the compact records for all users that are members of the team.
Results are sorted alphabetically and limited to 2000. For more results use the `/users` endpoint.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/teams/{team_gid}/users"
```

---

## GET /workspaces/{workspace_gid}/users

**Get users in a workspace or organization**

<b>Required scope: </b><code>users:read</code>

Returns the compact records for all users in the specified workspace or organization.
Results are sorted alphabetically and limited to 2000. For more results use the `/users` endpoint.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}/users"
```

---

## GET /workspaces/{workspace_gid}/users/{user_gid}

**Get a user in a workspace or organization**

<b>Required scope: </b><code>users:read</code>

Returns the full user record for the single user with the provided ID in the specified workspace or organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}/users/{user_gid}"
```

---

## PUT /workspaces/{workspace_gid}/users/{user_gid}

**Update a user in a workspace or organization**

An existing user can be updated by making a PUT request on the URL for that user in the specified workspace or organization. Only the fields provided in the `data` block will be updated; any unspecified fields will remain unchanged.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}/users/{user_gid}"
```

---
