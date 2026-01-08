---
source: https://developers.notion.com/reference/archive-a-page
scraped: 2026-01-08
---

# Trash a Page

## Overview

The Notion API provides functionality to archive (trash) pages. Pages can be archived and restored using the Update page endpoint.

**Important Note:** The API does not support permanently deleting pages.

## Archive a Page

Send a PATCH request to the page endpoint with `archived: true` (or `in_trash: true`).

### Endpoint

**PATCH** `https://api.notion.com/v1/pages/{page_id}`

### cURL Example

```bash
curl https://api.notion.com/v1/pages/60bdc8bd-3880-44b8-a9cd-8a145b3ffbd7 \
  -H 'Authorization: Bearer $NOTION_API_KEY' \
  -H "Content-Type: application/json" \
  -H "Notion-Version: 2022-06-28" \
  -X PATCH \
  --data '{"archived": true}'
```

### JavaScript SDK Example

```javascript
const { Client } = require("@notionhq/client");

const notion = new Client({
  auth: process.env.NOTION_API_KEY,
});

const archivePage = async () => {
  await notion.pages.update({
    page_id: pageId,
    archived: true, // or in_trash: true
  });
};
```

## Restore a Page

Set `archived: false` to restore an archived page:

```bash
curl https://api.notion.com/v1/pages/60bdc8bd-3880-44b8-a9cd-8a145b3ffbd7 \
  -H 'Authorization: Bearer $NOTION_API_KEY' \
  -H "Content-Type: application/json" \
  -H "Notion-Version: 2022-06-28" \
  -X PATCH \
  --data '{"archived": false}'
```

## Response

Successful requests return HTTP 200 and the complete page object, including the updated `archived` and `in_trash` properties.
