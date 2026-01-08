# Bright Data API Documentation

> **Status:** Complete YouTube Scraping Reference
> **Last Updated:** 2026-01-08
> **Source:** docs.brightdata.com, brightdata.com

## Overview

Bright Data provides a comprehensive Web Scraper API with 391 ready-made scrapers across multiple platforms including YouTube. This documentation focuses on YouTube data extraction capabilities.

## Quick Start

```bash
# Set API token
export BRIGHTDATA_API_TOKEN="your-token"

# Async request (batch processing)
curl -X POST "https://api.brightdata.com/datasets/v3/trigger?dataset_id=YOUR_YOUTUBE_DATASET_ID&format=json" \
  -H "Authorization: Bearer $BRIGHTDATA_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '[{"url": "https://www.youtube.com/watch?v=VIDEO_ID"}]'

# Check progress
curl "https://api.brightdata.com/datasets/v3/progress/SNAPSHOT_ID" \
  -H "Authorization: Bearer $BRIGHTDATA_API_TOKEN"

# Download results
curl "https://api.brightdata.com/datasets/v3/snapshot/SNAPSHOT_ID" \
  -H "Authorization: Bearer $BRIGHTDATA_API_TOKEN"
```

## Base URL

```
https://api.brightdata.com
```

## Key Endpoints

| Endpoint | Method | Purpose | Mode |
|----------|--------|---------|------|
| `/datasets/v3/trigger` | POST | Trigger data collection | Async (batch) |
| `/datasets/v3/scrape` | POST | Fetch data in real-time | Sync (immediate) |
| `/datasets/v3/progress/{snapshot_id}` | GET | Monitor job status | Management |
| `/datasets/v3/snapshot/{snapshot_id}` | GET | Download results | Delivery |

## Authentication

- **Type:** Bearer Token
- **Header:** `Authorization: Bearer {token}`
- **Get Token:** https://brightdata.com/cp/api_tokens

## YouTube Scrapers (10 Available)

| Scraper | Description |
|---------|-------------|
| Video posts by URL | Extract video data from specific URLs |
| Video search by keyword | Search YouTube by keyword |
| Videos by channel URL | Get all videos from a channel |
| Videos with filter parameters | Filter by views, date, etc. |
| Videos by hashtags | Find videos by hashtag |
| Videos from explore pages | Trending/explore content |
| Videos by podcast URL | Podcast episode data |
| Channel profiles | Channel metadata and stats |
| Profiles by keyword search | Find channels by keyword |
| Comments on videos | Video comment extraction |

## YouTube Data Fields

**Videos:**
- URL, title, creator name
- Video length, views, likes
- Upload date, description

**Profiles/Channels:**
- Channel URL, handle
- Subscriber count
- Profile image, banner image
- Description, creation date

**Comments:**
- Comment text, likes, replies
- Username, timestamps
- Reply threads

## Pricing

| Tier | Price per 1K Records | Monthly Cost |
|------|---------------------|--------------|
| Pay-as-you-go | $1.50 | No commitment |
| 510K records | $0.98 | $499 |
| 1M records | $0.83 | $999 |
| 2.5M records | $0.75 | $1,999 |
| Enterprise | Custom | Custom |

**Current Promo:** 25% OFF with code `APIS25`

## Output Formats

- JSON
- NDJSON (Newline-delimited JSON)
- JSON Lines
- CSV
- Compressed .gz files

## Delivery Methods

- Amazon S3
- Google Cloud Storage
- Google PubSub
- Microsoft Azure Storage
- Snowflake
- SFTP
- Webhook

## Rate Limits

- Bulk requests support up to 5,000 URLs per request
- Synchronous requests timeout after ~1 minute
- Async recommended for production/large jobs

## Infrastructure Features

- 150M+ residential IPs across 195 countries
- Automatic IP rotation
- CAPTCHA solving
- User-agent rotation
- JavaScript rendering
- 99.99% uptime guarantee

## Compliance

GDPR and CCPA compliant data collection practices.

## Resources

- [API Docs](https://docs.brightdata.com/api-reference/introduction)
- [Web Scraper Overview](https://docs.brightdata.com/scraping-automation/web-scraper-api/overview)
- [OpenAPI Specs](https://brightdata.com/blog/ai/bright-data-openapi-specs)
- [Python SDK](https://github.com/brightdata/bright-data-sdk-python)
- [Scraper Library](https://brightdata.com/cp/scrapers/browse)
