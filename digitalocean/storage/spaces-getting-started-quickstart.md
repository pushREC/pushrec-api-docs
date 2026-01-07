---
source: https://docs.digitalocean.com/products/spaces/getting-started/quickstart/
scraped: 2025-01-07
tags: ["digitalocean", "storage", "api-docs", "spaces", "s3"]
---

# Spaces Quickstart - DigitalOcean Documentation

## Overview

"Spaces Object Storage is an S3-compatible service for storing and serving large amounts of data." The platform includes built-in CDN capabilities to enhance performance and reduce infrastructure costs.

## Create a Bucket

The bucket creation process involves:

1. Accessing the DigitalOcean Control Panel and selecting **Create** > **Spaces**
2. Specifying a bucket name and datacenter region
3. Choosing between Standard Storage or Cold Storage classes
4. Optionally enabling the Spaces CDN at no additional cost
5. Setting file listing permissions
6. Confirming creation

**Important note:** "Spaces Cold Storage buckets do not support CDN integration or custom CDN endpoints." Standard Storage is required for CDN functionality.

## Upload and Delete Files

**Uploading files:**
- Use drag-and-drop or the file selection tool
- Set permissions (Public or Private; defaults to Private)
- Confirm the upload

**Deleting files:**
- Access the file's menu and select Delete
- Confirm the deletion

## Manage File Permissions

Hover over filenames to view current permissions. To modify permissions:
1. Open the file's menu
2. Select "Manage Permissions"
3. Choose Public or Private
4. Click Update

## Create and Delete Folders

Create folders by clicking **New Folder** and entering a name. Upload entire directory structures through the file upload interface. Delete folders via the menu; note that deletion removes all contents.

## Enable the CDN

Enable CDN on existing buckets through the **Settings** tab by selecting **Edit** under the CDN section, enabling the feature, setting TTL values, and adding subdomains.

## Delete a Space

Navigate to **Settings** > **Destroy**, then confirm with the red button. This action permanently deletes the bucket and all contents.