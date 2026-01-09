---
created: 2026-01-09
tags: [type/api-reference, api/agentingresses]
api_name: ngrok OpenAPI
category: AgentIngresses
endpoint_count: 5
---

# ngrok OpenAPI - Agentingresses

[[README|Back to Overview]]

---

## POST /agent_ingresses

**Create**

Create a new Agent Ingress. The ngrok agent can be configured to connect to ngrok via the new set of addresses on the returned Agent Ingress.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/agent_ingresses"
```

---

## GET /agent_ingresses

**List**

List all Agent Ingresses owned by this account


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `before_id` | query | string | No |  |
| `limit` | query | string | No |  |
| `filter` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/agent_ingresses"
```

---

## DELETE /agent_ingresses/{id}

**Delete**

Delete an Agent Ingress by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | a resource identifier
 |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/agent_ingresses/{id}"
```

---

## GET /agent_ingresses/{id}

**Get**

Get the details of an Agent Ingress by ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | a resource identifier
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/agent_ingresses/{id}"
```

---

## PATCH /agent_ingresses/{id}

**Update**

Update attributes of an Agent Ingress by ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/agent_ingresses/{id}"
```

---
