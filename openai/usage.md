---
created: 2026-01-08
tags: [type/api-reference, api/usage]
api_name: OpenAI API
category: Usage
endpoint_count: 9
---

# OpenAI API - Usage

[[README|Back to Overview]]

---

## GET /organization/costs

**Costs**

Get costs details for the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `start_time` | query | integer | Yes | Start time (Unix seconds) of the query time range, |
| `end_time` | query | integer | No | End time (Unix seconds) of the query time range, e |
| `bucket_width` | query | string | No | Width of each time bucket in response. Currently o |
| `project_ids` | query | array | No | Return only costs for these projects. |
| `group_by` | query | array | No | Group the costs by the specified fields. Support f |
| `limit` | query | integer | No | A limit on the number of buckets to be returned. L |
| `page` | query | string | No | A cursor for use in pagination. Corresponding to t |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/costs"
```

---

## GET /organization/usage/audio_speeches

**Audio speeches**

Get audio speeches usage details for the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `start_time` | query | integer | Yes | Start time (Unix seconds) of the query time range, |
| `end_time` | query | integer | No | End time (Unix seconds) of the query time range, e |
| `bucket_width` | query | string | No | Width of each time bucket in response. Currently ` |
| `project_ids` | query | array | No | Return only usage for these projects. |
| `user_ids` | query | array | No | Return only usage for these users. |
| `api_key_ids` | query | array | No | Return only usage for these API keys. |
| `models` | query | array | No | Return only usage for these models. |
| `group_by` | query | array | No | Group the usage data by the specified fields. Supp |
| `limit` | query | integer | No | Specifies the number of buckets to return.
- `buck |
| `page` | query | string | No | A cursor for use in pagination. Corresponding to t |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/usage/audio_speeches"
```

---

## GET /organization/usage/audio_transcriptions

**Audio transcriptions**

Get audio transcriptions usage details for the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `start_time` | query | integer | Yes | Start time (Unix seconds) of the query time range, |
| `end_time` | query | integer | No | End time (Unix seconds) of the query time range, e |
| `bucket_width` | query | string | No | Width of each time bucket in response. Currently ` |
| `project_ids` | query | array | No | Return only usage for these projects. |
| `user_ids` | query | array | No | Return only usage for these users. |
| `api_key_ids` | query | array | No | Return only usage for these API keys. |
| `models` | query | array | No | Return only usage for these models. |
| `group_by` | query | array | No | Group the usage data by the specified fields. Supp |
| `limit` | query | integer | No | Specifies the number of buckets to return.
- `buck |
| `page` | query | string | No | A cursor for use in pagination. Corresponding to t |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/usage/audio_transcriptions"
```

---

## GET /organization/usage/code_interpreter_sessions

**Code interpreter sessions**

Get code interpreter sessions usage details for the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `start_time` | query | integer | Yes | Start time (Unix seconds) of the query time range, |
| `end_time` | query | integer | No | End time (Unix seconds) of the query time range, e |
| `bucket_width` | query | string | No | Width of each time bucket in response. Currently ` |
| `project_ids` | query | array | No | Return only usage for these projects. |
| `group_by` | query | array | No | Group the usage data by the specified fields. Supp |
| `limit` | query | integer | No | Specifies the number of buckets to return.
- `buck |
| `page` | query | string | No | A cursor for use in pagination. Corresponding to t |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/usage/code_interpreter_sessions"
```

---

## GET /organization/usage/completions

**Completions**

