---
created: 2026-01-08
tags: [type/api-reference, api/allow-list-/-block-list]
api_name: Clerk Backend API
category: Allow-list / Block-list
endpoint_count: 6
---

# Clerk Backend API - Allow-List / Block-List

[[README|Back to Overview]]

---

## GET /allowlist_identifiers

**List all identifiers on the allow-list**

Get a list of all identifiers allowed to sign up to an instance

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/allowlist_identifiers"
```

---

## POST /allowlist_identifiers

**Add identifier to the allow-list**

Create an identifier allowed to sign up to an instance

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/allowlist_identifiers"
```

---

## DELETE /allowlist_identifiers/{identifier_id}

**Delete identifier from allow-list**

Delete an identifier from the instance allow-list

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `identifier_id` | path | string | Yes | The ID of the identifier to delete from the allow- |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/allowlist_identifiers/{identifier_id}"
```

---

## GET /blocklist_identifiers

**List all identifiers on the block-list**

Get a list of all identifiers which are not allowed to access an instance

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/blocklist_identifiers"
```

---

## POST /blocklist_identifiers

**Add identifier to the block-list**

Create an identifier that is blocked from accessing an instance

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/blocklist_identifiers"
```

---

## DELETE /blocklist_identifiers/{identifier_id}

**Delete identifier from block-list**

Delete an identifier from the instance block-list

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `identifier_id` | path | string | Yes | The ID of the identifier to delete from the block- |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/blocklist_identifiers/{identifier_id}"
```

---
