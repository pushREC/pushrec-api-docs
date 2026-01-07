---
source: https://docs.digitalocean.com/products/spaces/reference/
scraped: 2025-01-07
tags: ["digitalocean", "storage", "api-docs", "spaces", "s3"]
---

# Spaces Reference Documentation

## Overview

DigitalOcean Spaces is described as "an S3-compatible service for storing and serving large amounts of data" with an integrated CDN to optimize performance and reduce costs.

## Access Methods

The documentation outlines several ways to interact with Spaces:

### 1. DigitalOcean API
The platform provides REST-based API access that mirrors S3 functionality, allowing programmatic resource management through standard HTTP requests.

### 2. MCP Server
A Model Context Protocol server enables natural language-based management of Spaces access keys for S3-compatible storage operations.

### 3. Third-Party Clients

**Graphical Tools:**
- Transmit 4 and 5 (macOS file transfer utilities)
- Cyberduck (cross-platform open-source client for Windows and macOS)

**Command-Line Tools:**
- s3cmd 2.x (cross-platform terminal utility for S3 management)

**SDK Support:**
The service supports AWS S3 SDKs and compatible libraries across multiple programming languages including JavaScript, Go, PHP, Python 3, and Ruby.

## Key Features

The documentation emphasizes that all control panel actions are available via API, and the S3-compatible architecture means existing S3 tools and libraries work with Spaces without modification.