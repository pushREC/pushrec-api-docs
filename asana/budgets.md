---
created: 2026-01-09
tags: [type/api-reference, api/budgets]
api_name: Asana
category: Budgets
endpoint_count: 5
---

# Asana - Budgets

[[README|Back to Overview]]

---

## GET /budgets

**Get all budgets**

Gets all budgets for a given *parent*. This will at most return a list of size 1 for a given *parent*.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `parent` | query | string | Yes | Globally unique identifier for the budget's parent |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/budgets"
```

---

## POST /budgets

**Create a budget**

Creates a new budget.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/budgets"
```

---

## GET /budgets/{budget_gid}

**Get a budget**

Returns the complete budget record for a single budget.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/budgets/{budget_gid}"
```

---

## PUT /budgets/{budget_gid}

**Update a budget**

An existing budget can be updated by making a PUT request on the URL for
that budget. Only the fields provided in the `data` block will be updated;
any unspecified fields will remain unchanged.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/budgets/{budget_gid}"
```

---

## DELETE /budgets/{budget_gid}

**Delete a budget**

A specific, existing budget can be deleted by making a DELETE request on the URL for that budget.

Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/budgets/{budget_gid}"
```

---
