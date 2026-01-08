---
created: 2026-01-08
tags: [type/api-reference, api/chat]
api_name: OpenAI API
category: Chat
endpoint_count: 6
---

# OpenAI API - Chat

[[README|Back to Overview]]

---

## GET /chat/completions

**List Chat Completions**

List stored Chat Completions. Only Chat Completions that have been stored
with the `store` parameter set to `true` will be returned.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `model` | query | string | No | The model used to generate the Chat Completions. |
| `metadata` | query | string | No | A list of metadata keys to filter the Chat Complet |
| `after` | query | string | No | Identifier for the last chat completion from the p |
| `limit` | query | integer | No | Number of Chat Completions to retrieve. |
| `order` | query | string | No | Sort order for Chat Completions by timestamp. Use  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/chat/completions"
```

---

## POST /chat/completions

**Create chat completion**

**Starting a new project?** We recommend trying [Responses](https://platform.openai.com/docs/api-reference/responses) 
to take advantage of the latest OpenAI platform features. Compare
[Chat Completions with Responses](https://platform.openai.com/docs/guides/responses-vs-chat-completions?api-mode=responses).

---

Creates a model response for the given chat conversation. Learn more in the
[text generation](https://platform.openai.com/docs/guides/text-generation), [vision](https://platform.openai.com/docs/guides/vision),
and [audio](https://platform.openai.com/docs/guides/audio) guides.

Parameter support can differ depending on the model used to generate the
response, particularly for newer reasoning models. Parameters that are only
supported for reasoning models are noted below. For the current state of 
unsupported parameters in reasoning models, 
[refer to the reasoning guide](https://platform.openai.com/docs/guides/reasoning).


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/chat/completions"
```

---

## GET /chat/completions/{completion_id}

**Get chat completion**

Get a stored chat completion. Only Chat Completions that have been created
with the `store` parameter set to `true` will be returned.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `completion_id` | path | string | Yes | The ID of the chat completion to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/chat/completions/{completion_id}"
```

---

## POST /chat/completions/{completion_id}

**Update chat completion**

Modify a stored chat completion. Only Chat Completions that have been
created with the `store` parameter set to `true` can be modified. Currently,
the only supported modification is to update the `metadata` field.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `completion_id` | path | string | Yes | The ID of the chat completion to update. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/chat/completions/{completion_id}"
```

---

## DELETE /chat/completions/{completion_id}

**Delete chat completion**

Delete a stored chat completion. Only Chat Completions that have been
created with the `store` parameter set to `true` can be deleted.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `completion_id` | path | string | Yes | The ID of the chat completion to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/chat/completions/{completion_id}"
```

---

## GET /chat/completions/{completion_id}/messages

**Get chat messages**

Get the messages in a stored chat completion. Only Chat Completions that
have been created with the `store` parameter set to `true` will be
returned.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `completion_id` | path | string | Yes | The ID of the chat completion to retrieve messages |
| `after` | query | string | No | Identifier for the last message from the previous  |
| `limit` | query | integer | No | Number of messages to retrieve. |
| `order` | query | string | No | Sort order for messages by timestamp. Use `asc` fo |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/chat/completions/{completion_id}/messages"
```

---
