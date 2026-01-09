---
created: 2026-01-09
tags: [type/api-reference, api/audit-records]
api_name: The Jira Cloud platform REST API
category: Audit records
endpoint_count: 1
---

# The Jira Cloud platform REST API - Audit Records

[[README|Back to Overview]]

---

## GET /rest/api/3/auditing/record

**Get audit records**

Returns a list of audit records. The list can be filtered to include items:

 *  where each item in `filter` has at least one match in any of these fields:
    
     *  `summary`
     *  `category`
     *  `eventSource`
     *  `objectItem.name` If the object is a user, account ID is available to filter.
     *  `objectItem.parentName`
     *  `objectItem.typeName`
     *  `changedValues.changedFrom`
     *  `changedValues.changedTo`
     *  `remoteAddress`
    
    For example, if `filter` contains *man ed*, an audit record containing `summary": "User added to group"` and `"category": "group management"` is returned.
 *  created on or after a date and time.
 *  created or or before a date and time.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `offset` | query | integer | No | The number of records to skip before returning the |
| `limit` | query | integer | No | The maximum number of results to return. |
| `filter` | query | string | No | The strings to match with audit field content, spa |
| `from` | query | string | No | The date and time on or after which returned audit |
| `to` | query | string | No | The date and time on or before which returned audi |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/auditing/record"
```

---
