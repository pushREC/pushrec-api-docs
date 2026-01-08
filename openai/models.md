---
created: 2026-01-08
tags: [type/api-reference, api/models]
api_name: OpenAI API
category: Models
endpoint_count: 3
---

# OpenAI API - Models

[[README|Back to Overview]]

---

## GET /models

**List models**

Lists the currently available models, and provides basic information about each one such as the owner and availability.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/models"
```

---

## GET /models/{model}

**Retrieve model**

Retrieves a model instance, providing basic information about the model such as the owner and permissioning.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `model` | path | string | Yes | The ID of the model to use for this request |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/models/{model}"
```

---

## DELETE /models/{model}

**Delete a fine-tuned model**

Delete a fine-tuned model. You must have the Owner role in your organization to delete a model.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `model` | path | string | Yes | The model to delete |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/models/{model}"
```

---
