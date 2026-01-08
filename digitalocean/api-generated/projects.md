---
created: 2026-01-08
tags: [type/api-reference, api/projects]
api_name: DigitalOcean API
category: Projects
endpoint_count: 9
---

# DigitalOcean API - Projects

[[README|Back to Overview]]

---

## GET /v2/projects

**List All Projects**

To list all your projects, send a GET request to `/v2/projects`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/projects"
```

---

## POST /v2/projects

**Create a Project**

To create a project, send a POST request to `/v2/projects`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/projects"
```

---

## GET /v2/projects/default

**Retrieve the Default Project**

To get your default project, send a GET request to `/v2/projects/default`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/projects/default"
```

---

## PUT /v2/projects/default

**Update the Default Project**

To update you default project, send a PUT request to `/v2/projects/default`. All of the following attributes must be sent.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/projects/default"
```

---

## PATCH /v2/projects/default

**Patch the Default Project**

To update only specific attributes of your default project, send a PATCH request to `/v2/projects/default`. At least one of the following attributes needs to be sent.

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/projects/default"
```

---

## GET /v2/projects/{project_id}

**Retrieve an Existing Project**

To get a project, send a GET request to `/v2/projects/$PROJECT_ID`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/projects/{project_id}"
```

---

## PUT /v2/projects/{project_id}

**Update a Project**

To update a project, send a PUT request to `/v2/projects/$PROJECT_ID`. All of the following attributes must be sent.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/projects/{project_id}"
```

---

## PATCH /v2/projects/{project_id}

**Patch a Project**

To update only specific attributes of a project, send a PATCH request to `/v2/projects/$PROJECT_ID`. At least one of the following attributes needs to be sent.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/projects/{project_id}"
```

---

## DELETE /v2/projects/{project_id}

**Delete an Existing Project**

To delete a project, send a DELETE request to `/v2/projects/$PROJECT_ID`. To
be deleted, a project must not have any resources assigned to it. Any existing
resources must first be reassigned or destroyed, or you will receive a 412 error.

A successful request will receive a 204 status code with no body in response.
This indicates that the request was processed successfully.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/projects/{project_id}"
```

---
