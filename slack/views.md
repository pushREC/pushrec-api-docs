---
created: 2026-01-09
tags: [type/api-reference, api/views]
api_name: Slack Web API
category: views
endpoint_count: 4
---

# Slack Web API - Views

[[README|Back to Overview]]

---

## GET /views.open

Open a view for a user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `none` |
| `trigger_id` | query | string | Yes | Exchange a trigger to post to the user. |
| `view` | query | string | Yes | A [view payload](/reference/surfaces/views). This  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/views.open"
```

---

## GET /views.publish

Publish a static view for a User.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `none` |
| `user_id` | query | string | Yes | `id` of the user you want publish a view to. |
| `view` | query | string | Yes | A [view payload](/reference/surfaces/views). This  |
| `hash` | query | string | No | A string that represents view state to protect aga |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/views.publish"
```

---

## GET /views.push

Push a view onto the stack of a root view.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `none` |
| `trigger_id` | query | string | Yes | Exchange a trigger to post to the user. |
| `view` | query | string | Yes | A [view payload](/reference/surfaces/views). This  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/views.push"
```

---

## GET /views.update

Update an existing view.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `none` |
| `view_id` | query | string | No | A unique identifier of the view to be updated. Eit |
| `external_id` | query | string | No | A unique identifier of the view set by the develop |
| `view` | query | string | No | A [view object](/reference/surfaces/views). This m |
| `hash` | query | string | No | A string that represents view state to protect aga |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/views.update"
```

---
