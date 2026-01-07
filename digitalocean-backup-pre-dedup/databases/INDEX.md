---
source: '[unknown - INDEX.md]'
scraped: '2026-01-07'
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
# DigitalOcean Managed Databases Documentation Index

**Scraped:** 2025-01-07
**Total Files:** 251
**Total Size:** 2.8 MB
**Database Types:** 7

---

## Quick Navigation

### By Database Type

- [PostgreSQL](#postgresql-42-files) - 42 files
- [MySQL](#mysql-44-files) - 44 files
- [Redis](#redis-35-files) - 35 files
- [MongoDB](#mongodb-34-files) - 34 files
- [Kafka](#kafka-31-files) - 31 files
- [OpenSearch](#opensearch-31-files) - 31 files
- [Valkey](#valkey-33-files) - 33 files

### By Topic

- [Getting Started](#getting-started)
- [Connection Guides](#connection-guides)
- [Migration Guides](#migration-guides)
- [How-To Guides](#how-to-guides)
- [Best Practices & Concepts](#best-practices--concepts)
- [API & CLI Reference](#api--cli-reference)

---

## PostgreSQL (42 files)

### Essential Guides
- `postgresql-how-to-connect.md` (17.7 KB) - Complete connection guide
- `postgresql-migrate.md` (23 KB) - Migration guide with SQL examples
- `postgresql-how-to-create.md` (16.8 KB) - Cluster creation
- `postgresql-migration-strategies.md` (8.9 KB) - Migration best practices

### Details & Configuration
- `postgresql-details-features.md` - Features overview
- `postgresql-details-pricing.md` - Pricing information
- `postgresql-details-availability.md` - Availability zones
- `postgresql-details-limits.md` - Service limits
- `postgresql-details-supported-extensions.md` - Extensions

### Operations
- `postgresql-how-to-resize.md` - Scaling clusters
- `postgresql-how-to-secure.md` - Security configuration
- `postgresql-how-to-backup-and-restore.md` - Backup management
- `postgresql-how-to-add-standby-nodes.md` - High availability
- `postgresql-how-to-manage-connection-pools.md` - Connection pooling

---

## MySQL (44 files)

### Essential Guides
- `mysql-how-to-connect.md` (23.7 KB) - Connection guide (most comprehensive)
- `mysql-how-to-create.md` (16.2 KB) - Cluster creation
- `mysql-concepts-migration-strategies.md` (8.5 KB) - Migration strategies
- `mysql-migrate.md` (7.4 KB) - Migration guide

### Configuration
- `mysql-concepts-sort-buffer-size.md` - Performance tuning
- `mysql-details-features.md` - Features overview
- `mysql-details-pricing.md` - Pricing
- `mysql-details-limits.md` - Service limits

---

## MongoDB (34 files)

### Essential Guides
- `mongodb-how-to-connect.md` (17.5 KB) - Connection guide
- `mongodb-how-to-create.md` (15.9 KB) - Cluster creation
- `mongodb-how-to-resize.md` (11.3 KB) - Scaling operations

### Details
- `mongodb-details-features.md` - Features overview
- `mongodb-details-pricing.md` - Pricing
- `mongodb-details-availability.md` - Availability zones
- `mongodb-support.md` - Support resources

---

## Redis (35 files)

### Essential Guides
- `redis-how-to-connect.md` - Connection guide
- `redis-how-to-migrate.md` (12 KB) - Migration guide
- `redis-how-to-choose-eviction-policies.md` - Cache management
- `redis-migration-strategies.md` (7.9 KB) - Migration strategies

### Operations
- `redis-how-to-add-standby-nodes.md` - High availability
- `redis-how-to-monitor-clusters.md` - Monitoring
- `redis-how-to-resize.md` - Scaling
- `redis-how-to-secure.md` - Security

---

## Kafka (31 files)

### Essential Guides
- `kafka-how-to-connect.md` (24.7 KB) - Connection guide (largest file)
- `kafka-how-to-create.md` (15.6 KB) - Cluster creation
- `kafka-enable-schema-registry.md` - Schema management
- `kafka-create-topics.md` - Topic management

### Configuration
- `kafka-details-features.md` - Features overview
- `kafka-details-limits.md` - Service limits
- `kafka-best-practices.md` - Best practices
- `kafka-manage-users-and-privileges.md` - Access control

---

## OpenSearch (31 files)

### Essential Guides
- `opensearch-how-to-create.md` (6.3 KB) - Cluster creation
- `opensearch-how-to-forward-logs.md` (7.3 KB) - Log forwarding
- `opensearch-details-features.md` (5.7 KB) - Features

### Operations
- `opensearch-getting-started-quickstart.md` - Quick start
- `opensearch-details-pricing.md` - Pricing
- `opensearch-details-limits.md` - Limits

---

## Valkey (33 files)

### Essential Guides
- `valkey-how-to-migrate.md` (12 KB) - Migration guide
- `valkey-getting-started-convert.md` - Redis to Valkey conversion
- `valkey-how-to-choose-eviction-policies.md` - Cache management
- `valkey-how-to-connect.md` - Connection guide

### Operations
- `valkey-how-to-add-standby-nodes.md` - High availability
- `valkey-how-to-monitor-clusters.md` - Monitoring
- `valkey-migration-strategies.md` (8.0 KB) - Migration strategies

---

## Getting Started

Quick start guides for each database:

- `postgresql-getting-started-quickstart.md`
- `mysql-getting-started-quickstart.md`
- `redis-getting-started-quickstart.md`
- `mongodb-getting-started-quickstart.md`
- `kafka-getting-started-quickstart.md`
- `opensearch-getting-started-quickstart.md`
- `valkey-getting-started-quickstart.md`

---

## Connection Guides

Complete connection documentation with code examples:

- `postgresql-how-to-connect.md` (17.7 KB) - Python, Go, cURL
- `mysql-how-to-connect.md` (23.7 KB) - Most comprehensive
- `mongodb-how-to-connect.md` (17.5 KB) - MongoDB connection strings
- `redis-how-to-connect.md` - Redis connections
- `kafka-how-to-connect.md` (24.7 KB) - Kafka connections
- `opensearch-how-to-connect.md` - OpenSearch API
- `valkey-how-to-connect.md` - Valkey connections

---

## Migration Guides

Full migration documentation with SQL commands:

- `postgresql-migrate.md` (23 KB) - **Most comprehensive**
  - Logical replication
  - `pg_dump` examples
  - `CREATE PUBLICATION` commands
  - Connection string examples

- `mysql-migrate.md` (7.4 KB)
  - Migration strategies
  - Data transfer methods

- `redis-how-to-migrate.md` (12 KB)
  - Cache migration
  - Data transfer

- `valkey-how-to-migrate.md` (12 KB)
  - Redis to Valkey conversion

- `mongodb-how-to-migrate.md`
  - Document database migration

### Migration Strategies
- `postgresql-migration-strategies.md` (8.9 KB)
- `mysql-concepts-migration-strategies.md` (8.5 KB)
- `redis-migration-strategies.md` (7.9 KB)
- `valkey-migration-strategies.md` (8.0 KB)

---

## How-To Guides

### Cluster Management
- Creating clusters: `*-how-to-create.md` (7 files)
- Resizing: `*-how-to-resize.md` (7 files)
- Destroying: `*-how-to-destroy.md` (7 files)
- Relocating: `*-how-to-relocate.md` (7 files)

### High Availability
- Adding standby nodes: `*-how-to-add-standby-nodes.md` (PostgreSQL, MySQL, Redis, Valkey)
- Read-only nodes: `*-how-to-add-read-only-nodes.md` (PostgreSQL, MySQL)

### Security
- Securing clusters: `*-how-to-secure.md` (all databases)
- Managing users: `*-how-to-manage-users-and-databases.md`
- Modifying privileges: `*-how-to-modify-user-privileges.md`

### Monitoring
- Cluster monitoring: `*-how-to-monitor-clusters.md` (all databases)
- Setting up alerts: `*-how-to-set-up-alerts.md` (all databases)
- Performance monitoring: `*-how-to-monitor-databases.md`

### Maintenance
- Scheduling updates: `*-how-to-schedule-updates.md` (all databases)
- Backup and restore: `*-how-to-restore-from-backups.md`
- Forwarding logs: `*-how-to-forward-logs.md`

---

## Best Practices & Concepts

### Best Practices
- `kafka-best-practices.md` (7.3 KB)
- `postgresql-concepts-best-practices.md`
- `mysql-concepts-best-practices.md`

### Configuration Concepts
- `postgresql-concepts-shared-buffers.md` - Memory configuration
- `mysql-concepts-sort-buffer-size.md` - Query performance
- `redis-how-to-choose-eviction-policies.md` - Cache eviction
- `valkey-how-to-choose-eviction-policies.md` - Cache eviction

### Architecture
- `postgresql-concepts-responsibility-model.md` - Shared responsibility
- `kafka-concepts.md` - Kafka architecture
- `mongodb-concepts.md` - MongoDB concepts

---

## API & CLI Reference

### API Documentation
- All databases link to: [DigitalOcean API - Databases](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)

### CLI (doctl) Reference
- All databases support doctl commands
- Reference files: `*-reference.md` (7 files)

### Reference Files
- `postgresql-reference.md`
- `mysql-reference.md`
- `redis-reference.md`
- `mongodb-reference.md`
- `kafka-reference.md`
- `opensearch-reference.md`
- `valkey-reference.md`

---

## Support Resources

Support documentation for troubleshooting:

- `postgresql-support.md` (9.9 KB)
- `mysql-support.md` (10.4 KB)
- `mongodb-support.md` (7.7 KB)
- `redis-support.md` (7.3 KB)
- All files contain troubleshooting guides and support contact information

---

## File Naming Convention

All files follow: `{database-type}-{category}-{topic}.md`

**Examples:**
- `postgresql-how-to-connect.md` - How-to guide for PostgreSQL connections
- `mysql-concepts-migration-strategies.md` - Concepts about MySQL migration
- `redis-details-features.md` - Details about Redis features
- `kafka-getting-started-quickstart.md` - Getting started with Kafka

---

## Frontmatter Format

All files include YAML frontmatter:

```yaml
---
source: https://docs.digitalocean.com/products/databases/{db}/{path}
scraped: 2025-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---
```

---

## Content Types Included

- ✅ SQL commands (CREATE, ALTER, SELECT, INSERT, etc.)
- ✅ Connection strings and URIs
- ✅ Code examples (Python, Go, cURL, doctl)
- ✅ API endpoints and request/response examples
- ✅ Configuration files (YAML, JSON)
- ✅ Command-line examples
- ✅ Best practices and recommendations
- ✅ Troubleshooting guides
- ✅ Pricing and limits information

---

## Search Tips

Use grep to find specific topics:

```bash
# Find all connection guides
grep -l "connection string\|connect" *.md

# Find SQL commands
grep -l "CREATE\|ALTER\|SELECT" *.md

# Find migration content
grep -l "migration\|migrate" *.md

# Find pricing information
grep -l "pricing\|cost" *.md

# Find security guides
grep -l "security\|secure\|SSL\|TLS" *.md
```

---

**Last Updated:** 2025-01-07
**Total Documentation:** 251 files, 2.8 MB
**Status:** Complete and ready for use
