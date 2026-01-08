---
source: https://developers.notion.com/reference/changes-by-version
scraped: 2026-01-08
---

# Changes by Version

## Overview

This page documents breaking changes across different Notion API versions, helping developers understand what's changed and when migrations may be necessary.

## Version History

### 2025-09-03 (Latest)

**Major Restructuring:**

The endpoint organization has shifted significantly. The `/v1/databases` endpoints are now split between:
- `/v1/data_sources` - manages individual data sources within a database container
- `/v1/databases` - manages the database container itself

**Key Impact:** Database IDs remain unchanged, but a new concept of data source IDs has been introduced. This supports multi-source databases, a feature released in Notion in September 2025.

**Resource:** See the upgrade guide and changelog for comprehensive migration details.

### 2022-06-28

**Notable Changes:**
- Page properties must be retrieved via a dedicated endpoint rather than inline
- Parents are now consistently direct parents; a parent field was added to block objects
- Database relations now specify types: `single_property` or `dual_property`

### 2022-02-22

Minor version with updates documented in the changelog.

### 2021-08-16

**Structural Changes:**
- The append block children endpoint now returns new block children instead of parent blocks
- Array rollup property types changed (e.g., `text` became `rich_text`)
- Property IDs are now URL-safe encoded
- Empty properties (number, email, select, date, rollup) return as `null`

### 2021-05-13

**Data Type Update:**
- Rich text property values now use `rich_text` instead of `text` type designation
