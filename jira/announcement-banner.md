---
created: 2026-01-09
tags: [type/api-reference, api/announcement-banner]
api_name: The Jira Cloud platform REST API
category: Announcement banner
endpoint_count: 2
---

# The Jira Cloud platform REST API - Announcement Banner

[[README|Back to Overview]]

---

## GET /rest/api/3/announcementBanner

**Get announcement banner configuration**

Returns the current announcement banner configuration.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/announcementBanner"
```

---

## PUT /rest/api/3/announcementBanner

**Update announcement banner configuration**

Updates the announcement banner configuration.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/announcementBanner"
```

---
