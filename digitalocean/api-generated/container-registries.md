---
created: 2026-01-08
tags: [type/api-reference, api/container-registries]
api_name: DigitalOcean API
category: Container Registries
endpoint_count: 19
---

# DigitalOcean API - Container Registries

[[README|Back to Overview]]

---

## GET /v2/registries

**[Public Preview] List All Container Registries**

To get information about any container registry in your account, send a GET request to `/v2/registries/`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries"
```

---

## POST /v2/registries

**[Public Preview] Create Container Registry**

To create your container registry, send a POST request to `/v2/registries`.

The `name` becomes part of the URL for images stored in the registry. For
example, if your registry is called `example`, an image in it will have the
URL `registry.digitalocean.com/example/image:tag`.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries"
```

---

## GET /v2/registries/{registry_name}

**[Public Preview] Get a Container Registry By Name**

To get information about any container registry in your account, send a GET request to `/v2/registries/{registry_name}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/{registry_name}"
```

---

## DELETE /v2/registries/{registry_name}

**[Public Preview] Delete Container Registry By Name**

To delete your container registry, destroying all container image data stored in it, send a DELETE request to `/v2/registries/{registry_name}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/{registry_name}"
```

---

## GET /v2/registries/{registry_name}/docker-credentials

**[Public Preview] Get Docker Credentials By Registry Name**

In order to access your container registry with the Docker client or from a
Kubernetes cluster, you will need to configure authentication. The necessary
JSON configuration can be retrieved by sending a GET request to
`/v2/registries/{registry_name}/docker-credentials`.

The response will be in the format of a Docker `config.json` file. To use the
config in your Kubernetes cluster, create a Secret with:

    kubectl create secret generic docr \
      --from-file=.dockerconfigjson=config.json \
      --type=kubernetes.io/dockerconfigjson

By default, the returned credentials have read-only access to your registry
and cannot be used to push images. This is appropriate for most Kubernetes
clusters. To retrieve read/write credentials, suitable for use with the Docker
client or in a CI system, read_write may be provided as query parameter. For
example: `/v2/registries/{registry_name}/docker-credentials?read_write=true`

By default, the returned credentials will not expire. To retrieve credentials
with an expiry set, expiry_seconds may be provided as a query parameter. For
example: `/v2/registries/{registry_name}/docker-credentials?expiry_seconds=3600` will return
credentials that expire after one hour.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/{registry_name}/docker-credentials"
```

---

## GET /v2/registries/subscription

**[Public Preview] Get Subscription Information**

A subscription is automatically created when you configure your container registry. To get information about your subscription, send a GET request to `/v2/registries/subscription`. It is similar to GET `/v2/registry/subscription` and exists for backward compatibility.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/subscription"
```

---

## POST /v2/registries/subscription

**[Public Preview] Update Subscription Tier**

After creating your registry, you can switch to a different subscription tier to better suit your needs. To do this, send a POST request to `/v2/registries/subscription`. It is similar to POST `/v2/registry/subscription` and exists for backward compatibility.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/subscription"
```

---

## GET /v2/registries/options

**[Public Preview] List Registry Options (Subscription Tiers and Available Regions)**

This endpoint serves to provide additional information as to which option values are available when creating a container registry.
There are multiple subscription tiers available for container registry. Each tier allows a different number of image repositories to be created in your registry, and has a different amount of storage and transfer included.
There are multiple regions available for container registry and controls where your data is stored.
To list the available options, send a GET request to `/v2/registries/options`. This is similar to GET `/v2/registry/options` and exists for backward compatibility.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/options"
```

---

## GET /v2/registries/{registry_name}/garbage-collection

**[Public Preview] Get Active Garbage Collection**

To get information about the currently-active garbage collection for a registry, send a GET request to `/v2/registry/$REGISTRY_NAME/garbage-collection`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/{registry_name}/garbage-collection"
```

---

## POST /v2/registries/{registry_name}/garbage-collection

**[Public Preview] Start Garbage Collection**

Garbage collection enables users to clear out unreferenced blobs (layer &
manifest data) after deleting one or more manifests from a repository. If
there are no unreferenced blobs resulting from the deletion of one or more
manifests, garbage collection is effectively a noop.
[See here for more information](https://docs.digitalocean.com/products/container-registry/how-to/clean-up-container-registry/)
about how and why you should clean up your container registry periodically.

To request a garbage collection run on your registry, send a POST request to
`/v2/registries/$REGISTRY_NAME/garbage-collection`. This will initiate the
following sequence of events on your registry.

* Set the registry to read-only mode, meaning no further write-scoped
  JWTs will be issued to registry clients. Existing write-scoped JWTs will
  continue to work until they expire which can take up to 15 minutes.
* Wait until all existing write-scoped JWTs have expired.
* Scan all registry manifests to determine which blobs are unreferenced.
* Delete all unreferenced blobs from the registry.
* Record the number of blobs deleted and bytes freed, mark the garbage
  collection status as `success`.
* Remove the read-only mode restriction from the registry, meaning write-scoped
  JWTs will once again be issued to registry clients.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/{registry_name}/garbage-collection"
```

---

## GET /v2/registries/{registry_name}/garbage-collections

**[Public Preview] List Garbage Collections**

To get information about past garbage collections for a registry, send a GET request to `/v2/registry/$REGISTRY_NAME/garbage-collections`.

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
  "https://api.digitalocean.com/v2/registries/{registry_name}/garbage-collections"
