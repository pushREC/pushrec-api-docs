---
created: 2026-01-09
tags: [type/api-reference, api/general]
api_name: Replicate HTTP API
category: general
endpoint_count: 36
---

# Replicate HTTP API - General

[[README|Back to Overview]]

---

## GET /account

**Get the authenticated account**

Returns information about the user or organization associated with the provided API token.

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/account
```

The response will be a JSON object describing the account:

```json
{
  "type": "organization",
  "username": "acme",
  "name": "Acme Corp, Inc.",
  "github_url": "https://github.com/acme",
}
```


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/account"
```

---

## GET /collections

**List collections of models**

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/collections
```

The response will be a paginated JSON list of collection objects:

```json
{
  "next": "null",
  "previous": null,
  "results": [
    {
      "name": "Super resolution",
      "slug": "super-resolution",
      "description": "Upscaling models that create high-quality images from low-quality images."
    }
  ]
}
```


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/collections"
```

---

## GET /collections/{collection_slug}

**Get a collection of models**

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/collections/super-resolution
```

The response will be a collection object with a nested list of the models in that collection:

```json
{
  "name": "Super resolution",
  "slug": "super-resolution",
  "description": "Upscaling models that create high-quality images from low-quality images.",
  "full_description": "## Overview\n\nThese models generate high-quality images from low-quality images. Many of these models are based on **advanced upscaling techniques**.\n\n### Key Features\n\n- Enhance image resolution\n- Restore fine details\n- Improve overall image quality",
  "models": [...]
}
```


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `collection_slug` | path | string | Yes | The slug of the collection, like `super-resolution |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/collections/{collection_slug}"
```

---

## GET /deployments

**List deployments**

Get a list of deployments associated with the current account, including the latest release configuration for each deployment.

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/deployments
```

The response will be a paginated JSON array of deployment objects, sorted with the most recent deployment first:

```json
{
  "next": "http://api.replicate.com/v1/deployments?cursor=cD0yMDIzLTA2LTA2KzIzJTNBNDAlM0EwOC45NjMwMDAlMkIwMCUzQTAw",
  "previous": null,
  "results": [
    {
      "owner": "replicate",
      "name": "my-app-image-generator",
      "current_release": {
        "number": 1,
        "model": "stability-ai/sdxl",
        "version": "da77bc59ee60423279fd632efb4795ab731d9e3ca9705ef3341091fb989b7eaf",
        "created_at": "2024-02-15T16:32:57.018467Z",
        "created_by": {
          "type": "organization",
          "username": "acme",
          "name": "Acme Corp, Inc.",
          "avatar_url": "https://cdn.replicate.com/avatars/acme.png",
          "github_url": "https://github.com/acme"
        },
        "configuration": {
          "hardware": "gpu-t4",
          "min_instances": 1,
          "max_instances": 5
        }
      }
    }
  ]
}
```


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/deployments"
```

---

## POST /deployments

**Create a deployment**

Create a new deployment:

Example cURL request:

```console
curl -s \
  -X POST \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
        "name": "my-app-image-generator",
        "model": "stability-ai/sdxl",
        "version": "da77bc59ee60423279fd632efb4795ab731d9e3ca9705ef3341091fb989b7eaf",
        "hardware": "gpu-t4",
        "min_instances": 0,
        "max_instances": 3
      }' \
  https://api.replicate.com/v1/deployments
```

The response will be a JSON object describing the deployment:

```json
{
  "owner": "acme",
  "name": "my-app-image-generator",
  "current_release": {
    "number": 1,
    "model": "stability-ai/sdxl",
    "version": "da77bc59ee60423279fd632efb4795ab731d9e3ca9705ef3341091fb989b7eaf",
    "created_at": "2024-02-15T16:32:57.018467Z",
    "created_by": {
      "type": "organization",
      "username": "acme",
      "name": "Acme Corp, Inc.",
      "avatar_url": "https://cdn.replicate.com/avatars/acme.png",
      "github_url": "https://github.com/acme"
    },
    "configuration": {
      "hardware": "gpu-t4",
      "min_instances": 1,
      "max_instances": 5
    }
  }
}
```


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/deployments"
```

---

## DELETE /deployments/{deployment_owner}/{deployment_name}

**Delete a deployment**

Delete a deployment

Deployment deletion has some restrictions:

- You can only delete deployments that have been offline and unused for at least 15 minutes.

Example cURL request:

```command
curl -s -X DELETE \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/deployments/acme/my-app-image-generator
```

The response will be an empty 204, indicating the deployment has been deleted.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deployment_owner` | path | string | Yes | The name of the user or organization that owns the |
| `deployment_name` | path | string | Yes | The name of the deployment.
 |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/deployments/{deployment_owner}/{deployment_name}"
```

