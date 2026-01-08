---
created: 2026-01-08
tags: [type/api-reference, api/projects]
api_name: Vercel API
category: projects
endpoint_count: 26
---

# Vercel API - Projects

[[README|Back to Overview]]

---

## PATCH /v1/data-cache/projects/{projectId}

**Update the data cache feature**

Update the data cache feature on a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | path | string | Yes | The unique project identifier |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/data-cache/projects/{projectId}"
```

---

## GET /v10/projects

**Retrieve a list of projects**

Allows to retrieve the list of projects of the authenticated user or team. The list will be paginated and the provided query parameters allow filtering the returned projects.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `from` | query | string | No | Query only projects updated after the given timest |
| `gitForkProtection` | query | string | No | Specifies whether PRs from Git forks should requir |
| `limit` | query | string | No | Limit the number of projects returned |
| `search` | query | string | No | Search projects by the name field |
| `repo` | query | string | No | Filter results by repo. Also used for project coun |
| `repoId` | query | string | No | Filter results by Repository ID. |
| `repoUrl` | query | string | No | Filter results by Repository URL. |
| `excludeRepos` | query | string | No | Filter results by excluding those projects that be |
| `edgeConfigId` | query | string | No | Filter results by connected Edge Config ID |
| `edgeConfigTokenId` | query | string | No | Filter results by connected Edge Config Token ID |
| `deprecated` | query | boolean | No |  |
| `elasticConcurrencyEnabled` | query | string | No | Filter results by projects with elastic concurrenc |
| `staticIpsEnabled` | query | string | No | Filter results by projects with Static IPs enabled |
| `buildMachineTypes` | query | string | No | Filter results by build machine types. Accepts com |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v10/projects"
```

---

## POST /v11/projects

**Create a new project**

Allows to create a new project with the provided configuration. It only requires the project `name` but more configuration can be provided to override the defaults.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v11/projects"
```

---

## GET /v9/projects/{idOrName}

**Find a project by id or name**

Get the information for a specific project by passing either the project `id` or `name` in the URL.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}"
```

---

## PATCH /v9/projects/{idOrName}

**Update an existing project**

Update the fields of a project using either its `name` or `id`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}"
```

---

## DELETE /v9/projects/{idOrName}

**Delete a Project**

Delete a specific project by passing either the project `id` or `name` in the URL.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}"
```

---

## GET /v9/projects/{idOrName}/domains

**Retrieve project domains by project by id or name**

Retrieve the domains associated with a given project by passing either the project `id` or `name` in the URL.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `production` | query | string | No | Filters only production domains when set to `true` |
| `target` | query | string | No | Filters on the target of the domain. Can be either |
| `customEnvironmentId` | query | string | No | The unique custom environment identifier within th |
| `gitBranch` | query | string | No | Filters domains based on specific branch. |
| `redirects` | query | string | No | Excludes redirect project domains when \"false\".  |
| `redirect` | query | string | No | Filters domains based on their redirect target. |
| `verified` | query | string | No | Filters domains based on their verification status |
| `limit` | query | number | No | Maximum number of domains to list from a request ( |
| `since` | query | number | No | Get domains created after this JavaScript timestam |
| `until` | query | number | No | Get domains created before this JavaScript timesta |
| `order` | query | string | No | Domains sort order by createdAt |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}/domains"
```

---

## GET /v9/projects/{idOrName}/domains/{domain}

**Get a project domain**

Get project domain by project id/name and domain name.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `domain` | path | string | Yes | The project domain name |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}/domains/{domain}"
```

---

## PATCH /v9/projects/{idOrName}/domains/{domain}

**Update a project domain**

Update a project domain's configuration, including the name, git branch and redirect of the domain.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `domain` | path | string | Yes | The project domain name |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}/domains/{domain}"
```

---

## DELETE /v9/projects/{idOrName}/domains/{domain}

**Remove a domain from a project**

Remove a domain from a project by passing the domain name and by specifying the project by either passing the project `id` or `name` in the URL.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `domain` | path | string | Yes | The project domain name |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}/domains/{domain}"
```

---

## POST /v10/projects/{idOrName}/domains

**Add a domain to a project**

Add a domain to the project by passing its domain name and by specifying the project by either passing the project `id` or `name` in the URL. If the domain is not yet verified to be used on this project, the request will return `verified = false`, and the domain will need to be verified according to the `verification` challenge via `POST /projects/:idOrName/domains/:domain/verify`. If the domain already exists on the project, the request will fail with a `400` status code.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v10/projects/{idOrName}/domains"
```

---

## POST /v1/projects/{idOrName}/domains/{domain}/move

**Move a project domain**

Move one project's domain to another project. Also allows the move of all redirects pointed to that domain in the same project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `domain` | path | string | Yes | The project domain name |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/domains/{domain}/move"
```

---

## POST /v9/projects/{idOrName}/domains/{domain}/verify

**Verify project domain**

