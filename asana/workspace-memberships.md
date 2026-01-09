---
created: 2026-01-09
tags: [type/api-reference, api/workspace-memberships]
api_name: Asana
category: Workspace memberships
endpoint_count: 3
---

# Asana - Workspace Memberships

[[README|Back to Overview]]

---

## GET /workspace_memberships/{workspace_membership_gid}

**Get a workspace membership**

Returns the complete workspace record for a single workspace membership.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspace_memberships/{workspace_membership_gid}"
```

---

## GET /users/{user_gid}/workspace_memberships

**Get workspace memberships for a user**

Returns the compact workspace membership records for the user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/users/{user_gid}/workspace_memberships"
```

---

## GET /workspaces/{workspace_gid}/workspace_memberships

**Get the workspace memberships for a workspace**

Returns the compact workspace membership records for the workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}/workspace_memberships"
```

---
