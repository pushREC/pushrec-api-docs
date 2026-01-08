---
created: 2026-01-08
tags: [type/api-reference, api/projects]
api_name: OpenAI API
category: Projects
endpoint_count: 19
---

# OpenAI API - Projects

[[README|Back to Overview]]

---

## GET /organization/projects

**List projects**

Returns a list of projects.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |
| `include_archived` | query | boolean | No | If `true` returns all projects including those tha |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects"
```

---

## POST /organization/projects

**Create project**

Create a new project in the organization. Projects can be created and archived, but cannot be deleted.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects"
```

---

## GET /organization/projects/{project_id}

**Retrieve project**

Retrieves a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}"
```

---

## POST /organization/projects/{project_id}

**Modify project**

Modifies a project in the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}"
```

---

## GET /organization/projects/{project_id}/api_keys

**List project API keys**

Returns a list of API keys in the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/api_keys"
```

---

## GET /organization/projects/{project_id}/api_keys/{key_id}

**Retrieve project API key**

Retrieves an API key in the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |
| `key_id` | path | string | Yes | The ID of the API key. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/api_keys/{key_id}"
```

---

## DELETE /organization/projects/{project_id}/api_keys/{key_id}

**Delete project API key**

Deletes an API key from the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |
| `key_id` | path | string | Yes | The ID of the API key. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/api_keys/{key_id}"
```

---

## POST /organization/projects/{project_id}/archive

**Archive project**

Archives a project in the organization. Archived projects cannot be used or updated.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/archive"
```

---

## GET /organization/projects/{project_id}/rate_limits

**List project rate limits**

Returns the rate limits per model for a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |
| `limit` | query | integer | No | A limit on the number of objects to be returned. T |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |
| `before` | query | string | No | A cursor for use in pagination. `before` is an obj |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/rate_limits"
```

---

## POST /organization/projects/{project_id}/rate_limits/{rate_limit_id}

**Modify project rate limit**

Updates a project rate limit.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |
| `rate_limit_id` | path | string | Yes | The ID of the rate limit. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/rate_limits/{rate_limit_id}"
```

---

## GET /organization/projects/{project_id}/service_accounts

**List project service accounts**

Returns a list of service accounts in the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/service_accounts"
```

---

## POST /organization/projects/{project_id}/service_accounts

**Create project service account**

Creates a new service account in the project. This also returns an unredacted API key for the service account.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/service_accounts"
```

---

## GET /organization/projects/{project_id}/service_accounts/{service_account_id}

**Retrieve project service account**

Retrieves a service account in the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |
| `service_account_id` | path | string | Yes | The ID of the service account. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/service_accounts/{service_account_id}"
```

---

## DELETE /organization/projects/{project_id}/service_accounts/{service_account_id}

**Delete project service account**

Deletes a service account from the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |
| `service_account_id` | path | string | Yes | The ID of the service account. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/service_accounts/{service_account_id}"
```

---

## GET /organization/projects/{project_id}/users

**List project users**

Returns a list of users in the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/users"
```

---

## POST /organization/projects/{project_id}/users

**Create project user**

Adds a user to the project. Users must already be members of the organization to be added to a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/users"
```

---

## GET /organization/projects/{project_id}/users/{user_id}

**Retrieve project user**

Retrieves a user in the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |
| `user_id` | path | string | Yes | The ID of the user. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/users/{user_id}"
```

---

## POST /organization/projects/{project_id}/users/{user_id}

**Modify project user**

Modifies a user's role in the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |
| `user_id` | path | string | Yes | The ID of the user. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/users/{user_id}"
```

---

## DELETE /organization/projects/{project_id}/users/{user_id}

**Delete project user**

Deletes a user from the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | The ID of the project. |
| `user_id` | path | string | Yes | The ID of the user. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/projects/{project_id}/users/{user_id}"
```

---