Get completions usage details for the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `start_time` | query | integer | Yes | Start time (Unix seconds) of the query time range, |
| `end_time` | query | integer | No | End time (Unix seconds) of the query time range, e |
| `bucket_width` | query | string | No | Width of each time bucket in response. Currently ` |
| `project_ids` | query | array | No | Return only usage for these projects. |
| `user_ids` | query | array | No | Return only usage for these users. |
| `api_key_ids` | query | array | No | Return only usage for these API keys. |
| `models` | query | array | No | Return only usage for these models. |
| `batch` | query | boolean | No | If `true`, return batch jobs only. If `false`, ret |
| `group_by` | query | array | No | Group the usage data by the specified fields. Supp |
| `limit` | query | integer | No | Specifies the number of buckets to return.
- `buck |
| `page` | query | string | No | A cursor for use in pagination. Corresponding to t |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/usage/completions"
```

---

## GET /organization/usage/embeddings

**Embeddings**

Get embeddings usage details for the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `start_time` | query | integer | Yes | Start time (Unix seconds) of the query time range, |
| `end_time` | query | integer | No | End time (Unix seconds) of the query time range, e |
| `bucket_width` | query | string | No | Width of each time bucket in response. Currently ` |
| `project_ids` | query | array | No | Return only usage for these projects. |
| `user_ids` | query | array | No | Return only usage for these users. |
| `api_key_ids` | query | array | No | Return only usage for these API keys. |
| `models` | query | array | No | Return only usage for these models. |
| `group_by` | query | array | No | Group the usage data by the specified fields. Supp |
| `limit` | query | integer | No | Specifies the number of buckets to return.
- `buck |
| `page` | query | string | No | A cursor for use in pagination. Corresponding to t |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/usage/embeddings"
```

---

## GET /organization/usage/images

**Images**

Get images usage details for the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `start_time` | query | integer | Yes | Start time (Unix seconds) of the query time range, |
| `end_time` | query | integer | No | End time (Unix seconds) of the query time range, e |
| `bucket_width` | query | string | No | Width of each time bucket in response. Currently ` |
| `sources` | query | array | No | Return only usages for these sources. Possible val |
| `sizes` | query | array | No | Return only usages for these image sizes. Possible |
| `project_ids` | query | array | No | Return only usage for these projects. |
| `user_ids` | query | array | No | Return only usage for these users. |
| `api_key_ids` | query | array | No | Return only usage for these API keys. |
| `models` | query | array | No | Return only usage for these models. |
| `group_by` | query | array | No | Group the usage data by the specified fields. Supp |
| `limit` | query | integer | No | Specifies the number of buckets to return.
- `buck |
| `page` | query | string | No | A cursor for use in pagination. Corresponding to t |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/usage/images"
```

---

## GET /organization/usage/moderations

**Moderations**

Get moderations usage details for the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `start_time` | query | integer | Yes | Start time (Unix seconds) of the query time range, |
| `end_time` | query | integer | No | End time (Unix seconds) of the query time range, e |
| `bucket_width` | query | string | No | Width of each time bucket in response. Currently ` |
| `project_ids` | query | array | No | Return only usage for these projects. |
| `user_ids` | query | array | No | Return only usage for these users. |
| `api_key_ids` | query | array | No | Return only usage for these API keys. |
| `models` | query | array | No | Return only usage for these models. |
| `group_by` | query | array | No | Group the usage data by the specified fields. Supp |
| `limit` | query | integer | No | Specifies the number of buckets to return.
- `buck |
| `page` | query | string | No | A cursor for use in pagination. Corresponding to t |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/usage/moderations"
```

---

## GET /organization/usage/vector_stores

**Vector stores**

Get vector stores usage details for the organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `start_time` | query | integer | Yes | Start time (Unix seconds) of the query time range, |
| `end_time` | query | integer | No | End time (Unix seconds) of the query time range, e |
| `bucket_width` | query | string | No | Width of each time bucket in response. Currently ` |
| `project_ids` | query | array | No | Return only usage for these projects. |
| `group_by` | query | array | No | Group the usage data by the specified fields. Supp |
| `limit` | query | integer | No | Specifies the number of buckets to return.
- `buck |
| `page` | query | string | No | A cursor for use in pagination. Corresponding to t |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/organization/usage/vector_stores"
```

---
