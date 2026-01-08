---
created: 2026-01-08
tags: [type/api-reference, api/responses]
api_name: OpenAI API
category: Responses
endpoint_count: 5
---

# OpenAI API - Responses

[[README|Back to Overview]]

---

## POST /responses

**Create a model response**

Creates a model response. Provide [text](https://platform.openai.com/docs/guides/text) or
[image](https://platform.openai.com/docs/guides/images) inputs to generate [text](https://platform.openai.com/docs/guides/text)
or [JSON](https://platform.openai.com/docs/guides/structured-outputs) outputs. Have the model call
your own [custom code](https://platform.openai.com/docs/guides/function-calling) or use built-in
[tools](https://platform.openai.com/docs/guides/tools) like [web search](https://platform.openai.com/docs/guides/tools-web-search)
or [file search](https://platform.openai.com/docs/guides/tools-file-search) to use your own data
as input for the model's response.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/responses"
```

---

## GET /responses/{response_id}

**Get a model response**

Retrieves a model response with the given ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `response_id` | path | string | Yes | The ID of the response to retrieve. |
| `include` | query | array | No | Additional fields to include in the response. See  |
| `stream` | query | boolean | No | If set to true, the model response data will be st |
| `starting_after` | query | integer | No | The sequence number of the event after which to st |
| `include_obfuscation` | query | boolean | No | When true, stream obfuscation will be enabled. Str |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/responses/{response_id}"
```

---

## DELETE /responses/{response_id}

**Delete a model response**

Deletes a model response with the given ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `response_id` | path | string | Yes | The ID of the response to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/responses/{response_id}"
```

---

## POST /responses/{response_id}/cancel

**Cancel a response**

Cancels a model response with the given ID. Only responses created with
the `background` parameter set to `true` can be cancelled. 
[Learn more](https://platform.openai.com/docs/guides/background).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `response_id` | path | string | Yes | The ID of the response to cancel. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/responses/{response_id}/cancel"
```

---

## GET /responses/{response_id}/input_items

**List input items**

Returns a list of input items for a given response.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `response_id` | path | string | Yes | The ID of the response to retrieve input items for |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `order` | query | string | No | The order to return the input items in. Default is |
| `after` | query | string | No | An item ID to list items after, used in pagination |
| `include` | query | array | No | Additional fields to include in the response. See  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/responses/{response_id}/input_items"
```

---
