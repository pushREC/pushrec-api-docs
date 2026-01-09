---
created: 2026-01-09
tags: [type/api-reference, api/issue-security-level]
api_name: The Jira Cloud platform REST API
category: Issue security level
endpoint_count: 2
---

# The Jira Cloud platform REST API - Issue Security Level

[[README|Back to Overview]]

---

## GET /rest/api/3/issuesecurityschemes/{issueSecuritySchemeId}/members

**Get issue security level members by issue security scheme**

Returns issue security level members.

Only issue security level members in context of classic projects are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueSecuritySchemeId` | path | integer | Yes | The ID of the issue security scheme. Use the [Get  |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `issueSecurityLevelId` | query | array | No | The list of issue security level IDs. To include m |
| `expand` | query | string | No | Use expand to include additional information in th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuesecurityschemes/{issueSecuritySchemeId}/members"
```

---

## GET /rest/api/3/securitylevel/{id}

**Get issue security level**

Returns details of an issue security level.

Use [Get issue security scheme](#api-rest-api-3-issuesecurityschemes-id-get) to obtain the IDs of issue security levels associated with the issue security scheme.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the issue security level. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/securitylevel/{id}"
```

---
