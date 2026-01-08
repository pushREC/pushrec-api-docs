---
created: 2026-01-08
tags: [type/api-reference, api/functions]
api_name: DigitalOcean API
category: Functions
endpoint_count: 9
---

# DigitalOcean API - Functions

[[README|Back to Overview]]

---

## GET /v2/functions/namespaces

**List Namespaces**

Returns a list of namespaces associated with the current user. To get all namespaces, send a GET request to `/v2/functions/namespaces`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/functions/namespaces"
```

---

## POST /v2/functions/namespaces

**Create Namespace**

Creates a new serverless functions namespace in the desired region and associates it with the provided label. A namespace is a collection of functions and their associated packages, triggers, and project specifications. To create a namespace, send a POST request to `/v2/functions/namespaces` with the `region` and `label` properties.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/functions/namespaces"
```

---

## GET /v2/functions/namespaces/{namespace_id}

**Get Namespace**

Gets the namespace details for the given namespace UUID. To get namespace details, send a GET request to `/v2/functions/namespaces/$NAMESPACE_ID` with no parameters.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/functions/namespaces/{namespace_id}"
```

---

## DELETE /v2/functions/namespaces/{namespace_id}

**Delete Namespace**

Deletes the given namespace.  When a namespace is deleted all assets, in the namespace are deleted, this includes packages, functions and triggers. Deleting a namespace is a destructive operation and assets in the namespace are not recoverable after deletion. Some metadata is retained, such as activations, or soft deleted for reporting purposes.
To delete namespace, send a DELETE request to `/v2/functions/namespaces/$NAMESPACE_ID`.
A successful deletion returns a 204 response.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/functions/namespaces/{namespace_id}"
```

---

## GET /v2/functions/namespaces/{namespace_id}/triggers

**List Triggers**

Returns a list of triggers associated with the current user and namespace. To get all triggers, send a GET request to `/v2/functions/namespaces/$NAMESPACE_ID/triggers`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/functions/namespaces/{namespace_id}/triggers"
```

---

## POST /v2/functions/namespaces/{namespace_id}/triggers

**Create Trigger**

Creates a new trigger for a given function in a namespace. To create a trigger, send a POST request to `/v2/functions/namespaces/$NAMESPACE_ID/triggers` with the `name`, `function`, `type`, `is_enabled` and `scheduled_details` properties.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/functions/namespaces/{namespace_id}/triggers"
```

---

## GET /v2/functions/namespaces/{namespace_id}/triggers/{trigger_name}

**Get Trigger**

Gets the trigger details. To get the trigger details, send a GET request to `/v2/functions/namespaces/$NAMESPACE_ID/triggers/$TRIGGER_NAME`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/functions/namespaces/{namespace_id}/triggers/{trigger_name}"
```

---

## PUT /v2/functions/namespaces/{namespace_id}/triggers/{trigger_name}

**Update Trigger**

Updates the details of the given trigger. To update a trigger, send a PUT request to `/v2/functions/namespaces/$NAMESPACE_ID/triggers/$TRIGGER_NAME` with new values for the `is_enabled ` or `scheduled_details` properties.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/functions/namespaces/{namespace_id}/triggers/{trigger_name}"
```

---

## DELETE /v2/functions/namespaces/{namespace_id}/triggers/{trigger_name}

**Delete Trigger**

Deletes the given trigger.
To delete trigger, send a DELETE request to `/v2/functions/namespaces/$NAMESPACE_ID/triggers/$TRIGGER_NAME`.
A successful deletion returns a 204 response.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/functions/namespaces/{namespace_id}/triggers/{trigger_name}"
```

---
