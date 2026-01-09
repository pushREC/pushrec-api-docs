---
created: 2026-01-09
tags: [type/api-reference, api/issue-navigator-settings]
api_name: The Jira Cloud platform REST API
category: Issue navigator settings
endpoint_count: 2
---

# The Jira Cloud platform REST API - Issue Navigator Settings

[[README|Back to Overview]]

---

## GET /rest/api/3/settings/columns

**Get issue navigator default columns**

Returns the default issue navigator columns.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/settings/columns"
```

---

## PUT /rest/api/3/settings/columns

**Set issue navigator default columns**

Sets the default issue navigator columns.

The `columns` parameter accepts a navigable field value and is expressed as HTML form data. To specify multiple columns, pass multiple `columns` parameters. For example, in curl:

`curl -X PUT -d columns=summary -d columns=description https://your-domain.atlassian.net/rest/api/3/settings/columns`

If no column details are sent, then all default columns are removed.

A navigable field is one that can be used as a column on the issue navigator. Find details of navigable issue columns using [Get fields](#api-rest-api-3-field-get).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/settings/columns"
```

---
