---
title: YouTube Analytics and Reporting APIs - Getting Started
source: https://developers.google.com/youtube/analytics/getting-started
api: youtube-analytics
scraped: 2026-01-07
---

# YouTube Analytics and Reporting APIs - Introduction

## Overview

This documentation explains the YouTube Analytics API and YouTube Reporting API, which provide access to YouTube Analytics data for channel owners and content owners.

### Core Capabilities

Both APIs enable retrieval of YouTube Analytics data with support for:
- **Channel reports**: User activity metrics for specified channels
- **Content owner reports**: Aggregated metrics across multiple linked channels

## Key API Differences

### YouTube Analytics API

The Analytics API supports "real-time targeted queries to generate custom YouTube Analytics reports." Key features include:
- Custom filtering and sorting parameters
- Weekly and monthly data aggregation
- Direct request-based data retrieval
- Uses camelCase naming convention (e.g., `adType`)

### YouTube Reporting API

The Reporting API handles "bulk reports containing YouTube Analytics data" with these characteristics:
- Scheduled reporting jobs with daily report generation
- Asynchronous downloads of predefined datasets
- Client-side filtering and sorting required
- Uses lowercase with underscores naming (e.g., `ad_type`)
- Access to system-managed ad revenue reports for some content owners

## Report Types Supported

Both APIs offer:
- **Video reports**: View counts and user activity metrics
- **Playlist reports**: Playlist-specific engagement data
- **Ad performance reports**: Impression-based ad metrics (content owners only)
- **Estimated revenue reports**: Revenue data from various sources

The Reporting API uniquely provides asset reports and system-managed revenue reports.

## Data Structure

Reports contain two essential components:
- **Dimensions**: Aggregation criteria (dates, countries, device types)
- **Metrics**: Individual measurements of activity, performance, or revenue
