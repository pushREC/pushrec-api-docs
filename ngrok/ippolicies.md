---
created: 2026-01-09
tags: [type/api-reference, api/ippolicies]
api_name: ngrok OpenAPI
category: IPPolicies
endpoint_count: 5
---

# ngrok OpenAPI - Ippolicies

[[README|Back to Overview]]

---

## POST /ip_policies

**Create**

Create a new IP policy. It will not apply to any traffic until you associate to a traffic source via an endpoint configuration or IP restriction.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ip_policies"
```

---

## GET /ip_policies

**List**

List all IP policies on this account


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `before_id` | query | string | No |  |
| `limit` | query | string | No |  |
| `filter` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ip_policies"
```

---

## DELETE /ip_policies/{id}

**Delete**

Delete an IP policy. If the IP policy is referenced by another object for the purposes of traffic restriction it will be treated as if the IP policy remains but has zero rules.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | a resource identifier
 |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ip_policies/{id}"
```

---

## GET /ip_policies/{id}

**Get**

Get detailed information about an IP policy by ID.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | a resource identifier
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ip_policies/{id}"
```

---

## PATCH /ip_policies/{id}

**Update**

Update attributes of an IP policy by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ip_policies/{id}"
```

---
