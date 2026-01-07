---
source: https://docs.digitalocean.com/products/spaces/details/limits/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 Spaces Limits - DigitalOcean Documentation

## Spaces Standard Storage Limits

**Bucket and Access Management:**
- Create up to 100 Spaces buckets and 200 access keys per account
- Cannot directly transfer buckets between regions or teams
- No built-in backups available
- Share access to all buckets on an account/team, but not to specific buckets
- DigitalOcean tags and bucket tags are unsupported
- Buckets pending destruction cannot be reused for 1+ weeks
- Cannot use existing wildcard SSL certificates for CDN subdomains
- Buckets with periods in names incompatible with SSL wildcard certificates
- Incomplete multipart uploads automatically deleted after 30 days
- CloudFlare Origin CA certificates not supported
- Presigned URLs bypass CDN caching, potentially doubling bandwidth charges
- Cannot combine multiple CDNs from different vendors with one bucket

### Rate Limits

**General limits across all buckets:**
- 1500 requests per IP address per second to all account buckets
- 10 concurrent PUT or COPY requests per individual object

**Legacy buckets** (created before specific dates per datacenter):
- 500 total operations per second
- 300 combined PUT, POST, COPY, DELETE, and LIST operations per second

**Newer buckets:**
- 800 total operations per second

High-load periods may further restrict LIST requests. Applications should implement exponential backoff on 503 errors. Exceeding limits without backoff may cause temporary access suspension. For 400+ read requests/second, use Spaces CDN.

### Object and File Size Limits

- PUT requests: maximum 5 GB
- Multipart upload parts: maximum 5 GB each (minimum 5 MiB except final part)
- Multipart uploads: maximum 10,000 parts, 5 TB total
- Presigned URL uploads to CDN: maximum 8,100 KiB (7.91 MiB)
- Control panel deletion: up to 9,999 files at once
- Minimum billable object size: 4 KiB
- Unversioned objects: up to 100 million; versioned objects: up to 50 million
- Buckets created after July 2021 support these higher limits

### Access Key Limits

- Create and edit access keys only through control panel
- Cannot convert full access keys to limited keys or vice versa
- Per-bucket access keys incompatible with S3-compatible bucket policies

### Access Log Limits

- Configuration only via S3-compatible API and Terraform
- CDN and origin logs stored in same folder
- Cannot specify identical source and target buckets for logging

## Spaces Cold Storage Limits

- No static website hosting or website configuration features
- Creation only via DigitalOcean Control Panel
- CopyObject unsupported between Cold Storage buckets in different regions
- CopyObject unsupported between Standard and Cold Storage tiers
- No CDN integration, bucket policies, intelligent tiering, or CORS support
- Requires signed S3 requests with valid access keys
- Available in all regions except BLR1
- Rate limits: 450 write, 250 read, 25 list requests per second
- Minimum object size billed: 128 KiB
- Minimum retrieval charge: 128 KiB per read
- Minimum storage charge: 30 days per object
- Overwriting counted as delete plus create operation

## Known Issues

- Delete actions lack correct IP addresses in security history
- Bulk file uploads via control panel may fail; use s3cmd instead
- Spaces API does not support list-objects-v2 pagination
- CDN subdomain certificates can silently fail on renewal; workaround: use API to update certificate
- Bucket statistics unavailable for accounts with 500+ buckets containing ~10,000 objects each