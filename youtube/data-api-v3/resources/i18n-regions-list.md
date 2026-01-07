---
source: https://developers.google.com/youtube/v3/docs/i18nRegions/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 I18nRegions: list

Returns a list of content regions that the YouTube website supports.

## HTTP Request

```
GET https://www.googleapis.com/youtube/v3/i18nRegions
```

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Specifies the i18nRegion resource properties to include in response. Must be set to `snippet`. |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `hl` | string | Language for text values in API response. Default value is `en_US`. |

## Request Body

Do not provide a request body when calling this method.

## Response

If successful, this method returns a response body with the following structure:

```json
{
  "kind": "youtube#i18nRegionListResponse",
  "etag": "etag",
  "items": [
    {
      "kind": "youtube#i18nRegion",
      "etag": "etag",
      "id": "string",
      "snippet": {
        "gl": "string",
        "name": "string"
      }
    }
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | API resource type value: `youtube#i18nRegionListResponse` |
| `etag` | etag | Etag of this resource |
| `items[]` | list | Contains regions where YouTube is available |

## Quota Cost

A call to this method has a quota cost of **1 unit**.

## Authorization

This method does not require user authorization; only an API key is needed.

## Errors

The API does not define any error messages that are unique to this API method. General API errors may still be returned per standard error documentation.
