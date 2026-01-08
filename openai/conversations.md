---
created: 2026-01-08
tags: [type/api-reference, api/conversations]
api_name: OpenAI API
category: Conversations
endpoint_count: 8
---

# OpenAI API - Conversations

[[README|Back to Overview]]

---

## POST /conversations/{conversation_id}/items

**Create items**

Create items in a conversation with the given ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `conversation_id` | path | string | Yes | The ID of the conversation to add the item to. |
| `include` | query | array | No | Additional fields to include in the response. See  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/conversations/{conversation_id}/items"
```

---

## GET /conversations/{conversation_id}/items

**List items**

List all items for a conversation with the given ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `conversation_id` | path | string | Yes | The ID of the conversation to list items for. |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `order` | query | string | No | The order to return the input items in. Default is |
| `after` | query | string | No | An item ID to list items after, used in pagination |
| `include` | query | array | No | Specify additional output data to include in the m |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/conversations/{conversation_id}/items"
```

---

## GET /conversations/{conversation_id}/items/{item_id}

**Retrieve an item**

Get a single item from a conversation with the given IDs.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `conversation_id` | path | string | Yes | The ID of the conversation that contains the item. |
| `item_id` | path | string | Yes | The ID of the item to retrieve. |
| `include` | query | array | No | Additional fields to include in the response. See  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/conversations/{conversation_id}/items/{item_id}"
```

---

## DELETE /conversations/{conversation_id}/items/{item_id}

**Delete an item**

Delete an item from a conversation with the given IDs.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `conversation_id` | path | string | Yes | The ID of the conversation that contains the item. |
| `item_id` | path | string | Yes | The ID of the item to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/conversations/{conversation_id}/items/{item_id}"
```

---

## POST /conversations

**Create a conversation**

Create a conversation.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/conversations"
```

---

## GET /conversations/{conversation_id}

**Retrieve a conversation**

Get a conversation

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `conversation_id` | path | string | Yes | The ID of the conversation to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/conversations/{conversation_id}"
```

---

## DELETE /conversations/{conversation_id}

**Delete a conversation**

Delete a conversation. Items in the conversation will not be deleted.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `conversation_id` | path | string | Yes | The ID of the conversation to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/conversations/{conversation_id}"
```

---

## POST /conversations/{conversation_id}

**Update a conversation**

Update a conversation

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `conversation_id` | path | string | Yes | The ID of the conversation to update. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/conversations/{conversation_id}"
```

---
