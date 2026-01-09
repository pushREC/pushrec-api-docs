---
created: 2026-01-09
tags: [type/api-reference, api/project-categories]
api_name: The Jira Cloud platform REST API
category: Project categories
endpoint_count: 5
---

# The Jira Cloud platform REST API - Project Categories

[[README|Back to Overview]]

---

## GET /rest/api/3/projectCategory

**Get all project categories**

Returns all project categories.

**[Permissions](#permissions) required:** Permission to access Jira.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/projectCategory"
```

---

## POST /rest/api/3/projectCategory

**Create project category**

Creates a project category.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/projectCategory"
```

---

## DELETE /rest/api/3/projectCategory/{id}

**Delete project category**

Deletes a project category.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | ID of the project category to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/projectCategory/{id}"
```

---

## GET /rest/api/3/projectCategory/{id}

**Get project category by ID**

Returns a project category.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the project category. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/projectCategory/{id}"
```

---

## PUT /rest/api/3/projectCategory/{id}

**Update project category**

Updates a project category.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/projectCategory/{id}"
```

---
