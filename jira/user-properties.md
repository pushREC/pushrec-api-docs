---
created: 2026-01-09
tags: [type/api-reference, api/user-properties]
api_name: The Jira Cloud platform REST API
category: User properties
endpoint_count: 4
---

# The Jira Cloud platform REST API - User Properties

[[README|Back to Overview]]

---

## GET /rest/api/3/user/properties

**Get user property keys**

Returns the keys of all properties for a user.

Note: This operation does not access the [user properties](https://confluence.atlassian.com/x/8YxjL) created and maintained in Jira.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), to access the property keys on any user.
 *  Access to Jira, to access the calling user's property keys.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accountId` | query | string | No | The account ID of the user, which uniquely identif |
| `userKey` | query | string | No | This parameter is no longer available and will be  |
| `username` | query | string | No | This parameter is no longer available and will be  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/properties"
```

---

## DELETE /rest/api/3/user/properties/{propertyKey}

**Delete user property**

Deletes a property from a user.

Note: This operation does not access the [user properties](https://confluence.atlassian.com/x/8YxjL) created and maintained in Jira.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), to delete a property from any user.
 *  Access to Jira, to delete a property from the calling user's record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accountId` | query | string | No | The account ID of the user, which uniquely identif |
| `userKey` | query | string | No | This parameter is no longer available and will be  |
| `username` | query | string | No | This parameter is no longer available and will be  |
| `propertyKey` | path | string | Yes | The key of the user's property. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/properties/{propertyKey}"
```

---

## GET /rest/api/3/user/properties/{propertyKey}

**Get user property**

Returns the value of a user's property. If no property key is provided [Get user property keys](#api-rest-api-3-user-properties-get) is called.

Note: This operation does not access the [user properties](https://confluence.atlassian.com/x/8YxjL) created and maintained in Jira.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), to get a property from any user.
 *  Access to Jira, to get a property from the calling user's record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accountId` | query | string | No | The account ID of the user, which uniquely identif |
| `userKey` | query | string | No | This parameter is no longer available and will be  |
| `username` | query | string | No | This parameter is no longer available and will be  |
| `propertyKey` | path | string | Yes | The key of the user's property. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/properties/{propertyKey}"
```

---

## PUT /rest/api/3/user/properties/{propertyKey}

**Set user property**

Sets the value of a user's property. Use this resource to store custom data against a user.

Note: This operation does not access the [user properties](https://confluence.atlassian.com/x/8YxjL) created and maintained in Jira.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), to set a property on any user.
 *  Access to Jira, to set a property on the calling user's record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accountId` | query | string | No | The account ID of the user, which uniquely identif |
| `userKey` | query | string | No | This parameter is no longer available and will be  |
| `username` | query | string | No | This parameter is no longer available and will be  |
| `propertyKey` | path | string | Yes | The key of the user's property. The maximum length |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/properties/{propertyKey}"
```

---
