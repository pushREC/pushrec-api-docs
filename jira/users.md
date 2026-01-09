---
created: 2026-01-09
tags: [type/api-reference, api/users]
api_name: The Jira Cloud platform REST API
category: Users
endpoint_count: 13
---

# The Jira Cloud platform REST API - Users

[[README|Back to Overview]]

---

## DELETE /rest/api/3/user

**Delete user**

Deletes a user. If the operation completes successfully then the user is removed from Jira's user base. This operation does not delete the user's Atlassian account.

**[Permissions](#permissions) required:** Site administration (that is, membership of the *site-admin* [group](https://confluence.atlassian.com/x/24xjL)).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accountId` | query | string | Yes | The account ID of the user, which uniquely identif |
| `username` | query | string | No | This parameter is no longer available. See the [de |
| `key` | query | string | No | This parameter is no longer available. See the [de |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user"
```

---

## GET /rest/api/3/user

**Get user**

Returns a user.

Privacy controls are applied to the response based on the user's preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accountId` | query | string | No | The account ID of the user, which uniquely identif |
| `username` | query | string | No | This parameter is no longer available. See the [de |
| `key` | query | string | No | This parameter is no longer available. See the [de |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user"
```

---

## POST /rest/api/3/user

**Create user**

Creates a user. This resource is retained for legacy compatibility. As soon as a more suitable alternative is available this resource will be deprecated.

**Note:** This API does not support Forge apps.

If the user exists and has access to Jira, the operation returns a 201 status. If the user exists but does not have access to Jira, the operation returns a 400 status.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). The caller has to be an **organization admin**.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user"
```

---

## GET /rest/api/3/user/bulk

**Bulk get users**

Returns a [paginated](#pagination) list of the users specified by one or more account IDs.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `username` | query | array | No | This parameter is no longer available and will be  |
| `key` | query | array | No | This parameter is no longer available and will be  |
| `accountId` | query | array | Yes | The account ID of a user. To specify multiple user |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/bulk"
```

---

## GET /rest/api/3/user/bulk/migration

**Get account IDs for users**

Returns the account IDs for the users specified in the `key` or `username` parameters. Note that multiple `key` or `username` parameters can be specified.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `username` | query | array | No | Username of a user. To specify multiple users, pas |
| `key` | query | array | No | Key of a user. To specify multiple users, pass mul |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/bulk/migration"
```

---

## DELETE /rest/api/3/user/columns

**Reset user default columns**

Resets the default [ issue table columns](https://confluence.atlassian.com/x/XYdKLg) for the user to the system default. If `accountId` is not passed, the calling user's default columns are reset.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), to set the columns on any user.
 *  Permission to access Jira, to set the calling user's columns.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accountId` | query | string | No | The account ID of the user, which uniquely identif |
| `username` | query | string | No | This parameter is no longer available. See the [de |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/columns"
```

---

## GET /rest/api/3/user/columns

**Get user default columns**

Returns the default [issue table columns](https://confluence.atlassian.com/x/XYdKLg) for the user. If `accountId` is not passed in the request, the calling user's details are returned.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLgl), to get the column details for any user.
 *  Permission to access Jira, to get the calling user's column details.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accountId` | query | string | No | The account ID of the user, which uniquely identif |
| `username` | query | string | No | This parameter is no longer available See the [dep |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/columns"
```

---

## PUT /rest/api/3/user/columns

**Set user default columns**

Sets the default [ issue table columns](https://confluence.atlassian.com/x/XYdKLg) for the user. If an account ID is not passed, the calling user's default columns are set. If no column details are sent, then all default columns are removed.

The parameters for this resource are expressed as HTML form data. For example, in curl:

`curl -X PUT -d columns=summary -d columns=description https://your-domain.atlassian.net/rest/api/3/user/columns?accountId=5b10ac8d82e05b22cc7d4ef5'`

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), to set the columns on any user.
 *  Permission to access Jira, to set the calling user's columns.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accountId` | query | string | No | The account ID of the user, which uniquely identif |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/columns"
```

---

## GET /rest/api/3/user/email

**Get user email**

Returns a user's email address regardless of the user's profile visibility settings. For Connect apps, this API is only available to apps approved by Atlassian, according to these [guidelines](https://community.developer.atlassian.com/t/guidelines-for-requesting-access-to-email-address/27603). For Forge apps, this API only supports access via asApp() requests.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accountId` | query | string | Yes | The account ID of the user, which uniquely identif |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/email"
```

---

## GET /rest/api/3/user/email/bulk

**Get user email bulk**

Returns a user's email address regardless of the user's profile visibility settings. For Connect apps, this API is only available to apps approved by Atlassian, according to these [guidelines](https://community.developer.atlassian.com/t/guidelines-for-requesting-access-to-email-address/27603). For Forge apps, this API only supports access via asApp() requests.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accountId` | query | array | Yes | The account IDs of the users for which emails are  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/email/bulk"
```

---

## GET /rest/api/3/user/groups

**Get user groups**

Returns the groups to which a user belongs.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accountId` | query | string | Yes | The account ID of the user, which uniquely identif |
| `username` | query | string | No | This parameter is no longer available. See the [de |
| `key` | query | string | No | This parameter is no longer available. See the [de |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/groups"
```

---

## GET /rest/api/3/users

**Get all users default**

Returns a list of all users, including active users, inactive users and previously deleted users that have an Atlassian account.

Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return. |
| `maxResults` | query | integer | No | The maximum number of items to return (limited to  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/users"
```

---

## GET /rest/api/3/users/search

**Get all users**

Returns a list of all users, including active users, inactive users and previously deleted users that have an Atlassian account.

Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return. |
| `maxResults` | query | integer | No | The maximum number of items to return (limited to  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/users/search"
```

---
