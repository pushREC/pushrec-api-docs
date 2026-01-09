---
created: 2026-01-09
tags: [type/api-reference, api/issue-link-types]
api_name: The Jira Cloud platform REST API
category: Issue link types
endpoint_count: 5
---

# The Jira Cloud platform REST API - Issue Link Types

[[README|Back to Overview]]

---

## GET /rest/api/3/issueLinkType

**Get issue link types**

Returns a list of all issue link types.

To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for a project in the site.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issueLinkType"
```

---

## POST /rest/api/3/issueLinkType

**Create issue link type**

Creates an issue link type. Use this operation to create descriptions of the reasons why issues are linked. The issue link type consists of a name and descriptions for a link's inward and outward relationships.

To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issueLinkType"
```

---

## DELETE /rest/api/3/issueLinkType/{issueLinkTypeId}

**Delete issue link type**

Deletes an issue link type.

To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueLinkTypeId` | path | string | Yes | The ID of the issue link type. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issueLinkType/{issueLinkTypeId}"
```

---

## GET /rest/api/3/issueLinkType/{issueLinkTypeId}

**Get issue link type**

Returns an issue link type.

To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for a project in the site.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueLinkTypeId` | path | string | Yes | The ID of the issue link type. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issueLinkType/{issueLinkTypeId}"
```

---

## PUT /rest/api/3/issueLinkType/{issueLinkTypeId}

**Update issue link type**

Updates an issue link type.

To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueLinkTypeId` | path | string | Yes | The ID of the issue link type. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issueLinkType/{issueLinkTypeId}"
```

---
