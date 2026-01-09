---
created: 2026-01-09
tags: [type/api-reference, api/agentrunner]
api_name: Netlify's API documentation
category: agentRunner
endpoint_count: 6
---

# Netlify's API documentation - Agentrunner

[[README|Back to Overview]]

---

## GET /agent_runners

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `account_id` | query | string | Yes |  |
| `site_id` | query | string | Yes |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `state` | query | string | No |  |
| `title` | query | string | No |  |
| `branch` | query | string | No |  |
| `result_branch` | query | string | No |  |
| `from` | query | integer | No |  |
| `to` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/agent_runners"
```

---

## POST /agent_runners

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | query | string | Yes |  |
| `deploy_id` | query | string | No |  |
| `branch` | query | string | No |  |
| `prompt` | query | string | No |  |
| `agent` | query | string | No |  |
| `model` | query | string | No |  |
| `parent_agent_runner_id` | query | string | No |  |
| `dev_server_image` | query | string | No |  |
| `file_keys` | query | array | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/agent_runners"
```

---

## GET /agent_runners/{agent_runner_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/agent_runners/{agent_runner_id}"
```

---

## PATCH /agent_runners/{agent_runner_id}

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/agent_runners/{agent_runner_id}"
```

---

## DELETE /agent_runners/{agent_runner_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/agent_runners/{agent_runner_id}"
```

---

## POST /agent_runners/{agent_runner_id}/archive

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/agent_runners/{agent_runner_id}/archive"
```

---