---

## GET /deployments/{deployment_owner}/{deployment_name}

**Get a deployment**

Get information about a deployment by name including the current release.

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/deployments/replicate/my-app-image-generator
```

The response will be a JSON object describing the deployment:

```json
{
  "owner": "acme",
  "name": "my-app-image-generator",
  "current_release": {
    "number": 1,
    "model": "stability-ai/sdxl",
    "version": "da77bc59ee60423279fd632efb4795ab731d9e3ca9705ef3341091fb989b7eaf",
    "created_at": "2024-02-15T16:32:57.018467Z",
    "created_by": {
      "type": "organization",
      "username": "acme",
      "name": "Acme Corp, Inc.",
      "avatar_url": "https://cdn.replicate.com/avatars/acme.png",
      "github_url": "https://github.com/acme"
    },
    "configuration": {
      "hardware": "gpu-t4",
      "min_instances": 1,
      "max_instances": 5
    }
  }
}
```


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deployment_owner` | path | string | Yes | The name of the user or organization that owns the |
| `deployment_name` | path | string | Yes | The name of the deployment.
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/deployments/{deployment_owner}/{deployment_name}"
```

---

## PATCH /deployments/{deployment_owner}/{deployment_name}

**Update a deployment**

Update properties of an existing deployment, including hardware, min/max instances, and the deployment's underlying model [version](https://replicate.com/docs/how-does-replicate-work#versions).

Example cURL request:

```console
curl -s \
  -X PATCH \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"min_instances": 3, "max_instances": 10}' \
  https://api.replicate.com/v1/deployments/acme/my-app-image-generator
```

The response will be a JSON object describing the deployment:

```json
{
  "owner": "acme",
  "name": "my-app-image-generator",
  "current_release": {
    "number": 2,
    "model": "stability-ai/sdxl",
    "version": "da77bc59ee60423279fd632efb4795ab731d9e3ca9705ef3341091fb989b7eaf",
    "created_at": "2024-02-15T16:32:57.018467Z",
    "created_by": {
      "type": "organization",
      "username": "acme",
      "name": "Acme Corp, Inc.",
      "avatar_url": "https://cdn.replicate.com/avatars/acme.png",
      "github_url": "https://github.com/acme"
    },
    "configuration": {
      "hardware": "gpu-t4",
      "min_instances": 3,
      "max_instances": 10
    }
  }
}
```

Updating any deployment properties will increment the `number` field of the `current_release`.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deployment_owner` | path | string | Yes | The name of the user or organization that owns the |
| `deployment_name` | path | string | Yes | The name of the deployment.
 |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/deployments/{deployment_owner}/{deployment_name}"
```

---

## POST /deployments/{deployment_owner}/{deployment_name}/predictions

**Create a prediction using a deployment**

Create a prediction for the deployment and inputs you provide.

Example cURL request:

```console
curl -s -X POST -H 'Prefer: wait' \
  -d '{"input": {"prompt": "A photo of a bear riding a bicycle over the moon"}}' \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  -H 'Content-Type: application/json' \
  https://api.replicate.com/v1/deployments/acme/my-app-image-generator/predictions
```

The request will wait up to 60 seconds for the model to run. If this time is exceeded the prediction will be returned in a `"starting"` state and need to be retrieved using the `predictions.get` endpoint.

For a complete overview of the `deployments.predictions.create` API check out our documentation on [creating a prediction](https://replicate.com/docs/topics/predictions/create-a-prediction) which covers a variety of use cases.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deployment_owner` | path | string | Yes | The name of the user or organization that owns the |
| `deployment_name` | path | string | Yes | The name of the deployment.
 |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/deployments/{deployment_owner}/{deployment_name}/predictions"
```

---

## GET /files

**List files**

Get a paginated list of all files created by the user or organization associated with the provided API token.

Example cURL request:

```console
curl -s \
  -H "Authorization: Token $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/files
```

The response will be a paginated JSON array of file objects, sorted with the most recent file first.


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/files"
```

---

## POST /files

**Create a file**

Create a file by uploading its content and optional metadata.

Example cURL request:

```console
curl -X POST https://api.replicate.com/v1/files \
  -H "Authorization: Token $REPLICATE_API_TOKEN" \
  -H 'Content-Type: multipart/form-data' \
  -F 'content=@/path/to/archive.zip;type=application/zip;filename=example.zip' \
  -F 'metadata={"customer_reference_id": 123};type=application/json'
```

