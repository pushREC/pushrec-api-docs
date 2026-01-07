---
source: https://developers.google.com/youtube/v3/docs/comments/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 Comments: list

Returns a list of comments that match the API request parameters.

## HTTP Request

```
GET https://www.googleapis.com/youtube/v3/comments
```

## Quota Cost

**1 unit** per call

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Specifies comment resource properties for inclusion. Valid values: `id`, `snippet` |

### Filter Parameters (Select Exactly One)

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | Comma-separated list of comment IDs to retrieve |
| `parentId` | string | ID of the parent comment for retrieving replies |

**Note:** YouTube supports replies only for top-level comments.

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `maxResults` | unsigned integer | Maximum items to return (1-100, default: 20). Cannot be used with `id` parameter. |
| `pageToken` | string | Identifies a specific result page. Cannot be used with `id` parameter. |
| `textFormat` | string | Specifies output format: `html` (default) or `plainText` |

## Request Body

No request body required.

## Response

### Response Structure

```json
{
  "kind": "youtube#commentListResponse",
  "etag": "string",
  "nextPageToken": "string",
  "pageInfo": {
    "totalResults": "integer",
    "resultsPerPage": "integer"
  },
  "items": [
    // comment resources
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#commentListResponse` |
| `etag` | string | Resource version identifier |
| `nextPageToken` | string | Token for next page of results |
| `pageInfo.totalResults` | integer | Total number of results |
| `pageInfo.resultsPerPage` | integer | Number of results per page |
| `items[]` | array | List of comment resources |

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 400 | `operationNotSupported` | ID filter incompatible with non-Google+ comments |
| 403 | `forbidden` | Insufficient permissions for access |
| 404 | `commentNotFound` | Specified comments cannot be located |

## Example Requests

### Get Comments by ID

```
GET https://www.googleapis.com/youtube/v3/comments?part=snippet&id=COMMENT_ID_1,COMMENT_ID_2
```

### Get Replies to a Comment

```
GET https://www.googleapis.com/youtube/v3/comments?part=snippet&parentId=PARENT_COMMENT_ID&maxResults=50
```

### Get Comments in Plain Text

```
GET https://www.googleapis.com/youtube/v3/comments?part=snippet&parentId=PARENT_COMMENT_ID&textFormat=plainText
```

## Notes

- Use `parentId` to retrieve replies to a top-level comment
- The `id` parameter cannot be combined with pagination parameters
- The `textFormat` parameter affects how the comment text is returned
