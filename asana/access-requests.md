---
created: 2026-01-09
tags: [type/api-reference, api/access-requests]
api_name: Asana
category: Access requests
endpoint_count: 4
---

# Asana - Access Requests

[[README|Back to Overview]]

---

## GET /access_requests

**Get access requests**

Returns the pending access requests for a target object or a target object filtered by user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/access_requests"
```

---

## POST /access_requests

**Create an access request**

Submits a new access request for a private object. Currently supports projects and portfolios.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/access_requests"
```

---

## POST /access_requests/{access_request_gid}/approve

**Approve an access request**

Approves an access request for a target object.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/access_requests/{access_request_gid}/approve"
```

---

## POST /access_requests/{access_request_gid}/reject

**Reject an access request**

Rejects an access request for a target object.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/access_requests/{access_request_gid}/reject"
```

---
