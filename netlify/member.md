---
created: 2026-01-09
tags: [type/api-reference, api/member]
api_name: Netlify's API documentation
category: member
endpoint_count: 5
---

# Netlify's API documentation - Member

[[README|Back to Overview]]

---

## GET /{account_slug}/members

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/{account_slug}/members"
```

---

## POST /{account_slug}/members

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/{account_slug}/members"
```

---

## GET /{account_slug}/members/{member_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/{account_slug}/members/{member_id}"
```

---

## PUT /{account_slug}/members/{member_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/{account_slug}/members/{member_id}"
```

---

## DELETE /{account_slug}/members/{member_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/{account_slug}/members/{member_id}"
```

---
