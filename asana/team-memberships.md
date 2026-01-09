---
created: 2026-01-09
tags: [type/api-reference, api/team-memberships]
api_name: Asana
category: Team memberships
endpoint_count: 4
---

# Asana - Team Memberships

[[README|Back to Overview]]

---

## GET /team_memberships/{team_membership_gid}

**Get a team membership**

<b>Required scope: </b><code>team_memberships:read</code>

<table>
  <tr>
    <th>Field</th>
    <th>Required Scope</th>
  </tr>
  <tr>
    <td><code>team</code></td>
    <td><code>teams:read</code></td>
  </tr>
</table>

Returns the complete team membership record for a single team membership.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/team_memberships/{team_membership_gid}"
```

---

## GET /team_memberships

**Get team memberships**

<b>Required scope: </b><code>team_memberships:read</code>

Returns compact team membership records.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `team` | query | string | No | Globally unique identifier for the team. |
| `user` | query | string | No | A string identifying a user. This can either be th |
| `workspace` | query | string | No | Globally unique identifier for the workspace. This |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/team_memberships"
```

---

## GET /teams/{team_gid}/team_memberships

**Get memberships from a team**

<b>Required scope: </b><code>team_memberships:read</code>

Returns the compact team memberships for the team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/teams/{team_gid}/team_memberships"
```

---

## GET /users/{user_gid}/team_memberships

**Get memberships from a user**

<b>Required scope: </b><code>team_memberships:read</code>

Returns the compact team membership records for the user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | query | string | Yes | Globally unique identifier for the workspace. |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/users/{user_gid}/team_memberships"
```

---
