---
created: 2026-01-09
tags: [type/api-reference, api/submission]
api_name: Netlify's API documentation
category: submission
endpoint_count: 4
---

# Netlify's API documentation - Submission

[[README|Back to Overview]]

---

## GET /sites/{site_id}/submissions

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | path | string | Yes |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/submissions"
```

---

## GET /forms/{form_id}/submissions

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `form_id` | path | string | Yes |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/forms/{form_id}/submissions"
```

---

## GET /submissions/{submission_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `query` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/submissions/{submission_id}"
```

---

## DELETE /submissions/{submission_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/submissions/{submission_id}"
```

---
