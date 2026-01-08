---
source: https://developers.notion.com/reference/versioning
scraped: 2026-01-08
---

# Versioning

## Overview

The Notion API uses date-based versioning to manage backwards-incompatible changes. Versions are named after their release date (for example, `2021-05-13`).

## Required Header

Every REST API request must include the `Notion-Version` header. This ensures consistent API responses aligned with your application's expectations.

**Example request:**

```bash
curl https://api.notion.com/v1/users/01da9b00-e400-4959-91ce-af55307647e5 \
  -H "Authorization: Bearer secret_t1CdN9S8yicG5eWLUOfhcWaOscVnFXns" \
  -H "Notion-Version: 2022-06-28"
```

*Note: The JavaScript SDK automatically sets the appropriate version header.*

## When Versions Change

New API versions are released only for **backwards-incompatible changes**. A concrete example involves property naming: prior to version 2021-05-13, text properties used the field name `text`, but the updated version renamed this to `rich_text`.

## New Features Don't Require Version Updates

Introducing new endpoints, adding fields to responses, or other additive changes don't trigger versioning. You can leverage new functionality immediately on your current API version.

## URL Note

API URLs contain `/v1` (e.g., `https://api.notion.com/v1/`), but this differs from the versioning system and won't change.
