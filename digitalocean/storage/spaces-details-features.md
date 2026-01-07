---
source: https://docs.digitalocean.com/products/spaces/details/features/
scraped: 2025-01-07
tags: ["digitalocean", "storage", "api-docs", "spaces", "s3"]
---

# DigitalOcean Spaces Features Documentation

## Overview

DigitalOcean Spaces provides S3-compatible object storage for storing and serving large data volumes. The service includes a built-in CDN at no extra cost, designed to minimize page load times and reduce infrastructure expenses.

## Key Features

### Unique URLs
Spaces subscriptions enable creation of multiple buckets as logical content segments. Each bucket receives its own unique URL following the pattern: `spacename.region.digitaloceanspaces.com` or `region.digitaloceanspaces.com/spacename`.

### High Availability
Built on Ceph infrastructure, Spaces ensures redundancy across multiple layers. As noted in DigitalOcean's documentation, "Ceph is built for redundancy, and we carefully ensure that the loss of a single drive, server, or even an entire datacenter rack does not compromise data integrity or availability."

The service utilizes sophisticated monitoring systems and gracefully handles component failures while maintaining data protection.

### CDN Integration
The integrated Content Delivery Network offers:
- Edge server distribution for faster content delivery
- Customizable TTL (Time-to-Live) cache settings
- Ability to purge cache for entire buckets or individual objects
- Support for custom subdomains with SSL certificates
- SEO benefits through improved page load times

### Spaces Cold Storage
A cost-effective tier for infrequently accessed data offering:
- Same durability as Standard Storage
- Write throughput up to 25 MB/second per client thread
- 99.9% service level agreement
- Waived retrieval fees for standard daily usage

## Ideal Use Cases
Static, unstructured data including audio, video, images, and text-based content work best with Spaces' object storage model.