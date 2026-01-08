---
created: 2026-01-08
tags: [type/api-reference, api/project-resources]
api_name: DigitalOcean API
category: Project Resources
endpoint_count: 4
---

# DigitalOcean API - Project Resources

[[README|Back to Overview]]

---

## GET /v2/projects/{project_id}/resources

**List Project Resources**

To list all your resources in a project, send a GET request to `/v2/projects/$PROJECT_ID/resources`.

This endpoint will only return resources that you are authorized to see. For example, to see Droplets in a project, include the `droplet:read` scope.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/projects/{project_id}/resources"
```

---

## POST /v2/projects/{project_id}/resources

**Assign Resources to a Project**

To assign resources to a project, send a POST request to `/v2/projects/$PROJECT_ID/resources`.

You must have both `project:update` and `<resource>:read` scopes to assign new resources. For example, to assign a Droplet to a project, include both the `project:update` and `droplet:read` scopes.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/projects/{project_id}/resources"
```

---

## GET /v2/projects/default/resources

**List Default Project Resources**

To list all your resources in your default project, send a GET request to `/v2/projects/default/resources`.

Only resources that you are authorized to see will be returned. For example, to see Droplets in a project, include the `droplet:read` scope.


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/projects/default/resources"
```

---

## POST /v2/projects/default/resources

**Assign Resources to Default Project**

To assign resources to your default project, send a POST request to `/v2/projects/default/resources`.

You must have both project:update and <resource>:read scopes to assign new resources. For example, to assign a Droplet to the default project, include both the `project:update` and `droplet:read` scopes.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/projects/default/resources"
```

---
