---
created: 2026-01-08
tags: [type/api-reference, api/dns]
api_name: Vercel API
category: dns
endpoint_count: 4
---

# Vercel API - Dns

[[README|Back to Overview]]

---

## GET /v4/domains/{domain}/records

**List existing DNS records**

Retrieves a list of DNS records created for a domain name. By default it returns 20 records if no limit is provided. The rest can be retrieved using the pagination options.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes |  |
| `limit` | query | string | No | Maximum number of records to list from a request. |
| `since` | query | string | No | Get records created after this JavaScript timestam |
| `until` | query | string | No | Get records created before this JavaScript timesta |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v4/domains/{domain}/records"
```

---

## POST /v2/domains/{domain}/records

**Create a DNS record**

Creates a DNS record for a domain.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes | The domain used to create the DNS record. |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v2/domains/{domain}/records"
```

---

## PATCH /v1/domains/records/{recordId}

**Update an existing DNS record**

Updates an existing DNS record for a domain name.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `recordId` | path | string | Yes | The id of the DNS record |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/domains/records/{recordId}"
```

---

## DELETE /v2/domains/{domain}/records/{recordId}

**Delete a DNS record**

Removes an existing DNS record from a domain name.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | path | string | Yes |  |
| `recordId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v2/domains/{domain}/records/{recordId}"
```

---
