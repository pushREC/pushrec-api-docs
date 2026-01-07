---
source: https://developers.google.com/youtube/reporting
scraped: 2026-01-07
api: youtube-reporting
type: overview
---

# YouTube Reporting API Overview

## Core Purpose

The YouTube Reporting API enables bulk data retrieval for YouTube Analytics data. It "retrieves bulk reports containing YouTube Analytics data for a channel or content owner."

## Key Characteristics

**Data Retrieval Process**: Unlike real-time queries, this API operates asynchronously. Applications schedule reporting jobs, and YouTube generates daily reports that can be downloaded later.

**Data Granularity**: The API provides daily data reports, with each report covering a unique 24-hour period. Applications must handle their own aggregation across date ranges.

**Target Use Cases**: The system suits applications that can "import large data sets and that provide tools to filter, sort, and mine that data" internally.

## Report Types Supported

The API supports several report categories:

- **Video reports**: User activity metrics for channels or content owners
- **Playlist reports**: Statistics specific to playlist viewing contexts
- **Ad performance reports**: Impression-based metrics for content owners
- **Estimated revenue reports**: Financial data from advertising sources
- **Asset reports**: Metrics for content owner-claimed videos
- **System-managed reports**: Actual revenue data for eligible content owners

## Unique Capabilities

The Reporting API provides exclusive access to subtitle-related dimensions and metrics unavailable through the Analytics API. It also supports playlist audience retention reports and multiple asset report variations (11 different types).

## Naming Convention

The API uses lowercase identifiers with underscores (e.g., `ad_type`, `video_id`) rather than camelCase formatting.

## Authorization Requirements

All requests require authorization from the channel or content owner that owns the requested data.

## Six-Step Implementation Process

1. Obtain OAuth 2.0 credentials
2. Identify report type via `reportTypes.list()`
3. Create job using `jobs.create()`
4. Retrieve job ID
5. Get download URL from `jobs.reports.list()`
6. Download CSV via HTTP GET request

## Data Availability

- Reports contain data for unique 24-hour periods (PST)
- YouTube generates reports even for zero-data days (header only)
- Historical reports (30-day backfill) remain accessible for 30 days
- Standard reports remain accessible for 60 days
- Backfill data replaces previous datasets automatically

## Privacy Protections

Certain dimension values are anonymized when associated metrics fall below privacy thresholds, using `ZZ` or `NULL` values to protect viewer anonymity while maintaining data utility.
