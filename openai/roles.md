---
created: 2026-01-08
tags: [type/api-reference, api/roles]
api_name: OpenAI API
category: Roles
endpoint_count: 8
---

# OpenAI API - Roles

[[README|Back to Overview]]

---

## GET /organization/roles

**List organization roles**

Lists the roles configured for the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No | A limit on the number of roles to return. Defaults |
| `after` | query | string | No | Cursor for pagination. Provide the value from the  |
| `order` | query | string | No | Sort order for the returned roles. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/roles"
```

---

## POST /organization/roles

**Create organization role**

Creates a custom role for the organization.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/roles"
```

---

## POST /organization/roles/{role_id}

**Update organization role**

Updates an existing organization role.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `role_id` | path | string | Yes | The ID of the role to update. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/roles/{role_id}"
```

---

## DELETE /organization/roles/{role_id}

**Delete organization role**

Deletes a custom role from the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `role_id` | path | string | Yes | The ID of the role to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/roles/{role_id}"
```

---

## GET /projects/{project_id}/roles

**List project roles**

Lists the roles configured for a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project to inspect. |
| `limit` | query | integer | No | A limit on the number of roles to return. Defaults |
| `after` | query | string | No | Cursor for pagination. Provide the value from the  |
| `order` | query | string | No | Sort order for the returned roles. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/projects/{project_id}/roles"
```

---

## POST /projects/{project_id}/roles

**Create project role**

Creates a custom role for a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project to update. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/projects/{project_id}/roles"
```

---

## POST /projects/{project_id}/roles/{role_id}

**Update project role**

Updates an existing project role.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project to update. |
| `role_id` | path | string | Yes | The ID of the role to update. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/projects/{project_id}/roles/{role_id}"
```

---

## DELETE /projects/{project_id}/roles/{role_id}

**Delete project role**

Deletes a custom role from a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project to update. |
| `role_id` | path | string | Yes | The ID of the role to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/projects/{project_id}/roles/{role_id}"
```

---
