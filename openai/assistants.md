---
created: 2026-01-08
tags: [type/api-reference, api/assistants]
api_name: OpenAI API
category: Assistants
endpoint_count: 23
---

# OpenAI API - Assistants

[[README|Back to Overview]]

---

## GET /assistants

**List assistants**

Returns a list of assistants.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `order` | query | string | No | Sort order by the `created_at` timestamp of the ob |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |
| `before` | query | string | No | A cursor for use in pagination. `before` is an obj |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/assistants"
```

---

## POST /assistants

**Create assistant**

Create an assistant with a model and instructions.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/assistants"
```

---

## GET /assistants/{assistant_id}

**Retrieve assistant**

Retrieves an assistant.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `assistant_id` | path | string | Yes | The ID of the assistant to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/assistants/{assistant_id}"
```

---

## POST /assistants/{assistant_id}

**Modify assistant**

Modifies an assistant.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `assistant_id` | path | string | Yes | The ID of the assistant to modify. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/assistants/{assistant_id}"
```

---

## DELETE /assistants/{assistant_id}

**Delete assistant**

Delete an assistant.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `assistant_id` | path | string | Yes | The ID of the assistant to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/assistants/{assistant_id}"
```

---

## POST /threads

**Create thread**

Create a thread.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads"
```

---

## POST /threads/runs

**Create thread and run**

Create a thread and run it in one request.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/runs"
```

---

## GET /threads/{thread_id}

**Retrieve thread**

Retrieves a thread.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the thread to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}"
```

---

## POST /threads/{thread_id}

**Modify thread**

Modifies a thread.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the thread to modify. Only the `metadata |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}"
```

---

## DELETE /threads/{thread_id}

**Delete thread**

Delete a thread.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the thread to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}"
```

---

## GET /threads/{thread_id}/messages

**List messages**

Returns a list of messages for a given thread.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the [thread](https://platform.openai.com |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `order` | query | string | No | Sort order by the `created_at` timestamp of the ob |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |
| `before` | query | string | No | A cursor for use in pagination. `before` is an obj |
| `run_id` | query | string | No | Filter messages by the run ID that generated them. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}/messages"
```

---

## POST /threads/{thread_id}/messages

**Create message**

Create a message.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the [thread](https://platform.openai.com |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}/messages"
```

---

## GET /threads/{thread_id}/messages/{message_id}

**Retrieve message**

Retrieve a message.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the [thread](https://platform.openai.com |
| `message_id` | path | string | Yes | The ID of the message to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}/messages/{message_id}"
```

---

## POST /threads/{thread_id}/messages/{message_id}

**Modify message**

Modifies a message.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the thread to which this message belongs |
| `message_id` | path | string | Yes | The ID of the message to modify. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}/messages/{message_id}"
```

---

## DELETE /threads/{thread_id}/messages/{message_id}

**Delete message**

Deletes a message.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the thread to which this message belongs |
| `message_id` | path | string | Yes | The ID of the message to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}/messages/{message_id}"
```

---

## GET /threads/{thread_id}/runs

**List runs**

Returns a list of runs belonging to a thread.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the thread the run belongs to. |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `order` | query | string | No | Sort order by the `created_at` timestamp of the ob |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |
| `before` | query | string | No | A cursor for use in pagination. `before` is an obj |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}/runs"
```

---

## POST /threads/{thread_id}/runs

**Create run**

Create a run.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the thread to run. |
| `include[]` | query | array | No | A list of additional fields to include in the resp |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}/runs"
```

---

## GET /threads/{thread_id}/runs/{run_id}

**Retrieve run**

Retrieves a run.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the [thread](https://platform.openai.com |
| `run_id` | path | string | Yes | The ID of the run to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}/runs/{run_id}"
```

---

## POST /threads/{thread_id}/runs/{run_id}

**Modify run**

Modifies a run.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the [thread](https://platform.openai.com |
| `run_id` | path | string | Yes | The ID of the run to modify. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}/runs/{run_id}"
```

---

## POST /threads/{thread_id}/runs/{run_id}/cancel

**Cancel a run**

Cancels a run that is `in_progress`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the thread to which this run belongs. |
| `run_id` | path | string | Yes | The ID of the run to cancel. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}/runs/{run_id}/cancel"
```

---

## GET /threads/{thread_id}/runs/{run_id}/steps

**List run steps**

Returns a list of run steps belonging to a run.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the thread the run and run steps belong  |
| `run_id` | path | string | Yes | The ID of the run the run steps belong to. |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `order` | query | string | No | Sort order by the `created_at` timestamp of the ob |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |
| `before` | query | string | No | A cursor for use in pagination. `before` is an obj |
| `include[]` | query | array | No | A list of additional fields to include in the resp |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}/runs/{run_id}/steps"
```

---

## GET /threads/{thread_id}/runs/{run_id}/steps/{step_id}

**Retrieve run step**

Retrieves a run step.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the thread to which the run and run step |
| `run_id` | path | string | Yes | The ID of the run to which the run step belongs. |
| `step_id` | path | string | Yes | The ID of the run step to retrieve. |
| `include[]` | query | array | No | A list of additional fields to include in the resp |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}/runs/{run_id}/steps/{step_id}"
```

---

## POST /threads/{thread_id}/runs/{run_id}/submit_tool_outputs

**Submit tool outputs to run**

When a run has the `status: "requires_action"` and `required_action.type` is `submit_tool_outputs`, this endpoint can be used to submit the outputs from the tool calls once they're all completed. All outputs must be submitted in a single request.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `thread_id` | path | string | Yes | The ID of the [thread](https://platform.openai.com |
| `run_id` | path | string | Yes | The ID of the run that requires the tool output su |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/threads/{thread_id}/runs/{run_id}/submit_tool_outputs"
```

---