```

---

## PUT /v2/registries/{registry_name}/garbage-collection/{garbage_collection_uuid}

**[Public Preview] Update Garbage Collection**

To cancel the currently-active garbage collection for a registry, send a PUT request to `/v2/registries/$REGISTRY_NAME/garbage-collection/$GC_UUID` and specify one or more of the attributes below. It is similar to PUT `/v2/registries/$REGISTRY_NAME/garbage-collection/$GC_UUID` and exists for backward compatibility.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/{registry_name}/garbage-collection/{garbage_collection_uuid}"
```

---

## GET /v2/registries/{registry_name}/repositoriesV2

**[Public Preview] List All Container Registry Repositories (V2)**

To list all repositories in your container registry, send a GET request to `/v2/registries/$REGISTRY_NAME/repositoriesV2`. It is similar to GET `/v2/registry/$REGISTRY_NAME/repositoriesV2` and exists for backward compatibility.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/{registry_name}/repositoriesV2"
```

---

## DELETE /v2/registries/{registry_name}/repositories/{repository_name}

**[Public Preview] Delete Container Registry Repository**

To delete a container repository including all of its tags, send a DELETE request to
`/v2/registries/$REGISTRY_NAME/repositories/$REPOSITORY_NAME`.

A successful request will receive a 204 status code with no body in response.
This indicates that the request was processed successfully.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/{registry_name}/repositories/{repository_name}"
```

---

## GET /v2/registries/{registry_name}/repositories/{repository_name}/tags

**[Public Preview] List All Container Registry Repository Tags**

To list all tags in one of your container registry's repository, send a GET
request to `/v2/registries/$REGISTRY_NAME/repositories/$REPOSITORY_NAME/tags`.

Note that if your repository name contains `/` characters, it must be
URL-encoded in the request URL. For example, to list tags for
`registry.digitalocean.com/example/my/repo`, the path would be
`/v2/registry/example/repositories/my%2Frepo/tags`. 

It is similar to GET `/v2/registry/$REGISTRY_NAME/repositories/$REPOSITORY_NAME/tags` and exists for backward compatibility.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/{registry_name}/repositories/{repository_name}/tags"
```

---

## DELETE /v2/registries/{registry_name}/repositories/{repository_name}/tags/{repository_tag}

**[Public Preview] Delete Container Registry Repository Tag**

To delete a container repository tag in on of our container registries, send a DELETE request to
`/v2/registries/$REGISTRY_NAME/repositories/$REPOSITORY_NAME/tags/$TAG`.

Note that if your repository name contains `/` characters, it must be
URL-encoded in the request URL. For example, to delete
`registry.digitalocean.com/example/my/repo:mytag`, the path would be
`/v2/registry/example/repositories/my%2Frepo/tags/mytag`.

A successful request will receive a 204 status code with no body in response.
This indicates that the request was processed successfully. It is similar to DELETE `/v2/registry/$REGISTRY_NAME/repositories/$REPOSITORY_NAME/tags/$TAG` and exists for backward compatibility.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/{registry_name}/repositories/{repository_name}/tags/{repository_tag}"
```

---

## GET /v2/registries/{registry_name}/repositories/{repository_name}/digests

**[Public Preview] List All Container Registry Repository Manifests**

To list all manifests in your container registry repository, send a GET
request to `/v2/registries/$REGISTRY_NAME/repositories/$REPOSITORY_NAME/digests`.

Note that if your repository name contains `/` characters, it must be
URL-encoded in the request URL. For example, to list manifests for
`registry.digitalocean.com/example/my/repo`, the path would be
`/v2/registry/example/repositories/my%2Frepo/digests`.

It is similar to `/v2/registry/$REGISTRY_NAME/repositories/$REPOSITORY_NAME/digests` and exists for backward compatibility.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/{registry_name}/repositories/{repository_name}/digests"
```

---

## DELETE /v2/registries/{registry_name}/repositories/{repository_name}/digests/{manifest_digest}

**[Public Preview] Delete Container Registry Repository Manifest**

To delete a container repository manifest by digest in one of your registries, send a DELETE request to
`/v2/registries/$REGISTRY_NAME/repositories/$REPOSITORY_NAME/digests/$MANIFEST_DIGEST`.

Note that if your repository name contains `/` characters, it must be
URL-encoded in the request URL. For example, to delete
`registry.digitalocean.com/example/my/repo@sha256:abcd`, the path would be
`/v2/registry/example/repositories/my%2Frepo/digests/sha256:abcd`.

A successful request will receive a 204 status code with no body in response.
This indicates that the request was processed successfully.

It is similar to DELETE `/v2/registry/$REGISTRY_NAME/repositories/$REPOSITORY_NAME/digests/$MANIFEST_DIGEST` and exists for backward compatibility.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/{registry_name}/repositories/{repository_name}/digests/{manifest_digest}"
```

---

## POST /v2/registries/validate-name

**[Public Preview] Validate a Container Registry Name**

To validate that a container registry name is available for use, send a POST
request to `/v2/registries/validate-name`.

If the name is both formatted correctly and available, the response code will
be 204 and contain no body. If the name is already in use, the response will
be a 409 Conflict. 

It is similar to `/v2/registry/validate-name` and exists for backward compatibility.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/registries/validate-name"
```

---
