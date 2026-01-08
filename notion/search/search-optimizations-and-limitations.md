---
source: https://developers.notion.com/reference/search-optimizations-and-limitations
scraped: 2026-01-08
---

# Search Optimizations and Limitations

## Overview

The Notion API search endpoint is designed primarily for querying pages and databases by name.

## Optimizations

### Best Practices

| Practice | Benefit |
|----------|---------|
| Be specific | Filter by object type and include text queries |
| Reduce page_size | Improve response speed (default is 100) |
| Share directly | Pages/databases shared directly appear immediately |

Pages and databases directly shared with an integration are guaranteed to appear in search results without indexing delays.

## Limitations

### Not Optimized For

| Scenario | Recommendation |
|----------|----------------|
| **Exhaustive enumeration** | Cannot reliably return all documents; index may change during pagination |
| **Database-specific queries** | Use the dedicated "Query a data source" endpoint |
| **Real-time indexing** | Recently shared pages may not appear immediately |

### Indexing Delay Workaround

When an integration needs to present a user interface that depends on search results, include a **Refresh** button to retry the search.

## Key Takeaway

Search is best suited for name-based discovery of pages and databases. For exhaustive access enumeration or database-specific filtering, alternative API endpoints provide better performance and reliability.
