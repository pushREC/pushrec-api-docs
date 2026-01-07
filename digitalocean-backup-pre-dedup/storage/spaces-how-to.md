---
source: https://docs.digitalocean.com/products/spaces/how-to/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 DigitalOcean Spaces How-Tos Documentation

## Overview

DigitalOcean Spaces Object Storage is an S3-compatible service designed for "storing and serving large amounts of data" with a built-in CDN to optimize performance and reduce costs.

## Documentation Structure

The How-Tos guide is organized into four main sections:

### Getting Started
- Creating buckets for data storage
- Uploading, downloading, and deleting files
- Organizing content with folders
- Destroying buckets
- Migrating data with Flexify.IO
- Transferring buckets between regions using Rclone

### Access Control
- Sharing files through permissions and presigned URLs
- Setting file listing permissions (public/private)
- Managing access via keys and team features

### Content Delivery Network
- Enabling the built-in CDN
- Managing cache TTL and purging
- Customizing endpoints with custom subdomains

### Advanced Topics
- S3 Versioning for object preservation
- Bucket policy configuration
- Lifecycle rules for automatic management
- File metadata settings
- CORS configuration
- Integration with AWS S3 SDKs

## Key Features

The documentation emphasizes that users can "create multiple Spaces buckets at no additional cost" for logical content segmentation, and notes that the service supports "S3-compatible" tools and libraries.