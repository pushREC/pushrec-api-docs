---
created: 2026-01-08
tags: [type/api-reference, api/fine-tuning]
api_name: OpenAI API
category: Fine-tuning
endpoint_count: 13
---

# OpenAI API - Fine-Tuning

[[README|Back to Overview]]

---

## POST /fine_tuning/alpha/graders/run

**Run grader**

Run a grader.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/fine_tuning/alpha/graders/run"
```

---

## POST /fine_tuning/alpha/graders/validate

**Validate grader**

Validate a grader.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/fine_tuning/alpha/graders/validate"
```

---

## GET /fine_tuning/checkpoints/{fine_tuned_model_checkpoint}/permissions

**List checkpoint permissions**

**NOTE:** This endpoint requires an [admin API key](../admin-api-keys).

Organization owners can use this endpoint to view all permissions for a fine-tuned model checkpoint.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fine_tuned_model_checkpoint` | path | string | Yes | The ID of the fine-tuned model checkpoint to get p |
| `project_id` | query | string | No | The ID of the project to get permissions for. |
| `after` | query | string | No | Identifier for the last permission ID from the pre |
| `limit` | query | integer | No | Number of permissions to retrieve. |
| `order` | query | string | No | The order in which to retrieve permissions. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/fine_tuning/checkpoints/{fine_tuned_model_checkpoint}/permissions"
```

---

## POST /fine_tuning/checkpoints/{fine_tuned_model_checkpoint}/permissions

**Create checkpoint permissions**

**NOTE:** Calling this endpoint requires an [admin API key](../admin-api-keys).

This enables organization owners to share fine-tuned models with other projects in their organization.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fine_tuned_model_checkpoint` | path | string | Yes | The ID of the fine-tuned model checkpoint to creat |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/fine_tuning/checkpoints/{fine_tuned_model_checkpoint}/permissions"
```

---

## DELETE /fine_tuning/checkpoints/{fine_tuned_model_checkpoint}/permissions/{permission_id}

**Delete checkpoint permission**

**NOTE:** This endpoint requires an [admin API key](../admin-api-keys).

Organization owners can use this endpoint to delete a permission for a fine-tuned model checkpoint.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fine_tuned_model_checkpoint` | path | string | Yes | The ID of the fine-tuned model checkpoint to delet |
| `permission_id` | path | string | Yes | The ID of the fine-tuned model checkpoint permissi |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/fine_tuning/checkpoints/{fine_tuned_model_checkpoint}/permissions/{permission_id}"
```

---

## POST /fine_tuning/jobs

**Create fine-tuning job**

Creates a fine-tuning job which begins the process of creating a new model from a given dataset.

Response includes details of the enqueued job including job status and the name of the fine-tuned models once complete.

[Learn more about fine-tuning](https://platform.openai.com/docs/guides/model-optimization)


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/fine_tuning/jobs"
```

---

## GET /fine_tuning/jobs

**List fine-tuning jobs**

List your organization's fine-tuning jobs


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `after` | query | string | No | Identifier for the last job from the previous pagi |
| `limit` | query | integer | No | Number of fine-tuning jobs to retrieve. |
| `metadata` | query | object | No | Optional metadata filter. To filter, use the synta |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/fine_tuning/jobs"
```

---

## GET /fine_tuning/jobs/{fine_tuning_job_id}

**Retrieve fine-tuning job**

Get info about a fine-tuning job.

[Learn more about fine-tuning](https://platform.openai.com/docs/guides/model-optimization)


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fine_tuning_job_id` | path | string | Yes | The ID of the fine-tuning job.
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/fine_tuning/jobs/{fine_tuning_job_id}"
```

---

## POST /fine_tuning/jobs/{fine_tuning_job_id}/cancel

**Cancel fine-tuning**

Immediately cancel a fine-tune job.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fine_tuning_job_id` | path | string | Yes | The ID of the fine-tuning job to cancel.
 |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/fine_tuning/jobs/{fine_tuning_job_id}/cancel"
```

---

## GET /fine_tuning/jobs/{fine_tuning_job_id}/checkpoints

**List fine-tuning checkpoints**

List checkpoints for a fine-tuning job.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fine_tuning_job_id` | path | string | Yes | The ID of the fine-tuning job to get checkpoints f |
| `after` | query | string | No | Identifier for the last checkpoint ID from the pre |
| `limit` | query | integer | No | Number of checkpoints to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/fine_tuning/jobs/{fine_tuning_job_id}/checkpoints"
```

---

## GET /fine_tuning/jobs/{fine_tuning_job_id}/events

**List fine-tuning events**

Get status updates for a fine-tuning job.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fine_tuning_job_id` | path | string | Yes | The ID of the fine-tuning job to get events for.
 |
| `after` | query | string | No | Identifier for the last event from the previous pa |
| `limit` | query | integer | No | Number of events to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/fine_tuning/jobs/{fine_tuning_job_id}/events"
```

---

## POST /fine_tuning/jobs/{fine_tuning_job_id}/pause

**Pause fine-tuning**

Pause a fine-tune job.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fine_tuning_job_id` | path | string | Yes | The ID of the fine-tuning job to pause.
 |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/fine_tuning/jobs/{fine_tuning_job_id}/pause"
```

---

## POST /fine_tuning/jobs/{fine_tuning_job_id}/resume

**Resume fine-tuning**

Resume a fine-tune job.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fine_tuning_job_id` | path | string | Yes | The ID of the fine-tuning job to resume.
 |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/fine_tuning/jobs/{fine_tuning_job_id}/resume"
```

---
