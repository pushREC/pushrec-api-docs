---
created: 2026-01-09
tags: [type/api-reference, api/ippolicyrules]
api_name: ngrok OpenAPI
category: IPPolicyRules
endpoint_count: 5
---

# ngrok OpenAPI - Ippolicyrules

[[README|Back to Overview]]

---

## POST /ip_policy_rules

**Create**

Create a new IP policy rule attached to an IP Policy.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ip_policy_rules"
```

---

## GET /ip_policy_rules

**List**

List all IP policy rules on this account


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
  "https://api.ngrok.com/ip_policy_rules"
```

---

## DELETE /ip_policy_rules/{id}

**Delete**

Delete an IP policy rule.


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
  "https://api.ngrok.com/ip_policy_rules/{id}"
```

---

## GET /ip_policy_rules/{id}

**Get**

Get detailed information about an IP policy rule by ID.


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
  "https://api.ngrok.com/ip_policy_rules/{id}"
```

---

## PATCH /ip_policy_rules/{id}

**Update**

Update attributes of an IP policy rule by ID


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/ip_policy_rules/{id}"
```

---
