---
created: 2026-01-09
tags: [type/api-reference, api/storage/key-value-stores]
api_name: Apify API
category: Storage/Key-value stores
endpoint_count: 10
---

# Apify API - Storage/Key-Value Stores

[[README|Back to Overview]]

---

## GET /v2/key-value-stores

**Get list of key-value stores**

Gets the list of key-value stores owned by the user.

The response is a list of objects, where each objects contains a basic
information about a single key-value store.

The endpoint supports pagination using the `limit` and `offset` parameters
and it will not return more than 1000 array elements.

By default, the records are sorted by the `createdAt` field in ascending
order, therefore you can use pagination to incrementally fetch all key-value stores
while new ones are still being created. To sort the records in descending order, use
the `desc=1` parameter.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `offset` | query | number | No | Number of records that should be skipped at the st |
| `limit` | query | number | No | Maximum number of records to return. The default v |
| `desc` | query | boolean | No | If `true` or `1` then the objects are sorted by th |
| `unnamed` | query | boolean | No | If `true` or `1` then all the stores are returned. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/key-value-stores"
```

---

## POST /v2/key-value-stores

**Create key-value store**

Creates a key-value store and returns its object. The response is the same
object as returned by the [Get store](#/reference/key-value-stores/store-object/get-store)
endpoint.

Keep in mind that data stored under unnamed store follows [data retention
period](https://docs.apify.com/platform/storage#data-retention).

It creates a store with the given name if the parameter name is used.
If there is another store with the same name, the endpoint does not create a
new one and returns the existing object instead.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `name` | query | string | No | Custom unique name to easily identify the store in |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/key-value-stores"
```

---

## GET /v2/key-value-stores/{storeId}

**Get store**

Gets an object that contains all the details about a specific key-value
store.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `storeId` | path | string | Yes | Key-value store ID or `username~store-name`. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/key-value-stores/{storeId}"
```

---

## PUT /v2/key-value-stores/{storeId}

**Update store**

Updates a key-value store's name and general resource access level using a value specified by a JSON object
passed in the PUT payload.

The response is the updated key-value store object, as returned by the [Get
store](#/reference/key-value-stores/store-object/get-store) API endpoint.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `storeId` | path | string | Yes | Key-value store ID or `username~store-name`. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/key-value-stores/{storeId}"
```

---

## DELETE /v2/key-value-stores/{storeId}

**Delete store**

Deletes a key-value store.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `storeId` | path | string | Yes | Key-value store ID or `username~store-name`. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/key-value-stores/{storeId}"
```

---

## GET /v2/key-value-stores/{storeId}/keys

**Get list of keys**

Returns a list of objects describing keys of a given key-value store, as
well as some information about the values (e.g. size).

This endpoint is paginated using `exclusiveStartKey` and `limit` parameters
- see [Pagination](/api/v2#using-key) for more details.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `storeId` | path | string | Yes | Key-value store ID or `username~store-name`. |
| `exclusiveStartKey` | query | string | No | All keys up to this one (including) are skipped fr |
| `limit` | query | number | No | Number of keys to be returned. Maximum value is `1 |
| `collection` | query | string | No | Limit the results to keys that belong to a specifi |
| `prefix` | query | string | No | Limit the results to keys that start with a specif |
| `signature` | query | string | No | Signature used to access the keys. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/key-value-stores/{storeId}/keys"
```

---

## GET /v2/key-value-stores/{storeId}/records/{recordKey}

**Get record**

Gets a value stored in the key-value store under a specific key.

The response body has the same `Content-Encoding` header as it was set in
[Put record](#tag/Key-value-storesRecord/operation/keyValueStore_record_put).

If the request does not define the `Accept-Encoding` HTTP header with the
right encoding, the record will be decompressed.

Most HTTP clients support decompression by default. After using the HTTP
client with decompression support, the `Accept-Encoding` header is set by
the client and body is decompressed automatically.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `storeId` | path | string | Yes | Key-value store ID or `username~store-name`. |
| `recordKey` | path | string | Yes | Key of the record. |
| `signature` | query | string | No | Signature used to access the record. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/key-value-stores/{storeId}/records/{recordKey}"
```

---

## HEAD /v2/key-value-stores/{storeId}/records/{recordKey}

**Check if a record exists**

Check if a value is stored in the key-value store under a specific key.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `storeId` | path | string | Yes | Key-value store ID or `username~store-name`. |
| `recordKey` | path | string | Yes | Key of the record. |

### Example

```bash
curl -X HEAD \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/key-value-stores/{storeId}/records/{recordKey}"
```

---

## PUT /v2/key-value-stores/{storeId}/records/{recordKey}

**Store record**

Stores a value under a specific key to the key-value store.

The value is passed as the PUT payload and it is stored with a MIME content
type defined by the `Content-Type` header and with encoding defined by the
`Content-Encoding` header.

To save bandwidth, storage, and speed up your upload, send the request
payload compressed with Gzip compression and add the `Content-Encoding: gzip`
header. It is possible to set up another compression type with `Content-Encoding`
request header.

Below is a list of supported `Content-Encoding` types.

* Gzip compression: `Content-Encoding: gzip`
* Deflate compression: `Content-Encoding: deflate`
* Brotli compression: `Content-Encoding: br`


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `storeId` | path | string | Yes | Key-value store ID or `username~store-name`. |
| `recordKey` | path | string | Yes | Key of the record. |
| `Content-Encoding` | header | string | Yes |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/key-value-stores/{storeId}/records/{recordKey}"
```

---

## DELETE /v2/key-value-stores/{storeId}/records/{recordKey}

**Delete record**

Removes a record specified by a key from the key-value store.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `storeId` | path | string | Yes | Key-value store ID or `username~store-name`. |
| `recordKey` | path | string | Yes | Key of the record. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/key-value-stores/{storeId}/records/{recordKey}"
```

---
