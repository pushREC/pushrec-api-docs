---
created: 2026-01-08
tags: [type/api-reference, api/saml-connections]
api_name: Clerk Backend API
category: SAML Connections
endpoint_count: 5
---

# Clerk Backend API - Saml Connections

[[README|Back to Overview]]

---

## GET /saml_connections

**Get a list of SAML Connections for an instance**

Returns the list of SAML Connections for an instance.
Results can be paginated using the optional `limit` and `offset` query parameters.
The SAML Connections are ordered by descending creation date and the most recent will be returned first.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `query` | query | string | No | Returns SAML connections that have a name that mat |
| `order_by` | query | string | No | Sorts organizations memberships by phone_number, e |
| `organization_id` | query | array | No | Returns SAML connections that have an associated o |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/saml_connections"
```

---

## POST /saml_connections

**Create a SAML Connection**

Create a new SAML Connection.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/saml_connections"
```

---

## GET /saml_connections/{saml_connection_id}

**Retrieve a SAML Connection by ID**

Fetches the SAML Connection whose ID matches the provided `saml_connection_id` in the path.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `saml_connection_id` | path | string | Yes | The ID of the SAML Connection |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/saml_connections/{saml_connection_id}"
```

---

## PATCH /saml_connections/{saml_connection_id}

**Update a SAML Connection**

Updates the SAML Connection whose ID matches the provided `id` in the path.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `saml_connection_id` | path | string | Yes | The ID of the SAML Connection to update |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/saml_connections/{saml_connection_id}"
```

---

## DELETE /saml_connections/{saml_connection_id}

**Delete a SAML Connection**

Deletes the SAML Connection whose ID matches the provided `id` in the path.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `saml_connection_id` | path | string | Yes | The ID of the SAML Connection to delete |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/saml_connections/{saml_connection_id}"
```

---
