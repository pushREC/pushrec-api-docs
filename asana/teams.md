---
created: 2026-01-09
tags: [type/api-reference, api/teams]
api_name: Asana
category: Teams
endpoint_count: 7
---

# Asana - Teams

[[README|Back to Overview]]

---

## POST /teams

**Create a team**

Creates a team within the current workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/teams"
```

---

## GET /teams/{team_gid}

**Get a team**

<b>Required scope: </b><code>teams:read</code>

Returns the full record for a single team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/teams/{team_gid}"
```

---

## PUT /teams/{team_gid}

**Update a team**

Updates a team within the current workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/teams/{team_gid}"
```

---

## GET /workspaces/{workspace_gid}/teams

**Get teams in a workspace**

<b>Required scope: </b><code>teams:read</code>

Returns the compact records for all teams in the workspace visible to the authorized user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}/teams"
```

---

## GET /users/{user_gid}/teams

**Get teams for a user**

<b>Required scope: </b><code>teams:read</code>

Returns the compact records for all teams to which the given user is assigned.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/users/{user_gid}/teams"
```

---

## POST /teams/{team_gid}/addUser

**Add a user to a team**

The user making this call must be a member of the team in order to add others. The user being added must exist in the same organization as the team.

Returns the complete team membership record for the newly added user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/teams/{team_gid}/addUser"
```

---

## POST /teams/{team_gid}/removeUser

**Remove a user from a team**

The user making this call must be a member of the team in order to remove themselves or others.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/teams/{team_gid}/removeUser"
```

---
