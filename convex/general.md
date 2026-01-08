---
created: 2026-01-08
tags: [type/api-reference, api/general]
api_name: Convex Management API
category: general
endpoint_count: 9
---

# Convex Management API - General

[[README|Back to Overview]]

---

## POST /teams/{team_id}/create_project

**Create project**

Create a new project on a team and provision a dev or prod deployment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `team_id` | path | string | Yes | Team ID |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.convex.dev/v1/teams/{team_id}/create_project"
```

---

## GET /teams/{team_id}/list_projects

**List projects**

List all projects for a team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `team_id` | path | string | Yes | Team ID |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.convex.dev/v1/teams/{team_id}/list_projects"
```

---

## GET /projects/{project_id}/list_deployments

**List deployments**

List deployments for a projects.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | Project ID |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.convex.dev/v1/projects/{project_id}/list_deployments"
```

---

## POST /projects/{project_id}/delete

**Delete project**

Delete a project. Deletes all deployments in the project as well.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `project_id` | path | string | Yes | Project ID |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.convex.dev/v1/projects/{project_id}/delete"
```

---

## POST /deployments/{deployment_name}/create_deploy_key

**Create deploy key**

Create a deploy key like "dev:happy-animal-123|ey..." which can be
used with the Convex CLI to develop against or deploy code.

When access to the deployment is granted through an OAuth token this
deploy key will use the same OAuth-granted token.

When access to the deployment is granted any other way a new token will be
created which grants access only to this deployment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deployment_name` | path | string | Yes | Deployment name |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.convex.dev/v1/deployments/{deployment_name}/create_deploy_key"
```

---

## GET /token_details

**Get token details**

Returns the team ID for team tokens.
Especially useful after receiving a team token from an OAuth flow
since most endpoints require team ID.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.convex.dev/v1/token_details"
```

---

## POST /deployments/{deployment_name}/create_custom_domain

**Create custom domain**

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deployment_name` | path | string | Yes | Deployment name |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.convex.dev/v1/deployments/{deployment_name}/create_custom_domain"
```

---

## POST /deployments/{deployment_name}/delete_custom_domain

**Delete custom domain**

Remove a custom domain from a deployment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deployment_name` | path | string | Yes | Deployment name |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.convex.dev/v1/deployments/{deployment_name}/delete_custom_domain"
```

---

## GET /deployments/{deployment_name}/custom_domains

**List custom domains**

Get all custom domains configured for a deployment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deployment_name` | path | string | Yes | Deployment name |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.convex.dev/v1/deployments/{deployment_name}/custom_domains"
```

---
