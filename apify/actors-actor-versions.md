---
created: 2026-01-09
tags: [type/api-reference, api/actors/actor-versions]
api_name: Apify API
category: Actors/Actor versions
endpoint_count: 10
---

# Apify API - Actors/Actor Versions

[[README|Back to Overview]]

---

## GET /v2/acts/{actorId}/versions

**Get list of versions**

Gets the list of versions of a specific Actor. The response is a JSON object
with the list of [Version objects](#/reference/actors/version-object), where each
contains basic information about a single version.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/versions"
```

---

## POST /v2/acts/{actorId}/versions

**Create version**

Creates a version of an Actor using values specified in a [Version
object](#/reference/actors/version-object) passed as JSON in the POST
payload.

The request must specify `versionNumber` and `sourceType` parameters (as
strings) in the JSON payload and a `Content-Type: application/json` HTTP
header.

Each `sourceType` requires its own additional properties to be passed to the
JSON payload object. These are outlined in the [Version
object](#/reference/actors/version-object) table below and in more detail in
the [Apify
documentation](https://docs.apify.com/platform/actors/development/deployment/source-types).

For example, if an Actor's source code is stored in a [GitHub
repository](https://docs.apify.com/platform/actors/development/deployment/source-types#git-repository),
you will set the `sourceType` to `GIT_REPO` and pass the repository's URL in
the `gitRepoUrl` property.

```
{
    "versionNumber": "0.1",
    "sourceType": "GIT_REPO",
    "gitRepoUrl": "https://github.com/my-github-account/actor-repo"
}
```

The response is the [Version object](#/reference/actors/version-object) as
returned by the [Get version](#/reference/actors/version-object/get-version) endpoint.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/versions"
```

---

## GET /v2/acts/{actorId}/versions/{versionNumber}

**Get version**

Gets a [Version object](#/reference/actors/version-object) that contains all the details about a specific version of an Actor.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `versionNumber` | path | string | Yes | Actor major and minor version of the Actor. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/versions/{versionNumber}"
```

---

## PUT /v2/acts/{actorId}/versions/{versionNumber}

**Update version**

Updates Actor version using values specified by a [Version object](#/reference/actors/version-object) passed as JSON in the POST payload.

If the object does not define a specific property, its value will not be
updated.

The request needs to specify the `Content-Type: application/json` HTTP
header!

When providing your API authentication token, we recommend using the
request's `Authorization` header, rather than the URL. ([More
info](#/introduction/authentication)).

The response is the [Version object](#/reference/actors/version-object) as
returned by the [Get version](#/reference/actors/version-object/get-version) endpoint.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `versionNumber` | path | string | Yes | Actor major and minor version of the Actor. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/versions/{versionNumber}"
```

---

## DELETE /v2/acts/{actorId}/versions/{versionNumber}

**Delete version**

Deletes a specific version of Actor's source code.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `versionNumber` | path | string | Yes | Actor major and minor version of the Actor. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/versions/{versionNumber}"
```

---

## GET /v2/acts/{actorId}/versions/{versionNumber}/env-vars

**Get list of environment variables**

Gets the list of environment variables for a specific version of an Actor.
The response is a JSON object with the list of [EnvVar objects](#/reference/actors/environment-variable-object), where each contains basic information about a single environment variable.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `versionNumber` | path | string | Yes | Actor version |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/versions/{versionNumber}/env-vars"
```

---

## POST /v2/acts/{actorId}/versions/{versionNumber}/env-vars

**Create environment variable**

Creates an environment variable of an Actor using values specified in a
[EnvVar object](#/reference/actors/environment-variable-object) passed as
JSON in the POST payload.

The request must specify `name` and `value` parameters (as strings) in the
JSON payload and a `Content-Type: application/json` HTTP header.

```
{
    "name": "ENV_VAR_NAME",
    "value": "my-env-var"
}
```

The response is the [EnvVar
object](#/reference/actors/environment-variable-object) as returned by the [Get environment
variable](#/reference/actors/environment-variable-object/get-environment-variable)
endpoint.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `versionNumber` | path | string | Yes | Actor version |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/versions/{versionNumber}/env-vars"
```

---

## GET /v2/acts/{actorId}/versions/{versionNumber}/env-vars/{envVarName}

**Get environment variable**

Gets a [EnvVar object](#/reference/actors/environment-variable-object) that
contains all the details about a specific environment variable of an Actor.

If `isSecret` is set to `true`, then `value` will never be returned.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `versionNumber` | path | string | Yes | Actor version |
| `envVarName` | path | string | Yes | The name of the environment variable |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/versions/{versionNumber}/env-vars/{envVarName}"
```

---

## PUT /v2/acts/{actorId}/versions/{versionNumber}/env-vars/{envVarName}

**Update environment variable**

Updates Actor environment variable using values specified by a [EnvVar
object](#/reference/actors/environment-variable-object)
passed as JSON in the POST payload.
If the object does not define a specific property, its value will not be
updated.

The request needs to specify the `Content-Type: application/json` HTTP
header!

When providing your API authentication token, we recommend using the
request's `Authorization` header, rather than the URL. ([More
info](#/introduction/authentication)).

The response is the [EnvVar object](#/reference/actors/environment-variable-object) as returned by the
[Get environment variable](#/reference/actors/environment-variable-object/get-environment-variable)
endpoint.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `versionNumber` | path | string | Yes | Actor version |
| `envVarName` | path | string | Yes | The name of the environment variable |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/versions/{versionNumber}/env-vars/{envVarName}"
```

---

## DELETE /v2/acts/{actorId}/versions/{versionNumber}/env-vars/{envVarName}

**Delete environment variable**

Deletes a specific environment variable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `versionNumber` | path | string | Yes | Actor version |
| `envVarName` | path | string | Yes | The name of the environment variable |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/versions/{versionNumber}/env-vars/{envVarName}"
```

---
