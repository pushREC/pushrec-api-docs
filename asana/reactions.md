---
created: 2026-01-09
tags: [type/api-reference, api/reactions]
api_name: Asana
category: Reactions
endpoint_count: 1
---

# Asana - Reactions

[[README|Back to Overview]]

---

## GET /reactions

**Get reactions with an emoji base on an object.**

Returns the reactions with a specified emoji base character on the object.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `target` | query | string | Yes | Globally unique identifier for object to fetch rea |
| `emoji_base` | query | string | Yes | Only return reactions with this emoji base charact |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/reactions"
```

---
