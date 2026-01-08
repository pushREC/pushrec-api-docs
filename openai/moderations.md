---
created: 2026-01-08
tags: [type/api-reference, api/moderations]
api_name: OpenAI API
category: Moderations
endpoint_count: 1
---

# OpenAI API - Moderations

[[README|Back to Overview]]

---

## POST /moderations

**Create moderation**

Classifies if text and/or image inputs are potentially harmful. Learn
more in the [moderation guide](https://platform.openai.com/docs/guides/moderation).


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/moderations"
```

---
