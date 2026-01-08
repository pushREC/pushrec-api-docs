---
created: 2026-01-08
tags: [type/api-reference, api/evals]
api_name: OpenAI API
category: Evals
endpoint_count: 12
---

# OpenAI API - Evals

[[README|Back to Overview]]

---

## GET /evals

**List evals**

List evaluations for a project.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `after` | query | string | No | Identifier for the last eval from the previous pag |
| `limit` | query | integer | No | Number of evals to retrieve. |
| `order` | query | string | No | Sort order for evals by timestamp. Use `asc` for a |
| `order_by` | query | string | No | Evals can be ordered by creation time or last upda |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/evals"
```

---

## POST /evals

**Create eval**

Create the structure of an evaluation that can be used to test a model's performance.
An evaluation is a set of testing criteria and the config for a data source, which dictates the schema of the data used in the evaluation. After creating an evaluation, you can run it on different models and model parameters. We support several types of graders and datasources.
For more information, see the [Evals guide](https://platform.openai.com/docs/guides/evals).


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/evals"
```

---

## GET /evals/{eval_id}

**Get an eval**

Get an evaluation by ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `eval_id` | path | string | Yes | The ID of the evaluation to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/evals/{eval_id}"
```

---

## POST /evals/{eval_id}

**Update an eval**

Update certain properties of an evaluation.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `eval_id` | path | string | Yes | The ID of the evaluation to update. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/evals/{eval_id}"
```

---

## DELETE /evals/{eval_id}

**Delete an eval**

Delete an evaluation.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `eval_id` | path | string | Yes | The ID of the evaluation to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/evals/{eval_id}"
```

---

## GET /evals/{eval_id}/runs

**Get eval runs**

Get a list of runs for an evaluation.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `eval_id` | path | string | Yes | The ID of the evaluation to retrieve runs for. |
| `after` | query | string | No | Identifier for the last run from the previous pagi |
| `limit` | query | integer | No | Number of runs to retrieve. |
| `order` | query | string | No | Sort order for runs by timestamp. Use `asc` for as |
| `status` | query | string | No | Filter runs by status. One of `queued` | `in_progr |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/evals/{eval_id}/runs"
```

---

## POST /evals/{eval_id}/runs

**Create eval run**

Kicks off a new run for a given evaluation, specifying the data source, and what model configuration to use to test. The datasource will be validated against the schema specified in the config of the evaluation.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `eval_id` | path | string | Yes | The ID of the evaluation to create a run for. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/evals/{eval_id}/runs"
```

---

## GET /evals/{eval_id}/runs/{run_id}

**Get an eval run**

Get an evaluation run by ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `eval_id` | path | string | Yes | The ID of the evaluation to retrieve runs for. |
| `run_id` | path | string | Yes | The ID of the run to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/evals/{eval_id}/runs/{run_id}"
```

---

## POST /evals/{eval_id}/runs/{run_id}

**Cancel eval run**

Cancel an ongoing evaluation run.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `eval_id` | path | string | Yes | The ID of the evaluation whose run you want to can |
| `run_id` | path | string | Yes | The ID of the run to cancel. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/evals/{eval_id}/runs/{run_id}"
```

---

## DELETE /evals/{eval_id}/runs/{run_id}

**Delete eval run**

Delete an eval run.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `eval_id` | path | string | Yes | The ID of the evaluation to delete the run from. |
| `run_id` | path | string | Yes | The ID of the run to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/evals/{eval_id}/runs/{run_id}"
```

---

## GET /evals/{eval_id}/runs/{run_id}/output_items

**Get eval run output items**

Get a list of output items for an evaluation run.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `eval_id` | path | string | Yes | The ID of the evaluation to retrieve runs for. |
| `run_id` | path | string | Yes | The ID of the run to retrieve output items for. |
| `after` | query | string | No | Identifier for the last output item from the previ |
| `limit` | query | integer | No | Number of output items to retrieve. |
| `status` | query | string | No | Filter output items by status. Use `failed` to fil |
| `order` | query | string | No | Sort order for output items by timestamp. Use `asc |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/evals/{eval_id}/runs/{run_id}/output_items"
```

---

## GET /evals/{eval_id}/runs/{run_id}/output_items/{output_item_id}

**Get an output item of an eval run**

Get an evaluation run output item by ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `eval_id` | path | string | Yes | The ID of the evaluation to retrieve runs for. |
| `run_id` | path | string | Yes | The ID of the run to retrieve. |
| `output_item_id` | path | string | Yes | The ID of the output item to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/evals/{eval_id}/runs/{run_id}/output_items/{output_item_id}"
```

---
