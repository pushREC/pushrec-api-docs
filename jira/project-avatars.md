---
created: 2026-01-09
tags: [type/api-reference, api/project-avatars]
api_name: The Jira Cloud platform REST API
category: Project avatars
endpoint_count: 4
---

# The Jira Cloud platform REST API - Project Avatars

[[README|Back to Overview]]

---

## PUT /rest/api/3/project/{projectIdOrKey}/avatar

**Set project avatar**

Sets the avatar displayed for a project.

Use [Load project avatar](#api-rest-api-3-project-projectIdOrKey-avatar2-post) to store avatars against the project, before using this operation to set the displayed avatar.

**[Permissions](#permissions) required:** *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrKey` | path | string | Yes | The ID or (case-sensitive) key of the project. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/avatar"
```

---

## DELETE /rest/api/3/project/{projectIdOrKey}/avatar/{id}

**Delete project avatar**

Deletes a custom avatar from a project. Note that system avatars cannot be deleted.

**[Permissions](#permissions) required:** *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrKey` | path | string | Yes | The project ID or (case-sensitive) key. |
| `id` | path | integer | Yes | The ID of the avatar. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/avatar/{id}"
```

---

## POST /rest/api/3/project/{projectIdOrKey}/avatar2

**Load project avatar**

Loads an avatar for a project.

Specify the avatar's local file location in the body of the request. Also, include the following headers:

 *  `X-Atlassian-Token: no-check` To prevent XSRF protection blocking the request, for more information see [Special Headers](#special-request-headers).
 *  `Content-Type: image/image type` Valid image types are JPEG, GIF, or PNG.

For example:  
`curl --request POST `

`--user email@example.com:<api_token> `

`--header 'X-Atlassian-Token: no-check' `

`--header 'Content-Type: image/< image_type>' `

`--data-binary "<@/path/to/file/with/your/avatar>" `

`--url 'https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/avatar2'`

The avatar is cropped to a square. If no crop parameters are specified, the square originates at the top left of the image. The length of the square's sides is set to the smaller of the height or width of the image.

The cropped image is then used to create avatars of 16x16, 24x24, 32x32, and 48x48 in size.

After creating the avatar use [Set project avatar](#api-rest-api-3-project-projectIdOrKey-avatar-put) to set it as the project's displayed avatar.

**[Permissions](#permissions) required:** *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrKey` | path | string | Yes | The ID or (case-sensitive) key of the project. |
| `x` | query | integer | No | The X coordinate of the top-left corner of the cro |
| `y` | query | integer | No | The Y coordinate of the top-left corner of the cro |
| `size` | query | integer | No | The length of each side of the crop region. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/avatar2"
```

---

## GET /rest/api/3/project/{projectIdOrKey}/avatars

**Get all project avatars**

Returns all project avatars, grouped by system and custom avatars.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrKey` | path | string | Yes | The ID or (case-sensitive) key of the project. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/avatars"
```

---
