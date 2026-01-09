---
created: 2026-01-09
tags: [type/api-reference, api/issue-type-properties]
api_name: The Jira Cloud platform REST API
category: Issue type properties
endpoint_count: 4
---

# The Jira Cloud platform REST API - Issue Type Properties

[[README|Back to Overview]]

---

## GET /rest/api/3/issuetype/{issueTypeId}/properties

**Get issue type property keys**

Returns all the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties) keys of the issue type.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) to get the property keys of any issue type.
 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) to get the property keys of any issue types associated with the projects the user has permission to browse.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeId` | path | string | Yes | The ID of the issue type. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetype/{issueTypeId}/properties"
```

---

## DELETE /rest/api/3/issuetype/{issueTypeId}/properties/{propertyKey}

**Delete issue type property**

Deletes the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeId` | path | string | Yes | The ID of the issue type. |
| `propertyKey` | path | string | Yes | The key of the property. Use [Get issue type prope |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetype/{issueTypeId}/properties/{propertyKey}"
```

---

## GET /rest/api/3/issuetype/{issueTypeId}/properties/{propertyKey}

**Get issue type property**

Returns the key and value of the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) to get the details of any issue type.
 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) to get the details of any issue types associated with the projects the user has permission to browse.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeId` | path | string | Yes | The ID of the issue type. |
| `propertyKey` | path | string | Yes | The key of the property. Use [Get issue type prope |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetype/{issueTypeId}/properties/{propertyKey}"
```

---

## PUT /rest/api/3/issuetype/{issueTypeId}/properties/{propertyKey}

**Set issue type property**

Creates or updates the value of the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties). Use this resource to store and update data against an issue type.

The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueTypeId` | path | string | Yes | The ID of the issue type. |
| `propertyKey` | path | string | Yes | The key of the issue type property. The maximum le |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issuetype/{issueTypeId}/properties/{propertyKey}"
```

---
