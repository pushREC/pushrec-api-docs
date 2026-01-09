---
created: 2026-01-09
tags: [type/api-reference, api/presentations]
api_name: Google Slides API
resource: presentations
method_count: 3
---

# Google Slides API - Presentations

[[README|Back to Overview]]

---

## POST presentations.batchUpdate

**Applies one or more updates to the presentation. Each request is validated before being applied. If any request is not valid, then the entire request will fail and nothing will be applied. Some requests have replies to give you some information about how they are applied. Other requests do not need to return information; these each return an empty reply. The order of replies matches that of the requests. For example, suppose you call batchUpdate with four updates, and only the third one returns information. The response would have two empty replies: the reply to the third request, and another empty reply, in that order. Because other users may be editing the presentation, the presentation might not exactly reflect your changes: your changes may be altered with respect to collaborator changes. If there are no collaborators, the presentation should reflect your changes. In any case, the updates in your request are guaranteed to be applied together atomically.**

**Endpoint:** `POST https://slides.googleapis.com/v1/presentations/{presentationId}:batchUpdate`

### Required Scopes

- `drive`
- `drive.file`
- `drive.readonly`
- `presentations`
- `spreadsheets`
- `spreadsheets.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `presentationId` | string | path | Yes | The presentation to apply the updates to. |

### Request Body

Schema: `BatchUpdatePresentationRequest`

### Response

Schema: `BatchUpdatePresentationResponse`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://slides.googleapis.com/v1/presentations/{presentationId}:batchUpdate"
```

---

## POST presentations.create

**Creates a blank presentation using the title given in the request. If a `presentationId` is provided, it is used as the ID of the new presentation. Otherwise, a new ID is generated. Other fields in the request, including any provided content, are ignored. Returns the created presentation.**

**Endpoint:** `POST https://slides.googleapis.com/v1/presentations`

### Required Scopes

- `drive`
- `drive.file`
- `presentations`

### Request Body

Schema: `Presentation`

### Response

Schema: `Presentation`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://slides.googleapis.com/v1/presentations"
```

---

## GET presentations.get

**Gets the latest version of the specified presentation.**

**Endpoint:** `GET https://slides.googleapis.com/v1/presentations/{presentationsId}`

### Required Scopes

- `drive`
- `drive.file`
- `drive.readonly`
- `presentations`
- `presentations.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `presentationId` | string | path | Yes | The ID of the presentation to retrieve. |

### Response

Schema: `Presentation`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://slides.googleapis.com/v1/presentations/{presentationsId}"
```

---

## Sub-resource: pages

## GET presentations.pages.get

**Gets the latest version of the specified page in the presentation.**

**Endpoint:** `GET https://slides.googleapis.com/v1/presentations/{presentationId}/pages/{pageObjectId}`

### Required Scopes

- `drive`
- `drive.file`
- `drive.readonly`
- `presentations`
- `presentations.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `pageObjectId` | string | path | Yes | The object ID of the page to retrieve. |
| `presentationId` | string | path | Yes | The ID of the presentation to retrieve. |

### Response

Schema: `Page`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://slides.googleapis.com/v1/presentations/{presentationId}/pages/{pageObjectId}"
```

---

## GET presentations.pages.getThumbnail

**Generates a thumbnail of the latest version of the specified page in the presentation and returns a URL to the thumbnail image. This request counts as an [expensive read request](https://developers.google.com/workspace/slides/limits) for quota purposes.**

**Endpoint:** `GET https://slides.googleapis.com/v1/presentations/{presentationId}/pages/{pageObjectId}/thumbnail`

### Required Scopes

- `drive`
- `drive.file`
- `drive.readonly`
- `presentations`
- `presentations.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `pageObjectId` | string | path | Yes | The object ID of the page whose thumbnail to retrieve. |
| `presentationId` | string | path | Yes | The ID of the presentation to retrieve. |
| `thumbnailProperties.mimeType` | string | query | No | The optional mime type of the thumbnail image. If you don't ... |
| `thumbnailProperties.thumbnailSize` | string | query | No | The optional thumbnail image size. If you don't specify the ... |

### Response

Schema: `Thumbnail`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://slides.googleapis.com/v1/presentations/{presentationId}/pages/{pageObjectId}/thumbnail"
```

---
