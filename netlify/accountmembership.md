---
created: 2026-01-09
tags: [type/api-reference, api/accountmembership]
api_name: Netlify's API documentation
category: accountMembership
endpoint_count: 5
---

# Netlify's API documentation - Accountmembership

[[README|Back to Overview]]

---

## GET /accounts

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/accounts"
```

---

## POST /accounts

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/accounts"
```

---

## GET /accounts/{account_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/accounts/{account_id}"
```

---

## PUT /accounts/{account_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/accounts/{account_id}"
```

---

## DELETE /accounts/{account_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/accounts/{account_id}"
```

---
