---
source: https://docs.digitalocean.com/products/spaces/details/availability/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 Spaces Availability - DigitalOcean Documentation

## Overview

"Spaces Object Storage is an S3-compatible service for storing and serving large amounts of data." The platform includes a built-in CDN to enhance performance and reduce costs.

## Regional Availability

The service operates across 12 primary datacenters:

NYC1, NYC2, NYC3, AMS3, SFO2, SFO3, SGP1, LON1, FRA1, TOR1, BLR1, SYD1, ATL1

Both **Spaces Standard Storage** and **Spaces Cold Storage** are available in these regions.

## CDN and Storage Features

The Spaces CDN operates globally with points of presence across six major regions:

- **Africa** - 34 cities including Johannesburg, Lagos, Cairo, and Nairobi
- **Asia** - 80+ cities spanning India, China, Japan, Southeast Asia, and the Middle East
- **Europe** - 50+ cities throughout the continent
- **Latin America & Caribbean** - 70+ cities
- **Middle East** - 20 cities
- **North America** - 50+ cities
- **Oceania** - 12 cities

## Important Limitations

"Spaces Cold Storage buckets do not support CDN integration or custom CDN endpoints." For CDN functionality, users should create Standard Storage buckets instead.

The service integrates with Droplets across all DigitalOcean datacenters.