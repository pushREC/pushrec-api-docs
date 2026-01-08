---
created: 2026-01-08
tags: [type/api-reference, api/vector-stores]
api_name: OpenAI API
category: Vector stores
endpoint_count: 16
---

# OpenAI API - Vector Stores

[[README|Back to Overview]]

---

## GET /vector_stores

**List vector stores**

Returns a list of vector stores.

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
  "https://api.openai.com/v1/vector_stores"
```

---

## POST /vector_stores

**Create vector store**

Create a vector store.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores"
```

---

## GET /vector_stores/{vector_store_id}

**Retrieve vector store**

Retrieves a vector store.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `vector_store_id` | path | string | Yes | The ID of the vector store to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores/{vector_store_id}"
```

---

## POST /vector_stores/{vector_store_id}

**Modify vector store**

Modifies a vector store.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `vector_store_id` | path | string | Yes | The ID of the vector store to modify. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores/{vector_store_id}"
```

---

## DELETE /vector_stores/{vector_store_id}

**Delete vector store**

Delete a vector store.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `vector_store_id` | path | string | Yes | The ID of the vector store to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores/{vector_store_id}"
```

---

## POST /vector_stores/{vector_store_id}/file_batches

**Create vector store file batch**

Create a vector store file batch.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `vector_store_id` | path | string | Yes | The ID of the vector store for which to create a F |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores/{vector_store_id}/file_batches"
```

---

## GET /vector_stores/{vector_store_id}/file_batches/{batch_id}

**Retrieve vector store file batch**

Retrieves a vector store file batch.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `vector_store_id` | path | string | Yes | The ID of the vector store that the file batch bel |
| `batch_id` | path | string | Yes | The ID of the file batch being retrieved. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores/{vector_store_id}/file_batches/{batch_id}"
```

---

## POST /vector_stores/{vector_store_id}/file_batches/{batch_id}/cancel

**Cancel vector store file batch**

Cancel a vector store file batch. This attempts to cancel the processing of files in this batch as soon as possible.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `vector_store_id` | path | string | Yes | The ID of the vector store that the file batch bel |
| `batch_id` | path | string | Yes | The ID of the file batch to cancel. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores/{vector_store_id}/file_batches/{batch_id}/cancel"
```

---

## GET /vector_stores/{vector_store_id}/file_batches/{batch_id}/files

**List vector store files in a batch**

Returns a list of vector store files in a batch.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `vector_store_id` | path | string | Yes | The ID of the vector store that the files belong t |
| `batch_id` | path | string | Yes | The ID of the file batch that the files belong to. |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `order` | query | string | No | Sort order by the `created_at` timestamp of the ob |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |
| `before` | query | string | No | A cursor for use in pagination. `before` is an obj |
| `filter` | query | string | No | Filter by file status. One of `in_progress`, `comp |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores/{vector_store_id}/file_batches/{batch_id}/files"
```

---

## GET /vector_stores/{vector_store_id}/files

**List vector store files**

Returns a list of vector store files.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `vector_store_id` | path | string | Yes | The ID of the vector store that the files belong t |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `order` | query | string | No | Sort order by the `created_at` timestamp of the ob |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |
| `before` | query | string | No | A cursor for use in pagination. `before` is an obj |
| `filter` | query | string | No | Filter by file status. One of `in_progress`, `comp |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores/{vector_store_id}/files"
```

---

## POST /vector_stores/{vector_store_id}/files

**Create vector store file**

Create a vector store file by attaching a [File](https://platform.openai.com/docs/api-reference/files) to a [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `vector_store_id` | path | string | Yes | The ID of the vector store for which to create a F |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores/{vector_store_id}/files"
```

---

## GET /vector_stores/{vector_store_id}/files/{file_id}

**Retrieve vector store file**

Retrieves a vector store file.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `vector_store_id` | path | string | Yes | The ID of the vector store that the file belongs t |
| `file_id` | path | string | Yes | The ID of the file being retrieved. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores/{vector_store_id}/files/{file_id}"
```

---

## DELETE /vector_stores/{vector_store_id}/files/{file_id}

**Delete vector store file**

Delete a vector store file. This will remove the file from the vector store but the file itself will not be deleted. To delete the file, use the [delete file](https://platform.openai.com/docs/api-reference/files/delete) endpoint.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `vector_store_id` | path | string | Yes | The ID of the vector store that the file belongs t |
| `file_id` | path | string | Yes | The ID of the file to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores/{vector_store_id}/files/{file_id}"
```

---

## POST /vector_stores/{vector_store_id}/files/{file_id}

**Update vector store file attributes**

Update attributes on a vector store file.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `vector_store_id` | path | string | Yes | The ID of the vector store the file belongs to. |
| `file_id` | path | string | Yes | The ID of the file to update attributes. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores/{vector_store_id}/files/{file_id}"
```

---

## GET /vector_stores/{vector_store_id}/files/{file_id}/content

**Retrieve vector store file content**

Retrieve the parsed contents of a vector store file.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `vector_store_id` | path | string | Yes | The ID of the vector store. |
| `file_id` | path | string | Yes | The ID of the file within the vector store. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores/{vector_store_id}/files/{file_id}/content"
```

---

## POST /vector_stores/{vector_store_id}/search

**Search vector store**

Search a vector store for relevant chunks based on a query and file attributes filter.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `vector_store_id` | path | string | Yes | The ID of the vector store to search. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/vector_stores/{vector_store_id}/search"
```

---