Attempts to verify a project domain with `verified = false` by checking the correctness of the project domain's `verification` challenge.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `domain` | path | string | Yes | The domain name you want to verify |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}/domains/{domain}/verify"
```

---

## GET /v10/projects/{idOrName}/env

**Retrieve the environment variables of a project by id or name**

Retrieve the environment variables for a given project by passing either the project `id` or `name` in the URL.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `gitBranch` | query | string | No | If defined, the git branch of the environment vari |
| `decrypt` | query | string | No | If true, the environment variable value will be de |
| `source` | query | string | No | The source that is calling the endpoint. |
| `customEnvironmentId` | query | string | No | The unique custom environment identifier within th |
| `customEnvironmentSlug` | query | string | No | The custom environment slug (name) within the proj |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v10/projects/{idOrName}/env"
```

---

## POST /v10/projects/{idOrName}/env

**Create one or more environment variables**

Create one or more environment variables for a project by passing its `key`, `value`, `type` and `target` and by specifying the project by either passing the project `id` or `name` in the URL. If you include `upsert=true` as a query parameter, a new environment variable will not be created if it already exists but, the existing variable's value will be updated.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `upsert` | query | string | No | Allow override of environment variable if it alrea |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v10/projects/{idOrName}/env"
```

---

## GET /v1/projects/{idOrName}/env/{id}

**Retrieve the decrypted value of an environment variable of a project by id**

Retrieve the environment variable for a given project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `id` | path | string | Yes | The unique ID for the environment variable to get  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/env/{id}"
```

---

## DELETE /v9/projects/{idOrName}/env/{id}

**Remove an environment variable**

Delete a specific environment variable for a given project by passing the environment variable identifier and either passing the project `id` or `name` in the URL.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `id` | path | string | Yes | The unique environment variable identifier |
| `customEnvironmentId` | query | string | No | The unique custom environment identifier within th |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}/env/{id}"
```

---

## PATCH /v9/projects/{idOrName}/env/{id}

**Edit an environment variable**

Edit a specific environment variable for a given project by passing the environment variable identifier and either passing the project `id` or `name` in the URL.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `id` | path | string | Yes | The unique environment variable identifier |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}/env/{id}"
```

---

## DELETE /v1/projects/{idOrName}/env

**Batch remove environment variables**

Delete multiple environment variables for a given project in a single batch operation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/env"
```

---

## POST /projects/{idOrName}/transfer-request

**Create project transfer request**

Initiates a project transfer request from one team to another. <br/> Returns a `code` that remains valid for 24 hours and can be used to accept the transfer request by another team using the `PUT /projects/transfer-request/:code` endpoint. <br/> Users can also accept the project transfer request using the claim URL: `https://vercel.com/claim-deployment?code=<code>&returnUrl=<returnUrl>`. <br/> The `code` parameter specifies the project transfer request code generated using this endpoint. <br/> The `returnUrl` parameter redirects users to a specific page of the application if the claim URL is invalid or expired.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The ID or name of the project to transfer. |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/projects/{idOrName}/transfer-request"
```

---

## PUT /projects/transfer-request/{code}

**Accept project transfer request**

Accept a project transfer request initated by another team. <br/> The `code` is generated using the `POST /projects/:idOrName/transfer-request` endpoint.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `code` | path | string | Yes | The code of the project transfer request. |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/projects/transfer-request/{code}"
```

---

## PATCH /v1/projects/{idOrName}/protection-bypass

**Update Protection Bypass for Automation**

Update the deployment protection automation bypass for a project

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/protection-bypass"
```

---

## POST /v10/projects/{projectId}/promote/{deploymentId}

**Points all production domains for a project to the given deploy**

Allows users to promote a deployment to production. Note: This does NOT rebuild the deployment. If you need that, then call create-deployments endpoint.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | path | string | Yes |  |
| `deploymentId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v10/projects/{projectId}/promote/{deploymentId}"
```

---

## GET /v1/projects/{projectId}/promote/aliases

**Gets a list of aliases with status for the current promote**

Get a list of aliases related to the last promote request with their mapping status

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | path | string | Yes |  |
| `limit` | query | number | No | Maximum number of aliases to list from a request ( |
| `since` | query | number | No | Get aliases created after this epoch timestamp. |
| `until` | query | number | No | Get aliases created before this epoch timestamp. |
| `failedOnly` | query | boolean | No | Filter results down to aliases that failed to map  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{projectId}/promote/aliases"
```

---

## POST /v1/projects/{projectId}/pause

**Pause a project**

Pause a project by passing its project `id` in the URL. If the project does not exist given the id then the request will fail with 400 status code. If the project disables auto assigning custom production domains and blocks the active Production Deployment then the request will return with 200 status code.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | path | string | Yes | The unique project identifier |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{projectId}/pause"
```

---

## POST /v1/projects/{projectId}/unpause

**Unpause a project**

Unpause a project by passing its project `id` in the URL. If the project does not exist given the id then the request will fail with 400 status code. If the project enables auto assigning custom production domains and unblocks the active Production Deployment then the request will return with 200 status code.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | path | string | Yes | The unique project identifier |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{projectId}/unpause"
```

---