The request must include:
- `content`: The file content (required)
- `type`: The content / MIME type for the file (defaults to `application/octet-stream`)
- `filename`: The filename (required, ≤ 255 bytes, valid UTF-8)
- `metadata`: User-provided metadata associated with the file (defaults to `{}`, must be valid JSON)


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/files"
```

---

## DELETE /files/{file_id}

**Delete a file**

Delete a file. Once a file has been deleted, subsequent requests to the file resource return 404 Not found.

Example cURL request:

```console
curl -X DELETE \
  -H "Authorization: Token $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/files/cneqzikepnug6xezperrr4z55o
```


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `file_id` | path | string | Yes | The ID of the file to delete |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/files/{file_id}"
```

---

## GET /files/{file_id}

**Get a file**

Get the details of a file.

Example cURL request:

```console
curl -s \
  -H "Authorization: Token $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/files/cneqzikepnug6xezperrr4z55o
```


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `file_id` | path | string | Yes | The ID of the file to get |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/files/{file_id}"
```

---

## GET /files/{file_id}/download

**Download a file**

Download a file by providing the file owner, access expiry, and a valid signature.

Example cURL request:

```console
curl -X GET "https://api.replicate.com/v1/files/cneqzikepnug6xezperrr4z55o/download?expiry=1708515345&owner=mattt&signature=zuoghqlrcnw8YHywkpaXQlHsVhWen%2FDZ4aal76dLiOo%3D"
```


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `file_id` | path | string | Yes | The ID of the file to download |
| `owner` | query | string | Yes | The username of the user or organization that uplo |
| `expiry` | query | integer | Yes | A Unix timestamp with expiration date of this down |
| `signature` | query | string | Yes | A base64-encoded HMAC-SHA256 checksum of the strin |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/files/{file_id}/download"
```

---

## GET /hardware

**List available hardware for models**

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/hardware
```

The response will be a JSON array of hardware objects:

```json
[
    {"name": "CPU", "sku": "cpu"},
    {"name": "Nvidia T4 GPU", "sku": "gpu-t4"},
    {"name": "Nvidia A40 GPU", "sku": "gpu-a40-small"},
    {"name": "Nvidia A40 (Large) GPU", "sku": "gpu-a40-large"},
]
```


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/hardware"
```

---

## GET /models

**List public models**

Get a paginated list of public models.

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/models
```

The response will be a pagination object containing a list of model objects.

See the [`models.get`](#models.get) docs for more details about the model object.

## Sorting

You can sort the results using the `sort_by` and `sort_direction` query parameters.

For example, to get the most recently created models:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  "https://api.replicate.com/v1/models?sort_by=model_created_at&sort_direction=desc"
```

Available sorting options:
- `model_created_at`: Sort by when the model was first created
- `latest_version_created_at`: Sort by when the model's latest version was created (default)

Sort direction can be `asc` (ascending) or `desc` (descending, default).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `sort_by` | query | string | No | Field to sort models by. Defaults to `latest_versi |
| `sort_direction` | query | string | No | Sort direction. Defaults to `desc` (descending, ne |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/models"
```

---

## POST /models

**Create a model**

Create a model.

Example cURL request:

```console
curl -s -X POST \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  -H 'Content-Type: application/json' \
  -d '{"owner": "alice", "name": "hot-dog-detector", "description": "Detect hot dogs in images", "visibility": "public", "hardware": "cpu"}' \
  https://api.replicate.com/v1/models
```

The response will be a model object in the following format:

```json
{
  "url": "https://replicate.com/alice/hot-dog-detector",
  "owner": "alice",
  "name": "hot-dog-detector",
  "description": "Detect hot dogs in images",
  "visibility": "public",
  "github_url": null,
  "paper_url": null,
  "license_url": null,
  "run_count": 0,
  "cover_image_url": null,
  "default_example": null,
  "latest_version": null,
}
```

