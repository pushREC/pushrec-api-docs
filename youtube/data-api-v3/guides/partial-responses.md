---
source: https://developers.google.com/youtube/v3/guides/implementation/partial
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
category: guides
---

# Implementation: Partial Responses - YouTube Data API v3

## Overview

The YouTube Data API (v3) requires retrieving partial resources to optimize data transfer, parsing, and storage. This approach ensures efficient use of network, CPU, and memory resources.

## Key Parameters

### Part Parameter

The `part` parameter serves dual purposes:
- Identifies which resource properties should be included in API responses
- Specifies which properties should be set during resource insertion or update operations

### Fields Parameter

The `fields` parameter enables developers to specify exactly which resource properties to include in API responses, providing granular control over response content.

## Update Behavior

When updating resources, important rules apply:

**Property Deletion Rule**: If an update request omits a previously-valued property within the specified `part` parameter, that property's value will be deleted if:
- The property can be modified through the API
- The `part` parameter identifies the resource section containing that property

**Unexpected Part Error**: Including resource parts in the request body that aren't listed in the `part` parameter will return a `400 (Bad Request)` HTTP response.

## Practical Example

### Original Video Resource
```json
{
  "snippet": {
    "title": "Old video title",
    "description": "Old video description",
    "tags": ["keyword1","keyword2","keyword3"],
    "categoryId": 22
  },
  "status": {
    "privacyStatus": "private",
    "publishAt": "2014-09-01T12:00:00.0Z",
    "license": "youtube",
    "embeddable": true,
    "publicStatsViewable": true
  }
}
```

### Update Request (part=snippet)
```json
{
  "snippet": {
    "title": "New video title",
    "tags": ["keyword1","keyword2","keyword3"],
    "categoryId": 22
  }
}
```

### Results
- Title updates to "New video title"
- Description deletes (omitted from request)
- Tags and category remain unchanged
- Status properties unaffected (not included in `part` parameter)

## Fields Parameter Usage

The `fields` parameter allows you to request only specific properties from a resource, reducing response size and improving performance.

### Syntax
Use dot notation to specify nested fields:
```
fields=items(id,snippet(title,description))
```

### Examples

**Request only video IDs and titles:**
```
GET https://www.googleapis.com/youtube/v3/videos?part=snippet&id=VIDEO_ID&fields=items(id,snippet/title)
```

**Request multiple specific fields:**
```
GET https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics&id=VIDEO_ID&fields=items(id,snippet(title,description,publishedAt),statistics/viewCount)
```

## Best Practices

1. **Always specify `part` parameter**: Only request the resource parts you need
2. **Use `fields` for further optimization**: When you only need specific properties within a part
3. **Minimize data transfer**: Smaller responses mean faster load times and lower bandwidth usage
4. **Reduce quota costs**: Some operations cost less when requesting fewer properties
5. **Update carefully**: Remember that omitted properties in update requests will be deleted

## Performance Impact

Using partial responses can significantly improve performance:

- **Network**: Reduced payload size means faster downloads
- **CPU**: Less data to parse means faster processing
- **Memory**: Smaller objects consume less memory
- **Quota**: Some operations may cost fewer quota units with partial responses

## Common Pitfalls

### Accidental Property Deletion
```json
// WRONG: This will delete the description
PUT /youtube/v3/videos?part=snippet
{
  "id": "VIDEO_ID",
  "snippet": {
    "title": "New title"
  }
}

// CORRECT: Include all properties you want to keep
PUT /youtube/v3/videos?part=snippet
{
  "id": "VIDEO_ID",
  "snippet": {
    "title": "New title",
    "description": "Keep this description",
    "tags": ["tag1", "tag2"],
    "categoryId": 22
  }
}
```

### Including Unexpected Parts
```json
// WRONG: status not in part parameter
PUT /youtube/v3/videos?part=snippet
{
  "id": "VIDEO_ID",
  "snippet": { "title": "New title" },
  "status": { "privacyStatus": "public" }  // Returns 400 error
}

// CORRECT: Include all parts in parameter
PUT /youtube/v3/videos?part=snippet,status
{
  "id": "VIDEO_ID",
  "snippet": { "title": "New title" },
  "status": { "privacyStatus": "public" }
}
```

## Related Documentation

- [Videos.update method](../resources/videos-update.md)
- [Quota costs](../overview/quota-costs.md)
- [API reference](../overview/api-reference.md)
