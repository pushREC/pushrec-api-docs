---
created: 2026-01-09
tags: [type/api-reference, api/site]
api_name: Netlify's API documentation
category: site
endpoint_count: 10
---

# Netlify's API documentation - Site

[[README|Back to Overview]]

---

## GET /sites

**Note:** Environment variable keys and values have moved from `build_settings.env` and `repo.env` to a new endpoint. Please use [getEnvVars](#tag/environmentVariables/operation/getEnvVars) to retrieve site environment variables.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `name` | query | string | No |  |
| `filter` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites"
```

---

## POST /sites

**Note:** Environment variable keys and values have moved from `build_settings.env` and `repo.env` to a new endpoint. Please use [createEnvVars](#tag/environmentVariables/operation/createEnvVars) to create environment variables for a site.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `configure_dns` | query | boolean | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites"
```

---

## GET /sites/{site_id}

**Note:** Environment variable keys and values have moved from `build_settings.env` and `repo.env` to a new endpoint. Please use [getEnvVars](#tag/environmentVariables/operation/getEnvVars) to retrieve site environment variables.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}"
```

---

## PATCH /sites/{site_id}

**Note:** Environment variable keys and values have moved from `build_settings.env` and `repo.env` to a new endpoint. Please use [updateEnvVar](#tag/environmentVariables/operation/updateEnvVar) to update a site's environment variables.

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}"
```

---

## DELETE /sites/{site_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}"
```

---

## PUT /sites/{site_id}/unlink_repo

[Beta] Unlinks the repo from the site.

This action will also:
- Delete associated deploy keys
- Delete outgoing webhooks for the repo
- Delete the site's build hooks

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/unlink_repo"
```

---

## PUT /sites/{site_id}/enable

Re-enables a site that was previously disabled by the user. Sites that were disabled for usage exceeded or marked as spam cannot be re-enabled via this endpoint.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/enable"
```

---

## PUT /sites/{site_id}/disable

Disables a site, preventing it from serving content. The site can be re-enabled later using the enable endpoint.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `reason` | query | string | Yes | Reason for disabling the site |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/disable"
```

---

## POST /{account_slug}/sites

**Note:** Environment variable keys and values have moved from `build_settings.env` and `repo.env` to a new endpoint. Please use [createEnvVars](#tag/environmentVariables/operation/createEnvVars) to create environment variables for a site.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `configure_dns` | query | boolean | No |  |
| `account_slug` | path | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/{account_slug}/sites"
```

---

## GET /{account_slug}/sites

**Note:** Environment variable keys and values have moved from `build_settings.env` and `repo.env` to a new endpoint. Please use [getEnvVars](#tag/environmentVariables/operation/getEnvVars) to retrieve site environment variables.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `name` | query | string | No |  |
| `account_slug` | path | string | Yes |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/{account_slug}/sites"
```

---
