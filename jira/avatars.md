---
created: 2026-01-09
tags: [type/api-reference, api/avatars]
api_name: The Jira Cloud platform REST API
category: Avatars
endpoint_count: 7
---

# The Jira Cloud platform REST API - Avatars

[[README|Back to Overview]]

---

## GET /rest/api/3/avatar/{type}/system

**Get system avatars by type**

Returns a list of system avatar details by owner type, where the owner types are issue type, project, user or priority.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `type` | path | string | Yes | The avatar type. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/avatar/{type}/system"
```

---

## GET /rest/api/3/universal_avatar/type/{type}/owner/{entityId}

**Get avatars**

Returns the system and custom avatars for a project, issue type or priority.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  for custom project avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project the avatar belongs to.
 *  for custom issue type avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for at least one project the issue type is used in.
 *  for system avatars, none.
 *  for priority avatars, none.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `type` | path | string | Yes | The avatar type. |
| `entityId` | path | string | Yes | The ID of the item the avatar is associated with. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/universal_avatar/type/{type}/owner/{entityId}"
```

---

## POST /rest/api/3/universal_avatar/type/{type}/owner/{entityId}

**Load avatar**

Loads a custom avatar for a project, issue type or priority.

Specify the avatar's local file location in the body of the request. Also, include the following headers:

 *  `X-Atlassian-Token: no-check` To prevent XSRF protection blocking the request, for more information see [Special Headers](#special-request-headers).
 *  `Content-Type: image/image type` Valid image types are JPEG, GIF, or PNG.

For example:  
`curl --request POST `

`--user email@example.com:<api_token> `

`--header 'X-Atlassian-Token: no-check' `

`--header 'Content-Type: image/< image_type>' `

`--data-binary "<@/path/to/file/with/your/avatar>" `

`--url 'https://your-domain.atlassian.net/rest/api/3/universal_avatar/type/{type}/owner/{entityId}'`

The avatar is cropped to a square. If no crop parameters are specified, the square originates at the top left of the image. The length of the square's sides is set to the smaller of the height or width of the image.

The cropped image is then used to create avatars of 16x16, 24x24, 32x32, and 48x48 in size.

After creating the avatar use:

 *  [Update issue type](#api-rest-api-3-issuetype-id-put) to set it as the issue type's displayed avatar.
 *  [Set project avatar](#api-rest-api-3-project-projectIdOrKey-avatar-put) to set it as the project's displayed avatar.
 *  [Update priority](#api-rest-api-3-priority-id-put) to set it as the priority's displayed avatar.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `type` | path | string | Yes | The avatar type. |
| `entityId` | path | string | Yes | The ID of the item the avatar is associated with. |
| `x` | query | integer | No | The X coordinate of the top-left corner of the cro |
| `y` | query | integer | No | The Y coordinate of the top-left corner of the cro |
| `size` | query | integer | Yes | The length of each side of the crop region. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/universal_avatar/type/{type}/owner/{entityId}"
```

---

## DELETE /rest/api/3/universal_avatar/type/{type}/owner/{owningObjectId}/avatar/{id}

**Delete avatar**

Deletes an avatar from a project, issue type or priority.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `type` | path | string | Yes | The avatar type. |
| `owningObjectId` | path | string | Yes | The ID of the item the avatar is associated with. |
| `id` | path | integer | Yes | The ID of the avatar. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/universal_avatar/type/{type}/owner/{owningObjectId}/avatar/{id}"
```

---

## GET /rest/api/3/universal_avatar/view/type/{type}

**Get avatar image by type**

Returns the default project, issue type or priority avatar image.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `type` | path | string | Yes | The icon type of the avatar. |
| `size` | query | string | No | The size of the avatar image. If not provided the  |
| `format` | query | string | No | The format to return the avatar image in. If not p |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/universal_avatar/view/type/{type}"
```

---

## GET /rest/api/3/universal_avatar/view/type/{type}/avatar/{id}

**Get avatar image by ID**

Returns a project, issue type or priority avatar image by ID.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  For system avatars, none.
 *  For custom project avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project the avatar belongs to.
 *  For custom issue type avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for at least one project the issue type is used in.
 *  For priority avatars, none.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `type` | path | string | Yes | The icon type of the avatar. |
| `id` | path | integer | Yes | The ID of the avatar. |
| `size` | query | string | No | The size of the avatar image. If not provided the  |
| `format` | query | string | No | The format to return the avatar image in. If not p |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/universal_avatar/view/type/{type}/avatar/{id}"
```

---

## GET /rest/api/3/universal_avatar/view/type/{type}/owner/{entityId}

**Get avatar image by owner**

Returns the avatar image for a project, issue type or priority.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  For system avatars, none.
 *  For custom project avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project the avatar belongs to.
 *  For custom issue type avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for at least one project the issue type is used in.
 *  For priority avatars, none.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `type` | path | string | Yes | The icon type of the avatar. |
| `entityId` | path | string | Yes | The ID of the project or issue type the avatar bel |
| `size` | query | string | No | The size of the avatar image. If not provided the  |
| `format` | query | string | No | The format to return the avatar image in. If not p |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/universal_avatar/view/type/{type}/owner/{entityId}"
```

---
