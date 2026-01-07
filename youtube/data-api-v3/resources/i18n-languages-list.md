---
source: https://developers.google.com/youtube/v3/docs/i18nLanguages/list
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 I18nLanguages: list

Returns a list of application languages that the YouTube website supports.

## HTTP Request

```
GET https://www.googleapis.com/youtube/v3/i18nLanguages
```

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Specifies which i18nLanguage resource properties the API response will include. Must be set to `snippet`. |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `hl` | string | Designates the language for text values in the API response. Default value is `en_US`. |

## Request Body

Do not provide a request body when calling this method.

## Response

If successful, this method returns a response body with the following structure:

```json
{
  "kind": "youtube#i18nLanguageListResponse",
  "etag": "etag value",
  "items": [
    {
      "kind": "youtube#i18nLanguage",
      "etag": "etag",
      "id": "string",
      "snippet": {
        "hl": "string",
        "name": "string"
      }
    }
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Identifies the API resource type as `youtube#i18nLanguageListResponse` |
| `etag` | etag | The Etag of this resource |
| `items[]` | list | A list of supported i18n languages |

## Quota Cost

A call to this method has a quota cost of **1 unit**.

## Authorization

This method does not require user authorization; only an API key is needed.
