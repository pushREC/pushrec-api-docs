---
created: 2026-01-09
tags: [type/api-reference, api/portfolios]
api_name: Asana
category: Portfolios
endpoint_count: 12
---

# Asana - Portfolios

[[README|Back to Overview]]

---

## GET /portfolios

**Get multiple portfolios**

<b>Required scope: </b><code>portfolios:read</code>

Returns a list of the portfolios in compact representation that are owned by the current API user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `workspace` | query | string | Yes | The workspace or organization to filter portfolios |
| `owner` | query | string | No | The user who owns the portfolio. Currently, API us |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolios"
```

---

## POST /portfolios

**Create a portfolio**

<b>Required scope: </b><code>portfolios:write</code>

Creates a new portfolio in the given workspace with the supplied name.

Note that portfolios created in the Asana UI may have some state
(like the “Priority” custom field) which is automatically added
to the portfolio when it is created. Portfolios created via our
API will *not* be created with the same initial state to allow
integrations to create their own starting state on a portfolio.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolios"
```

---

## GET /portfolios/{portfolio_gid}

**Get a portfolio**

<b>Required scope: </b><code>portfolios:read</code>

<table>
  <tr>
    <th>Field</th>
    <th>Required Scope</th>
  </tr>
  <tr>
    <td><code>custom_field_settings</code></td>
    <td><code>custom_fields:read</code></td>
  </tr>
</table>

Returns the complete portfolio record for a single portfolio.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolios/{portfolio_gid}"
```

---

## PUT /portfolios/{portfolio_gid}

**Update a portfolio**

<b>Required scope: </b><code>portfolios:write</code>

An existing portfolio can be updated by making a PUT request on the URL for
that portfolio. Only the fields provided in the `data` block will be updated;
any unspecified fields will remain unchanged.

Returns the complete updated portfolio record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolios/{portfolio_gid}"
```

---

## DELETE /portfolios/{portfolio_gid}

**Delete a portfolio**

An existing portfolio can be deleted by making a DELETE request on
the URL for that portfolio.

Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolios/{portfolio_gid}"
```

---

## GET /portfolios/{portfolio_gid}/items

**Get portfolio items**

<b>Required scope: </b><code>portfolios:read</code>

Get a list of the items in compact form in a portfolio.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/items"
```

---

## POST /portfolios/{portfolio_gid}/addItem

**Add a portfolio item**

<b>Required scope: </b><code>portfolios:write</code>

Add an item to a portfolio.
Returns an empty data block.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addItem"
```

---

## POST /portfolios/{portfolio_gid}/removeItem

**Remove a portfolio item**

<b>Required scope: </b><code>portfolios:write</code>

Remove an item from a portfolio.
Returns an empty data block.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeItem"
```

---

## POST /portfolios/{portfolio_gid}/addCustomFieldSetting

**Add a custom field to a portfolio**

<b>Required scope: </b><code>portfolios:write</code>

Custom fields are associated with portfolios by way of custom field settings.  This method creates a setting for the portfolio.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addCustomFieldSetting"
```

---

## POST /portfolios/{portfolio_gid}/removeCustomFieldSetting

**Remove a custom field from a portfolio**

<b>Required scope: </b><code>portfolios:write</code>

Removes a custom field setting from a portfolio.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeCustomFieldSetting"
```

---

## POST /portfolios/{portfolio_gid}/addMembers

**Add users to a portfolio**

Adds the specified list of users as members of the portfolio.
Returns the updated portfolio record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addMembers"
```

---

## POST /portfolios/{portfolio_gid}/removeMembers

**Remove users from a portfolio**

Removes the specified list of users from members of the portfolio.
Returns the updated portfolio record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeMembers"
```

---