Note that there is a limit of 1,000 models per account. For most purposes, we recommend using a single model and pushing new [versions](https://replicate.com/docs/how-does-replicate-work#versions) of the model as you make changes to it.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/models"
```

---

## DELETE /models/{model_owner}/{model_name}

**Delete a model**

Delete a model

Model deletion has some restrictions:

- You can only delete models you own.
- You can only delete private models.
- You can only delete models that have no versions associated with them. Currently you'll need to [delete the model's versions](#models.versions.delete) before you can delete the model itself.

Example cURL request:

```command
curl -s -X DELETE \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/models/replicate/hello-world
```

The response will be an empty 204, indicating the model has been deleted.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `model_owner` | path | string | Yes | The name of the user or organization that owns the |
| `model_name` | path | string | Yes | The name of the model.
 |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/models/{model_owner}/{model_name}"
```

---

## GET /models/{model_owner}/{model_name}

**Get a model**

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/models/replicate/hello-world
```

The response will be a model object in the following format:

```json
{
  "url": "https://replicate.com/replicate/hello-world",
  "owner": "replicate",
  "name": "hello-world",
  "description": "A tiny model that says hello",
  "visibility": "public",
  "github_url": "https://github.com/replicate/cog-examples",
  "paper_url": null,
  "license_url": null,
  "run_count": 5681081,
  "cover_image_url": "...",
  "default_example": {...},
  "latest_version": {...},
}
```

The model object includes the [input and output schema](https://replicate.com/docs/reference/openapi#model-schemas) for the latest version of the model.

Here's an example showing how to fetch the model with cURL and display its input schema with [jq](https://stedolan.github.io/jq/):

```console
curl -s \
    -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
    https://api.replicate.com/v1/models/replicate/hello-world \
    | jq ".latest_version.openapi_schema.components.schemas.Input"
```

This will return the following JSON object:

```json
{
  "type": "object",
  "title": "Input",
  "required": [
    "text"
  ],
  "properties": {
    "text": {
      "type": "string",
      "title": "Text",
      "x-order": 0,
      "description": "Text to prefix with 'hello '"
    }
  }
}
``` 

The `cover_image_url` string is an HTTPS URL for an image file. This can be:

- An image uploaded by the model author.
- The output file of the example prediction, if the model author has not set a cover image.
- The input file of the example prediction, if the model author has not set a cover image and the example prediction has no output file.
- A generic fallback image.

The `default_example` object is a [prediction](#predictions.get) created with this model.

The `latest_version` object is the model's most recently pushed [version](#models.versions.get).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `model_owner` | path | string | Yes | The name of the user or organization that owns the |
| `model_name` | path | string | Yes | The name of the model.
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/models/{model_owner}/{model_name}"
```

---

## PATCH /models/{model_owner}/{model_name}

**Update metadata for a model**

Update select properties of an existing model.

You can update the following properties:

  - `description` - Model description
  - `readme` - Model README content
  - `github_url` - GitHub repository URL
  - `paper_url` - Research paper URL
  - `weights_url` - Model weights URL
  - `license_url` - License URL

Example cURL request:

```console
curl -X PATCH \
  https://api.replicate.com/v1/models/your-username/your-model-name \
  -H "Authorization: Token $REPLICATE_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "description": "Detect hot dogs in images",
    "readme": "# Hot Dog Detector\n\n🌭 Ketchup, mustard, and onions...",
    "github_url": "https://github.com/alice/hot-dog-detector",
    "paper_url": "https://arxiv.org/abs/2504.17639",
    "weights_url": "https://huggingface.co/alice/hot-dog-detector",
    "license_url": "https://choosealicense.com/licenses/mit/"
  }'
```

The response will be the updated model object with all of its properties.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `model_owner` | path | string | Yes | The name of the user or organization that owns the |
| `model_name` | path | string | Yes | The name of the model.
 |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/models/{model_owner}/{model_name}"
```

---

## GET /models/{model_owner}/{model_name}/examples

**List examples for a model**

List [example predictions](https://replicate.com/docs/topics/models/publish-a-model#what-are-examples) made using the model.
These are predictions that were saved by the model author as illustrative examples of the model's capabilities.

If you want all the examples for a model, use this operation.

If you just want the model's default example, you can use the [`models.get`](#models.get) operation instead, which includes a `default_example` object.

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/models/replicate/hello-world/examples
```

The response will be a pagination object containing a list of example predictions:

```json
{
  "next": "https://api.replicate.com/v1/models/replicate/hello-world/examples?cursor=...",
  "previous": "https://api.replicate.com/v1/models/replicate/hello-world/examples?cursor=...",
  "results": [...]
}
```

Each item in the `results` list is a [prediction object](#predictions.get).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `model_owner` | path | string | Yes | The name of the user or organization that owns the |
| `model_name` | path | string | Yes | The name of the model.
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/models/{model_owner}/{model_name}/examples"
```

---

## POST /models/{model_owner}/{model_name}/predictions

**Create a prediction using an official model**

Create a prediction using an [official model](https://replicate.com/changelog/2025-01-29-official-models).

If you're _not_ running an official model, use the [`predictions.create`](#predictions.create) operation instead.

Example cURL request:

```console
curl -s -X POST -H 'Prefer: wait' \
  -d '{"input": {"prompt": "Write a short poem about the weather."}}' \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  -H 'Content-Type: application/json' \
  https://api.replicate.com/v1/models/meta/meta-llama-3-70b-instruct/predictions
```

The request will wait up to 60 seconds for the model to run. If this time is exceeded the prediction will be returned in a `"starting"` state and need to be retrieved using the `predictions.get` endpoint.

For a complete overview of the `deployments.predictions.create` API check out our documentation on [creating a prediction](https://replicate.com/docs/topics/predictions/create-a-prediction) which covers a variety of use cases.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `model_owner` | path | string | Yes | The name of the user or organization that owns the |
| `model_name` | path | string | Yes | The name of the model.
 |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/models/{model_owner}/{model_name}/predictions"
```

---

## GET /models/{model_owner}/{model_name}/readme

**Get a model's README**

Get the README content for a model.

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/models/replicate/hello-world/readme
```

The response will be the README content as plain text in Markdown format:

```
# Hello World Model

This is an example model that...
```


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `model_owner` | path | string | Yes | The name of the user or organization that owns the |
| `model_name` | path | string | Yes | The name of the model.
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/models/{model_owner}/{model_name}/readme"
```

---

## GET /models/{model_owner}/{model_name}/versions

**List model versions**

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/models/replicate/hello-world/versions
```

The response will be a JSON array of model version objects, sorted with the most recent version first:

```json
{
  "next": null,
  "previous": null,
  "results": [
    {
      "id": "5c7d5dc6dd8bf75c1acaa8565735e7986bc5b66206b55cca93cb72c9bf15ccaa",
      "created_at": "2022-04-26T19:29:04.418669Z",
      "cog_version": "0.3.0",
      "openapi_schema": {...}
    }
  ]
}
```


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `model_owner` | path | string | Yes | The name of the user or organization that owns the |
| `model_name` | path | string | Yes | The name of the model.
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/models/{model_owner}/{model_name}/versions"
```

---

## DELETE /models/{model_owner}/{model_name}/versions/{version_id}

**Delete a model version**

Delete a model version and all associated predictions, including all output files.

Model version deletion has some restrictions:

- You can only delete versions from models you own.
- You can only delete versions from private models.
- You cannot delete a version if someone other than you has run predictions with it.
- You cannot delete a version if it is being used as the base model for a fine tune/training.
- You cannot delete a version if it has an associated deployment.
- You cannot delete a version if another model version is overridden to use it.

Example cURL request:

```command
curl -s -X DELETE \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/models/replicate/hello-world/versions/5c7d5dc6dd8bf75c1acaa8565735e7986bc5b66206b55cca93cb72c9bf15ccaa
```

The response will be an empty 202, indicating the deletion request has been accepted. It might take a few minutes to be processed.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `model_owner` | path | string | Yes | The name of the user or organization that owns the |
| `model_name` | path | string | Yes | The name of the model.
 |
| `version_id` | path | string | Yes | The ID of the version.
 |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/models/{model_owner}/{model_name}/versions/{version_id}"
```

---

## GET /models/{model_owner}/{model_name}/versions/{version_id}

**Get a model version**

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/models/replicate/hello-world/versions/5c7d5dc6dd8bf75c1acaa8565735e7986bc5b66206b55cca93cb72c9bf15ccaa
```

The response will be the version object:

```json
{
  "id": "5c7d5dc6dd8bf75c1acaa8565735e7986bc5b66206b55cca93cb72c9bf15ccaa",
  "created_at": "2022-04-26T19:29:04.418669Z",
  "cog_version": "0.3.0",
  "openapi_schema": {...}
}
```

Every model describes its inputs and outputs with [OpenAPI Schema Objects](https://spec.openapis.org/oas/latest.html#schemaObject) in the `openapi_schema` property.

The `openapi_schema.components.schemas.Input` property for the [replicate/hello-world](https://replicate.com/replicate/hello-world) model looks like this:

```json
{
  "type": "object",
  "title": "Input",
  "required": [
    "text"
  ],
  "properties": {
    "text": {
      "x-order": 0,
      "type": "string",
      "title": "Text",
      "description": "Text to prefix with 'hello '"
    }
  }
}
```

The `openapi_schema.components.schemas.Output` property for the [replicate/hello-world](https://replicate.com/replicate/hello-world) model looks like this:

```json
{
  "type": "string",
  "title": "Output"
}
```

For more details, see the docs on [Cog's supported input and output types](https://github.com/replicate/cog/blob/75b7802219e7cd4cee845e34c4c22139558615d4/docs/python.md#input-and-output-types)


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `model_owner` | path | string | Yes | The name of the user or organization that owns the |
| `model_name` | path | string | Yes | The name of the model.
 |
| `version_id` | path | string | Yes | The ID of the version.
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/models/{model_owner}/{model_name}/versions/{version_id}"
```

---

## POST /models/{model_owner}/{model_name}/versions/{version_id}/trainings

**Create a training**

Start a new training of the model version you specify.

Example request body:

```json
{
  "destination": "{new_owner}/{new_name}",
  "input": {
    "train_data": "https://example.com/my-input-images.zip",
  },
  "webhook": "https://example.com/my-webhook",
}
```

Example cURL request:

```console
curl -s -X POST \
  -d '{"destination": "{new_owner}/{new_name}", "input": {"input_images": "https://example.com/my-input-images.zip"}}' \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  -H 'Content-Type: application/json' \
  https://api.replicate.com/v1/models/stability-ai/sdxl/versions/da77bc59ee60423279fd632efb4795ab731d9e3ca9705ef3341091fb989b7eaf/trainings
```

The response will be the training object:

```json
{
  "id": "zz4ibbonubfz7carwiefibzgga",
  "model": "stability-ai/sdxl",
  "version": "da77bc59ee60423279fd632efb4795ab731d9e3ca9705ef3341091fb989b7eaf",
  "input": {
    "input_images": "https://example.com/my-input-images.zip"
  },
  "logs": "",
  "error": null,
  "status": "starting",
  "created_at": "2023-09-08T16:32:56.990893084Z",
  "urls": {
    "web": "https://replicate.com/p/zz4ibbonubfz7carwiefibzgga",
     "get": "https://api.replicate.com/v1/predictions/zz4ibbonubfz7carwiefibzgga",
     "cancel": "https://api.replicate.com/v1/predictions/zz4ibbonubfz7carwiefibzgga/cancel"
  }
}
```

As models can take several minutes or more to train, the result will not be available immediately. To get the final result of the training you should either provide a `webhook` HTTPS URL for us to call when the results are ready, or poll the [get a training](#trainings.get) endpoint until it has finished.

When a training completes, it creates a new [version](https://replicate.com/docs/how-does-replicate-work#terminology) of the model at the specified destination.

To find some models to train on, check out the [trainable language models collection](https://replicate.com/collections/trainable-language-models).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `model_owner` | path | string | Yes | The name of the user or organization that owns the |
| `model_name` | path | string | Yes | The name of the model.
 |
| `version_id` | path | string | Yes | The ID of the version.
 |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/models/{model_owner}/{model_name}/versions/{version_id}/trainings"
```

---

## GET /predictions

**List predictions**

Get a paginated list of all predictions created by the user or organization associated with the provided API token.

This will include predictions created from the API and the website. It will return 100 records per page.

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/predictions
```

The response will be a paginated JSON array of prediction objects, sorted with the most recent prediction first:

```json
{
  "next": null,
  "previous": null,
  "results": [
    {
      "completed_at": "2023-09-08T16:19:34.791859Z",
      "created_at": "2023-09-08T16:19:34.907244Z",
      "data_removed": false,
      "error": null,
      "id": "gm3qorzdhgbfurvjtvhg6dckhu",
      "input": {
        "text": "Alice"
      },
      "metrics": {
        "predict_time": 0.012683
      },
      "output": "hello Alice",
      "started_at": "2023-09-08T16:19:34.779176Z",
      "source": "api",
      "status": "succeeded",
      "urls": {
        "web": "https://replicate.com/p/gm3qorzdhgbfurvjtvhg6dckhu",
        "get": "https://api.replicate.com/v1/predictions/gm3qorzdhgbfurvjtvhg6dckhu",
        "cancel": "https://api.replicate.com/v1/predictions/gm3qorzdhgbfurvjtvhg6dckhu/cancel"
      },
      "model": "replicate/hello-world",
      "version": "5c7d5dc6dd8bf75c1acaa8565735e7986bc5b66206b55cca93cb72c9bf15ccaa",
    }
  ]
}
```

`id` will be the unique ID of the prediction.

`source` will indicate how the prediction was created. Possible values are `web` or `api`.

`status` will be the status of the prediction. Refer to [get a single prediction](#predictions.get) for possible values.

`urls` will be a convenience object that can be used to construct new API requests for the given prediction. If the requested model version supports streaming, this will have a `stream` entry with an HTTPS URL that you can use to construct an [`EventSource`](https://developer.mozilla.org/en-US/docs/Web/API/EventSource).

`model` will be the model identifier string in the format of `{model_owner}/{model_name}`.

`version` will be the unique ID of model version used to create the prediction.

`data_removed` will be `true` if the input and output data has been deleted.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `created_after` | query | string | No | Include only predictions created at or after this  |
| `created_before` | query | string | No | Include only predictions created before this date- |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/predictions"
```

---

## POST /predictions

**Create a prediction**

Create a prediction for the model version and inputs you provide.

Example cURL request:

```console
curl -s -X POST -H 'Prefer: wait' \
  -d '{"version": "replicate/hello-world:5c7d5dc6dd8bf75c1acaa8565735e7986bc5b66206b55cca93cb72c9bf15ccaa", "input": {"text": "Alice"}}' \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  -H 'Content-Type: application/json' \
  https://api.replicate.com/v1/predictions
```

The request will wait up to 60 seconds for the model to run. If this time is exceeded the prediction will be returned in a `"starting"` state and need to be retrieved using the `predictions.get` endpoint.

For a complete overview of the `predictions.create` API check out our documentation on [creating a prediction](https://replicate.com/docs/topics/predictions/create-a-prediction) which covers a variety of use cases.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/predictions"
```

---

## GET /predictions/{prediction_id}

**Get a prediction**

Get the current state of a prediction.

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/predictions/gm3qorzdhgbfurvjtvhg6dckhu
```

The response will be the prediction object:

```json
{
  "id": "gm3qorzdhgbfurvjtvhg6dckhu",
  "model": "replicate/hello-world",
  "version": "5c7d5dc6dd8bf75c1acaa8565735e7986bc5b66206b55cca93cb72c9bf15ccaa",
  "input": {
    "text": "Alice"
  },
  "logs": "",
  "output": "hello Alice",
  "error": null,
  "status": "succeeded",
  "created_at": "2023-09-08T16:19:34.765994Z",
  "source": "api",
  "data_removed": false,
  "started_at": "2023-09-08T16:19:34.779176Z",
  "completed_at": "2023-09-08T16:19:34.791859Z",
  "metrics": {
    "predict_time": 0.012683
  },
  "urls": {
    "web": "https://replicate.com/p/gm3qorzdhgbfurvjtvhg6dckhu",
    "get": "https://api.replicate.com/v1/predictions/gm3qorzdhgbfurvjtvhg6dckhu",
    "cancel": "https://api.replicate.com/v1/predictions/gm3qorzdhgbfurvjtvhg6dckhu/cancel"
  }
}
```

`source` will indicate how the prediction was created. Possible values are `web` or `api`.

`status` will be one of:

- `starting`: the prediction is starting up. If this status lasts longer than a few seconds, then it's typically because a new worker is being started to run the prediction.
- `processing`: the `predict()` method of the model is currently running.
- `succeeded`: the prediction completed successfully.
- `failed`: the prediction encountered an error during processing.
- `canceled`: the prediction was canceled by its creator.

In the case of success, `output` will be an object containing the output of the model. Any files will be represented as HTTPS URLs. You'll need to pass the `Authorization` header to request them.

In the case of failure, `error` will contain the error encountered during the prediction.

Terminated predictions (with a status of `succeeded`, `failed`, or `canceled`) will include a `metrics` object with a `predict_time` property showing the amount of CPU or GPU time, in seconds, that the prediction used while running. It won't include time waiting for the prediction to start. The `metrics` object will also include a `total_time` property showing the total time, in seconds, that the prediction took to complete.

All input parameters, output values, and logs are automatically removed after an hour, by default, for predictions created through the API.

You must save a copy of any data or files in the output if you'd like to continue using them. The `output` key will still be present, but it's value will be `null` after the output has been removed.

Output files are served by `replicate.delivery` and its subdomains. If you use an allow list of external domains for your assets, add `replicate.delivery` and `*.replicate.delivery` to it.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `prediction_id` | path | string | Yes | The ID of the prediction to get.
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/predictions/{prediction_id}"
```

---

## POST /predictions/{prediction_id}/cancel

**Cancel a prediction**

Cancel a prediction that is currently running.

Example cURL request that creates a prediction and then cancels it:

```console
# First, create a prediction
PREDICTION_ID=$(curl -s -X POST \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "input": {
      "prompt": "a video that may take a while to generate"
    }
  }' \
  https://api.replicate.com/v1/models/minimax/video-01/predictions | jq -r '.id')

# Echo the prediction ID
echo "Created prediction with ID: $PREDICTION_ID"

# Cancel the prediction
curl -s -X POST \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/predictions/$PREDICTION_ID/cancel
```


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `prediction_id` | path | string | Yes | The ID of the prediction to cancel.
 |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/predictions/{prediction_id}/cancel"
```

---

## GET /search

**Search models, collections, and docs (beta)**

Search for public models, collections, and docs using a text query.

For models, the response includes all model data, plus a new `metadata` object with the following fields:

- `generated_description`: A longer and more detailed AI-generated description of the model
- `tags`: An array of tags for the model
- `score`: A score for the model's relevance to the search query

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  "https://api.replicate.com/v1/search?query=nano+banana"
```

Note: This search API is currently in beta and may change in future versions.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `query` | query | string | Yes | The search query string |
| `limit` | query | integer | No | Maximum number of model results to return (1-50, d |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/search"
```

---

## GET /trainings

**List trainings**

Get a paginated list of all trainings created by the user or organization associated with the provided API token.

This will include trainings created from the API and the website. It will return 100 records per page.

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/trainings
```

The response will be a paginated JSON array of training objects, sorted with the most recent training first:

```json
{
  "next": null,
  "previous": null,
  "results": [
    {
      "completed_at": "2023-09-08T16:41:19.826523Z",
      "created_at": "2023-09-08T16:32:57.018467Z",
      "error": null,
      "id": "zz4ibbonubfz7carwiefibzgga",
      "input": {
        "input_images": "https://example.com/my-input-images.zip"
      },
      "metrics": {
        "predict_time": 502.713876
      },
      "output": {
        "version": "...",
        "weights": "..."
      },
      "started_at": "2023-09-08T16:32:57.112647Z",
      "source": "api",
      "status": "succeeded",
      "urls": {
        "web": "https://replicate.com/p/zz4ibbonubfz7carwiefibzgga",
        "get": "https://api.replicate.com/v1/trainings/zz4ibbonubfz7carwiefibzgga",
        "cancel": "https://api.replicate.com/v1/trainings/zz4ibbonubfz7carwiefibzgga/cancel"
      },
      "model": "stability-ai/sdxl",
      "version": "da77bc59ee60423279fd632efb4795ab731d9e3ca9705ef3341091fb989b7eaf",
    }
  ]
}
```

`id` will be the unique ID of the training.

`source` will indicate how the training was created. Possible values are `web` or `api`.

`status` will be the status of the training. Refer to [get a single training](#trainings.get) for possible values.

`urls` will be a convenience object that can be used to construct new API requests for the given training.

`version` will be the unique ID of model version used to create the training.


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/trainings"
```

---

## GET /trainings/{training_id}

**Get a training**

Get the current state of a training.

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/trainings/zz4ibbonubfz7carwiefibzgga
```

The response will be the training object:

```json
{
  "completed_at": "2023-09-08T16:41:19.826523Z",
  "created_at": "2023-09-08T16:32:57.018467Z",
  "error": null,
  "id": "zz4ibbonubfz7carwiefibzgga",
  "input": {
    "input_images": "https://example.com/my-input-images.zip"
  },
  "logs": "...",
  "metrics": {
    "predict_time": 502.713876
  },
  "output": {
    "version": "...",
    "weights": "..."
  },
  "started_at": "2023-09-08T16:32:57.112647Z",
  "status": "succeeded",
  "urls": {
    "web": "https://replicate.com/p/zz4ibbonubfz7carwiefibzgga",
    "get": "https://api.replicate.com/v1/trainings/zz4ibbonubfz7carwiefibzgga",
    "cancel": "https://api.replicate.com/v1/trainings/zz4ibbonubfz7carwiefibzgga/cancel"
  },
  "model": "stability-ai/sdxl",
  "version": "da77bc59ee60423279fd632efb4795ab731d9e3ca9705ef3341091fb989b7eaf",
}
```

`status` will be one of:

- `starting`: the training is starting up. If this status lasts longer than a few seconds, then it's typically because a new worker is being started to run the training.
- `processing`: the `train()` method of the model is currently running.
- `succeeded`: the training completed successfully.
- `failed`: the training encountered an error during processing.
- `canceled`: the training was canceled by its creator.

In the case of success, `output` will be an object containing the output of the model. Any files will be represented as HTTPS URLs. You'll need to pass the `Authorization` header to request them.

In the case of failure, `error` will contain the error encountered during the training.

Terminated trainings (with a status of `succeeded`, `failed`, or `canceled`) will include a `metrics` object with a `predict_time` property showing the amount of CPU or GPU time, in seconds, that the training used while running. It won't include time waiting for the training to start. The `metrics` object will also include a `total_time` property showing the total time, in seconds, that the training took to complete.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `training_id` | path | string | Yes | The ID of the training to get.
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/trainings/{training_id}"
```

---

## POST /trainings/{training_id}/cancel

**Cancel a training**

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `training_id` | path | string | Yes | The ID of the training you want to cancel.
 |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/trainings/{training_id}/cancel"
```

---

## GET /webhooks/default/secret

**Get the signing secret for the default webhook**

Get the signing secret for the default webhook endpoint. This is used to verify that webhook requests are coming from Replicate.

Example cURL request:

```console
curl -s \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  https://api.replicate.com/v1/webhooks/default/secret
```

The response will be a JSON object with a `key` property:

```json
{
  "key": "..."
}
```


### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.replicate.com/v1/webhooks/default/secret"
```

---
