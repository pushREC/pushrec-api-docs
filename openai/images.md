---
created: 2026-01-08
tags: [type/api-reference, api/images]
api_name: OpenAI API
category: Images
endpoint_count: 3
---

# OpenAI API - Images

[[README|Back to Overview]]

---

## POST /images/edits

**Create image edit**

Creates an edited or extended image given one or more source images and a prompt. This endpoint only supports `gpt-image-1` and `dall-e-2`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/images/edits"
```

---

## POST /images/generations

**Create image**

Creates an image given a prompt. [Learn more](https://platform.openai.com/docs/guides/images).


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/images/generations"
```

---

## POST /images/variations

**Create image variation**

Creates a variation of a given image. This endpoint only supports `dall-e-2`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/images/variations"
```

---
