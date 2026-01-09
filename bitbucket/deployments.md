---
created: 2026-01-09
tags: [type/api-reference, api/deployments]
api_name: Bitbucket API
category: Deployments
endpoint_count: 16
---

# Bitbucket API - Deployments

[[README|Back to Overview]]

---

## GET /repositories/{workspace}/{repo_slug}/deploy-keys

**List repository deploy keys**

Returns all deploy-keys belonging to a repository.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/deploy-keys"
```

---

## POST /repositories/{workspace}/{repo_slug}/deploy-keys

**Add a repository deploy key**

Create a new deploy key in a repository. Note: If authenticating a deploy key
with an OAuth consumer, any changes to the OAuth consumer will subsequently
invalidate the deploy key.


Example:
```
$ curl -X POST \
-H "Authorization <auth header>" \
-H "Content-type: application/json" \
https://api.bitbucket.org/2.0/repositories/mleu/test/deploy-keys -d \
'{
    "key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAK/b1cHHDr/TEV1JGQl+WjCwStKG6Bhrv0rFpEsYlyTBm1fzN0VOJJYn4ZOPCPJwqse6fGbXntEs+BbXiptR+++HycVgl65TMR0b5ul5AgwrVdZdT7qjCOCgaSV74/9xlHDK8oqgGnfA7ZoBBU+qpVyaloSjBdJfLtPY/xqj4yHnXKYzrtn/uFc4Kp9Tb7PUg9Io3qohSTGJGVHnsVblq/rToJG7L5xIo0OxK0SJSQ5vuId93ZuFZrCNMXj8JDHZeSEtjJzpRCBEXHxpOPhAcbm4MzULgkFHhAVgp4JbkrT99/wpvZ7r9AdkTg7HGqL3rlaDrEcWfL7Lu6TnhBdq5 mleu@C02W454JHTD8",
    "label": "mydeploykey"
}'
```

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/deploy-keys"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/deploy-keys/{key_id}

**Delete a repository deploy key**

This deletes a deploy key from a repository.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/deploy-keys/{key_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/deploy-keys/{key_id}

**Get a repository deploy key**

Returns the deploy key belonging to a specific key.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/deploy-keys/{key_id}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/deploy-keys/{key_id}

**Update a repository deploy key**

Create a new deploy key in a repository.

The same key needs to be passed in but the comment and label can change.

Example:
```
$ curl -X PUT \
-H "Authorization <auth header>" \
-H "Content-type: application/json" \
https://api.bitbucket.org/2.0/repositories/mleu/test/deploy-keys/1234 -d \
'{
    "label": "newlabel",
    "key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAK/b1cHHDr/TEV1JGQl+WjCwStKG6Bhrv0rFpEsYlyTBm1fzN0VOJJYn4ZOPCPJwqse6fGbXntEs+BbXiptR+++HycVgl65TMR0b5ul5AgwrVdZdT7qjCOCgaSV74/9xlHDK8oqgGnfA7ZoBBU+qpVyaloSjBdJfLtPY/xqj4yHnXKYzrtn/uFc4Kp9Tb7PUg9Io3qohSTGJGVHnsVblq/rToJG7L5xIo0OxK0SJSQ5vuId93ZuFZrCNMXj8JDHZeSEtjJzpRCBEXHxpOPhAcbm4MzULgkFHhAVgp4JbkrT99/wpvZ7r9AdkTg7HGqL3rlaDrEcWfL7Lu6TnhBdq5 newcomment",
}'
```

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/deploy-keys/{key_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/deployments

**List deployments**

Find deployments

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/deployments"
```

---

## GET /repositories/{workspace}/{repo_slug}/deployments/{deployment_uuid}

**Get a deployment**

Retrieve a deployment

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `deployment_uuid` | path | string | Yes | The deployment UUID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/deployments/{deployment_uuid}"
```

---

## GET /repositories/{workspace}/{repo_slug}/environments

**List environments**

Find environments

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/environments"
```

---

## POST /repositories/{workspace}/{repo_slug}/environments

**Create an environment**

Create an environment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `_body` | body | string | Yes | The environment to create. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/environments"
```

---

## GET /repositories/{workspace}/{repo_slug}/environments/{environment_uuid}

**Get an environment**

Retrieve an environment

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `environment_uuid` | path | string | Yes | The environment UUID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/environments/{environment_uuid}"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/environments/{environment_uuid}

**Delete an environment**

Delete an environment

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `environment_uuid` | path | string | Yes | The environment UUID. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/environments/{environment_uuid}"
```

---

## POST /repositories/{workspace}/{repo_slug}/environments/{environment_uuid}/changes

**Update an environment**

Update an environment

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `environment_uuid` | path | string | Yes | The environment UUID. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/environments/{environment_uuid}/changes"
```

---

## GET /workspaces/{workspace}/projects/{project_key}/deploy-keys

**List project deploy keys**

Returns all deploy keys belonging to a project.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/deploy-keys"
```

---

## POST /workspaces/{workspace}/projects/{project_key}/deploy-keys

**Create a project deploy key**

Create a new deploy key in a project.

Example:
```
$ curl -X POST \
-H "Authorization <auth header>" \
-H "Content-type: application/json" \
https://api.bitbucket.org/2.0/workspaces/standard/projects/TEST_PROJECT/deploy-keys/ -d \
'{
    "key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAK/b1cHHDr/TEV1JGQl+WjCwStKG6Bhrv0rFpEsYlyTBm1fzN0VOJJYn4ZOPCPJwqse6fGbXntEs+BbXiptR+++HycVgl65TMR0b5ul5AgwrVdZdT7qjCOCgaSV74/9xlHDK8oqgGnfA7ZoBBU+qpVyaloSjBdJfLtPY/xqj4yHnXKYzrtn/uFc4Kp9Tb7PUg9Io3qohSTGJGVHnsVblq/rToJG7L5xIo0OxK0SJSQ5vuId93ZuFZrCNMXj8JDHZeSEtjJzpRCBEXHxpOPhAcbm4MzULgkFHhAVgp4JbkrT99/wpvZ7r9AdkTg7HGqL3rlaDrEcWfL7Lu6TnhBdq5 mleu@C02W454JHTD8",
    "label": "mydeploykey"
}'
```

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/deploy-keys"
```

---

## DELETE /workspaces/{workspace}/projects/{project_key}/deploy-keys/{key_id}

**Delete a deploy key from a project**

This deletes a deploy key from a project.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/deploy-keys/{key_id}"
```

---

## GET /workspaces/{workspace}/projects/{project_key}/deploy-keys/{key_id}

**Get a project deploy key**

Returns the deploy key belonging to a specific key ID.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/deploy-keys/{key_id}"
```

---
