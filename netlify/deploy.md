---
created: 2026-01-09
tags: [type/api-reference, api/deploy]
api_name: Netlify's API documentation
category: deploy
endpoint_count: 12
---

# Netlify's API documentation - Deploy

[[README|Back to Overview]]

---

## GET /sites/{site_id}/deploys

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/deploys"
```

---

## POST /sites/{site_id}/deploys

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `title` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/deploys"
```

---

## GET /sites/{site_id}/deploys/{deploy_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | path | string | Yes |  |
| `deploy_id` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/deploys/{deploy_id}"
```

---

## PUT /sites/{site_id}/deploys/{deploy_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | path | string | Yes |  |
| `deploy_id` | path | string | Yes |  |
| `commit_ref` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/deploys/{deploy_id}"
```

---

## DELETE /sites/{site_id}/deploys/{deploy_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deploy_id` | path | string | Yes |  |
| `site_id` | path | string | Yes |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/deploys/{deploy_id}"
```

---

## POST /deploys/{deploy_id}/cancel

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deploy_id` | path | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/deploys/{deploy_id}/cancel"
```

---

## POST /sites/{site_id}/deploys/{deploy_id}/restore

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | path | string | Yes |  |
| `deploy_id` | path | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/deploys/{deploy_id}/restore"
```

---

## PUT /sites/{site_id}/rollback

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/rollback"
```

---

## GET /deploys/{deploy_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deploy_id` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/deploys/{deploy_id}"
```

---

## DELETE /deploys/{deploy_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deploy_id` | path | string | Yes |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/deploys/{deploy_id}"
```

---

## POST /deploys/{deploy_id}/lock

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deploy_id` | path | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/deploys/{deploy_id}/lock"
```

---

## POST /deploys/{deploy_id}/unlock

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deploy_id` | path | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/deploys/{deploy_id}/unlock"
```

---
