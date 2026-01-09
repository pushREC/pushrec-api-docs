---
created: 2026-01-09
tags: [type/api-reference, api/license-metrics]
api_name: The Jira Cloud platform REST API
category: License metrics
endpoint_count: 3
---

# The Jira Cloud platform REST API - License Metrics

[[README|Back to Overview]]

---

## GET /rest/api/3/instance/license

**Get license**

Returns licensing information about the Jira instance.

**[Permissions](#permissions) required:** None.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/instance/license"
```

---

## GET /rest/api/3/license/approximateLicenseCount

**Get approximate license count**

Returns the approximate number of user accounts across all Jira licenses. Note that this information is cached with a 7-day lifecycle and could be stale at the time of call.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/license/approximateLicenseCount"
```

---

## GET /rest/api/3/license/approximateLicenseCount/product/{applicationKey}

**Get approximate application license count**

Returns the total approximate number of user accounts for a single Jira license. Note that this information is cached with a 7-day lifecycle and could be stale at the time of call.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `applicationKey` | path | string | Yes | The ID of the application, represents a specific v |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/license/approximateLicenseCount/product/{applicationKey}"
```

---
