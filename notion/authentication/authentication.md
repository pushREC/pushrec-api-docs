---
source: https://developers.notion.com/reference/authentication
scraped: 2026-01-08
---

# Authentication

## Overview

The Notion API uses HTTP `Authorization` headers with bearer tokens for both authentication and authorization. These tokens are issued when you create an integration or complete an OAuth flow for public integrations.

## Authentication Method

**Bearer Token Implementation:**

```
Authorization: Bearer [YOUR_ACCESS_TOKEN]
```

### Example Request

```bash
curl 'https://api.notion.com/v1/users' \
  -H 'Authorization: Bearer '"$NOTION_ACCESS_TOKEN"'' \
  -H "Notion-Version: 2022-06-28"
```

## SDK Usage

For applications using the Notion SDK for JavaScript, initialize the client once with your token:

```javascript
const { Client } = require('@notionhq/client');

const client = new Client({
  auth: process.env.NOTION_ACCESS_TOKEN
});
```

This allows you to make multiple authenticated requests through the single client instance.

## Bot Attribution

Operations performed through integrations appear in Notion as changes made by a bot. The bot's name and avatar are customizable through integration settings.

## Related Resources

- For detailed authorization guidance, see the "Authorization guide" documentation
- Public OAuth integrations receive bearer tokens each time users complete the OAuth flow
