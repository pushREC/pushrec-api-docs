---
created: 2026-01-08
tags: [type/api-reference, api/waitlist-entries]
api_name: Clerk Backend API
category: Waitlist Entries
endpoint_count: 2
---

# Clerk Backend API - Waitlist Entries

[[README|Back to Overview]]

---

## GET /waitlist_entries

**List all waitlist entries**

Retrieve a list of waitlist entries for the instance.
Entries are ordered by creation date in descending order by default.
Supports filtering by email address or status and pagination with limit and offset parameters.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `query` | query | string | No | Filter waitlist entries by `email_address` or `id` |
| `status` | query | string | No | Filter waitlist entries by their status |
| `order_by` | query | string | No | Specify the order of results. Supported values are |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/waitlist_entries"
```

---

## POST /waitlist_entries

**Create a waitlist entry**

Creates a new waitlist entry for the given email address.
If the email address is already on the waitlist, no new entry will be created and the existing waitlist entry will be returned.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/waitlist_entries"
```

---
