---
created: 2026-01-09
tags: [type/api-reference, api/agentrunnersession]
api_name: Netlify's API documentation
category: agentRunnerSession
endpoint_count: 5
---

# Netlify's API documentation - Agentrunnersession

[[README|Back to Overview]]

---

## GET /agent_runners/{agent_runner_id}/sessions

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `state` | query | string | No |  |
| `from` | query | integer | No |  |
| `to` | query | integer | No |  |
| `order_by` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/agent_runners/{agent_runner_id}/sessions"
```

---

## POST /agent_runners/{agent_runner_id}/sessions

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `prompt` | query | string | No |  |
| `agent` | query | string | No |  |
| `model` | query | string | No |  |
| `file_keys` | query | array | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/agent_runners/{agent_runner_id}/sessions"
```

---

## GET /agent_runners/{agent_runner_id}/sessions/{agent_runner_session_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/agent_runners/{agent_runner_id}/sessions/{agent_runner_session_id}"
```

---

## PATCH /agent_runners/{agent_runner_id}/sessions/{agent_runner_session_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `is_published` | query | boolean | No |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/agent_runners/{agent_runner_id}/sessions/{agent_runner_session_id}"
```

---

## DELETE /agent_runners/{agent_runner_id}/sessions/{agent_runner_session_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/agent_runners/{agent_runner_id}/sessions/{agent_runner_session_id}"
```

---
