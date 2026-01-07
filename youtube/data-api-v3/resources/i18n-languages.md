---
source: https://developers.google.com/youtube/v3/docs/i18nLanguages
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 i18nLanguages Resource Documentation

## Resource Overview

The `i18nLanguage` resource identifies an application language (UI language) supported by YouTube. Language selection can occur automatically based on Google Account settings, browser preferences, or IP location, or be manually chosen by users from the YouTube site footer.

Each resource includes a language code usable as the `hl` parameter value for API methods like `videoCategories.list` and `guideCategories.list`.

## Resource JSON Representation

```json
{
  "kind": "youtube#i18nLanguage",
  "etag": "etag",
  "id": "string",
  "snippet": {
    "hl": "string",
    "name": "string"
  }
}
```

## Properties Table

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Resource type identifier; value is `youtube#i18nLanguage` |
| `etag` | etag | The Etag of this resource |
| `id` | string | YouTube's unique identifier for the i18n language |
| `snippet` | object | Contains basic language details |
| `snippet.hl` | string | BCP-47 code uniquely identifying the language |
| `snippet.name` | string | Language name in the language specified by the `hl` parameter |

## Available Methods

| Method | Description |
|--------|-------------|
| **list** | Returns a list of application languages supported by YouTube |
