---
created: 2026-01-09
tags: [type/api-reference, api/project-templates]
api_name: The Jira Cloud platform REST API
category: Project templates
endpoint_count: 5
---

# The Jira Cloud platform REST API - Project Templates

[[README|Back to Overview]]

---

## POST /rest/api/3/project-template

**Create custom project**

Creates a project based on a custom template provided in the request.

The request body should contain the project details and the capabilities that comprise the project:

 *  `details` \- represents the project details settings
 *  `template` \- represents a list of capabilities responsible for creating specific parts of a project

A capability is defined as a unit of configuration for the project you want to create.

This operation is:

 *  [asynchronous](#async). Follow the `Location` link in the response header to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.

***Note: This API is only supported for Jira Enterprise edition.***

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project-template"
```

---

## PUT /rest/api/3/project-template/edit-template

**Edit a custom project template**

Edit custom template

This API endpoint allows you to edit an existing customised template.

***Note: Custom Templates are only supported for Jira Enterprise edition.***

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project-template/edit-template"
```

---

## GET /rest/api/3/project-template/live-template

**Gets a custom project template**

Get custom template

This API endpoint allows you to get a live custom project template details by either templateKey or projectId

***Note: Custom Templates are only supported for Jira Enterprise edition.***

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | No | optional - The \{@link String\} containing the pro |
| `templateKey` | query | string | No | optional - The \{@link String\} containing the key |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project-template/live-template"
```

---

## DELETE /rest/api/3/project-template/remove-template

**Deletes a custom project template**

Remove custom template

This API endpoint allows you to remove a specified customised template

***Note: Custom Templates are only supported for Jira Enterprise edition.***

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `templateKey` | query | string | Yes | The \{@link String\} containing the key of the cus |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project-template/remove-template"
```

---

## POST /rest/api/3/project-template/save-template

**Save a custom project template**

Save custom template

This API endpoint allows you to save a customised template

***Note: Custom Templates are only supported for Jira Enterprise edition.***

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project-template/save-template"
```

---
