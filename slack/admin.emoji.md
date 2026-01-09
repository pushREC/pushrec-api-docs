---
created: 2026-01-09
tags: [type/api-reference, api/admin.emoji]
api_name: Slack Web API
category: admin.emoji
endpoint_count: 5
---

# Slack Web API - Admin.Emoji

[[README|Back to Overview]]

---

## POST /admin.emoji.add

Add an emoji.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | Yes | Authentication token. Requires scope: `admin.teams |
| `name` | formData | string | Yes | The name of the emoji to be removed. Colons (`:mye |
| `url` | formData | string | Yes | The URL of a file to use as an image for the emoji |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.emoji.add"
```

---

## POST /admin.emoji.addAlias

Add an emoji alias.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | Yes | Authentication token. Requires scope: `admin.teams |
| `name` | formData | string | Yes | The name of the emoji to be aliased. Colons (`:mye |
| `alias_for` | formData | string | Yes | The alias of the emoji. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.emoji.addAlias"
```

---

## GET /admin.emoji.list

List emoji for an Enterprise Grid organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `admin.teams |
| `cursor` | query | string | No | Set `cursor` to `next_cursor` returned by the prev |
| `limit` | query | string | No | The maximum number of items to return. Must be bet |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.emoji.list"
```

---

## POST /admin.emoji.remove

Remove an emoji across an Enterprise Grid organization

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | Yes | Authentication token. Requires scope: `admin.teams |
| `name` | formData | string | Yes | The name of the emoji to be removed. Colons (`:mye |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.emoji.remove"
```

---

## POST /admin.emoji.rename

Rename an emoji.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | Yes | Authentication token. Requires scope: `admin.teams |
| `name` | formData | string | Yes | The name of the emoji to be renamed. Colons (`:mye |
| `new_name` | formData | string | Yes | The new name of the emoji. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.emoji.rename"
```

---
