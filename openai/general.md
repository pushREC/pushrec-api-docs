---
created: 2026-01-08
tags: [type/api-reference, api/general]
api_name: OpenAI API
category: general
endpoint_count: 21
---

# OpenAI API - General

[[README|Back to Overview]]

---

## GET /containers

**List containers**

List Containers

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `order` | query | string | No | Sort order by the `created_at` timestamp of the ob |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/containers"
```

---

## POST /containers

**Create container**

Create Container

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/containers"
```

---

## GET /containers/{container_id}

**Retrieve container**

Retrieve Container

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `container_id` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/containers/{container_id}"
```

---

## DELETE /containers/{container_id}

**Delete a container**

Delete Container

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `container_id` | path | string | Yes | The ID of the container to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/containers/{container_id}"
```

---

## POST /containers/{container_id}/files

**Create container file**

Create a Container File

You can send either a multipart/form-data request with the raw file content, or a JSON request with a file ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `container_id` | path | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/containers/{container_id}/files"
```

---

## GET /containers/{container_id}/files

**List container files**

List Container files

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `container_id` | path | string | Yes |  |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `order` | query | string | No | Sort order by the `created_at` timestamp of the ob |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/containers/{container_id}/files"
```

---

## GET /containers/{container_id}/files/{file_id}

**Retrieve container file**

Retrieve Container File

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `container_id` | path | string | Yes |  |
| `file_id` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/containers/{container_id}/files/{file_id}"
```

---

## DELETE /containers/{container_id}/files/{file_id}

**Delete a container file**

Delete Container File

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `container_id` | path | string | Yes |  |
| `file_id` | path | string | Yes |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/containers/{container_id}/files/{file_id}"
```

---

## GET /containers/{container_id}/files/{file_id}/content

**Retrieve container file content**

Retrieve Container File Content

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `container_id` | path | string | Yes |  |
| `file_id` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/containers/{container_id}/files/{file_id}/content"
```

---

## GET /organization/admin_api_keys

**List all organization and project API keys.**

List organization API keys

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `after` | query | string | No |  |
| `order` | query | string | No |  |
| `limit` | query | integer | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/admin_api_keys"
```

---

## POST /organization/admin_api_keys

**Create admin API key**

Create an organization admin API key

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/admin_api_keys"
```

---

## GET /organization/admin_api_keys/{key_id}

**Retrieve admin API key**

Retrieve a single organization API key

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `key_id` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/admin_api_keys/{key_id}"
```

---

## DELETE /organization/admin_api_keys/{key_id}

**Delete admin API key**

Delete an organization admin API key

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `key_id` | path | string | Yes |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/admin_api_keys/{key_id}"
```

---

## POST /responses/input_tokens

**Get input token counts**

Get input token counts

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/responses/input_tokens"
```

---

## POST /responses/compact

**Compact a response**

Compact conversation

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/responses/compact"
```

---

## POST /chatkit/sessions/{session_id}/cancel

**Cancel chat session**

Cancel a ChatKit session

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `session_id` | path | string | Yes | Unique identifier for the ChatKit session to cance |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/chatkit/sessions/{session_id}/cancel"
```

---

## POST /chatkit/sessions

**Create ChatKit session**

Create a ChatKit session

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/chatkit/sessions"
```

---

## GET /chatkit/threads/{thread_id}/items

**List ChatKit thread items**

List ChatKit thread items

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | Identifier of the ChatKit thread whose items are r |
| `limit` | query | integer | No | Maximum number of thread items to return. Defaults |
| `order` | query | string | No | Sort order for results by creation time. Defaults  |
| `after` | query | string | No | List items created after this thread item ID. Defa |
| `before` | query | string | No | List items created before this thread item ID. Def |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/chatkit/threads/{thread_id}/items"
```

---

## GET /chatkit/threads/{thread_id}

**Retrieve ChatKit thread**

Retrieve a ChatKit thread

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | Identifier of the ChatKit thread to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/chatkit/threads/{thread_id}"
```

---

## DELETE /chatkit/threads/{thread_id}

**Delete ChatKit thread**

Delete a ChatKit thread

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | Identifier of the ChatKit thread to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/chatkit/threads/{thread_id}"
```

---

## GET /chatkit/threads

**List ChatKit threads**

List ChatKit threads

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No | Maximum number of thread items to return. Defaults |
| `order` | query | string | No | Sort order for results by creation time. Defaults  |
| `after` | query | string | No | List items created after this thread item ID. Defa |
| `before` | query | string | No | List items created before this thread item ID. Def |
| `user` | query | string | No | Filter threads that belong to this user identifier |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/chatkit/threads"
```

---
