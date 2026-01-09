---
created: 2026-01-09
tags: [type/api-reference, api/environmentvariables]
api_name: Netlify's API documentation
category: environmentVariables
endpoint_count: 8
---

# Netlify's API documentation - Environmentvariables

[[README|Back to Overview]]

---

## GET /accounts/{account_id}/env

Returns all environment variables for an account or site. An account corresponds to a team in the Netlify UI.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `account_id` | path | string | Yes | Scope response to account_id |
| `context_name` | query | string | No | Filter by deploy context |
| `scope` | query | string | No | Filter by scope |
| `site_id` | query | string | No | If specified, only return environment variables se |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/accounts/{account_id}/env"
```

---

## POST /accounts/{account_id}/env

Creates new environment variables. Granular scopes are available on Pro plans and above.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `account_id` | path | string | Yes | Scope response to account_id |
| `site_id` | query | string | No | If provided, create an environment variable on the |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/accounts/{account_id}/env"
```

---

## GET /api/v1/sites/{site_id}/env

Returns all environment variables for a site. This convenience method behaves the same as `getEnvVars` but doesn't require an `account_id` as input.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `context_name` | query | string | No | Filter by deploy context |
| `scope` | query | string | No | Filter by scope |
| `site_id` | path | string | Yes | Scope response to site_id |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/api/v1/sites/{site_id}/env"
```

---

## GET /accounts/{account_id}/env/{key}

Returns an individual environment variable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `account_id` | path | string | Yes | Scope response to account_id |
| `key` | path | string | Yes | The environment variable key (case-sensitive) |
| `site_id` | query | string | No | If provided, return the environment variable for a |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/accounts/{account_id}/env/{key}"
```

---

## PUT /accounts/{account_id}/env/{key}

Updates an existing environment variable and all of its values. Existing values will be replaced by values provided.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `account_id` | path | string | Yes | Scope response to account_id |
| `key` | path | string | Yes | The existing environment variable key name (case-s |
| `site_id` | query | string | No | If provided, update an environment variable set on |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/accounts/{account_id}/env/{key}"
```

---

## PATCH /accounts/{account_id}/env/{key}

Updates or creates a new value for an existing environment variable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `account_id` | path | string | Yes | Scope response to account_id |
| `key` | path | string | Yes | The existing environment variable key name (case-s |
| `site_id` | query | string | No | If provided, update an environment variable set on |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/accounts/{account_id}/env/{key}"
```

---

## DELETE /accounts/{account_id}/env/{key}

Deletes an environment variable

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `account_id` | path | string | Yes | Scope response to account_id |
| `key` | path | string | Yes | The environment variable key (case-sensitive) |
| `site_id` | query | string | No | If provided, delete the environment variable from  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/accounts/{account_id}/env/{key}"
```

---

## DELETE /accounts/{account_id}/env/{key}/value/{id}

Deletes a specific environment variable value.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `account_id` | path | string | Yes | Scope response to account_id |
| `id` | path | string | Yes | The environment variable value's ID |
| `key` | path | string | Yes | The environment variable key name (case-sensitive) |
| `site_id` | query | string | No | If provided, delete the value from an environment  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/accounts/{account_id}/env/{key}/value/{id}"
```

---
