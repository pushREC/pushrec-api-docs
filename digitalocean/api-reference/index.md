# DigitalOcean API Reference - Quick Index

**Agent 10 Harvest - 2026-01-07**
**167 URLs | 100% Success | 1.4 MB**

---

## Core Documentation

| File | Description | Size |
|------|-------------|------|
| [index.md](./index.md) | Main API overview and navigation | 9.1 KB |
| [digitalocean.md](./digitalocean.md) | DigitalOcean API reference entry point | 4.2 KB |
| [create-personal-access-token.md](./create-personal-access-token.md) | How to create and manage PATs | 10.6 KB |
| [oauth.md](./oauth.md) | OAuth 2.0 implementation guide | 14.1 KB |
| [metadata.md](./metadata.md) | Droplet Metadata API reference | 4.2 KB |
| [spaces.md](./spaces.md) | Spaces (S3-compatible) API reference | 39.0 KB |
| [scopes.md](./scopes.md) | Token scopes overview | 15.3 KB |

---

## Resource Categories (36 total)

### Compute (4 categories)
- **Droplets**: 6 files (admin, create, read, update, delete)
- **Kubernetes**: 6 files (access_cluster, create, read, update, delete)
- **App Platform**: 6 files (access_console, create, read, update, delete)
- **Functions**: 6 files (admin, create, read, update, delete)

### Storage (6 categories)
- **Block Storage**: 4 files
- **Block Storage Actions**: 3 files
- **Block Storage Snapshots**: 4 files
- **Spaces**: 3 files
- **Spaces Keys**: 7 files
- **Snapshots**: 3 files
- **Images**: 5 files

### Networking (7 categories)
- **Load Balancers**: 5 files
- **Firewalls**: 5 files
- **VPC**: 5 files
- **VPC Peering**: 5 files
- **Reserved IPs**: 5 files
- **Domains**: 5 files
- **CDN**: 5 files
- **Certificates**: 4 files

### Database (1 category)
- **Databases**: 6 files (includes view_credentials)

### Developer & Monitoring (3 categories)
- **Registry**: 5 files
- **Monitoring**: 5 files
- **Uptime**: 5 files

### Advanced Features (3 categories)
- **GenAI**: 5 files
- **Partner Network Connect**: 6 files (includes view_credentials)
- **Vendor Portal**: 5 files

### Account & Management (8 categories)
- **Account**: 2 files
- **Billing**: 2 files
- **Projects**: 5 files
- **SSH Keys**: 5 files
- **Tags**: 4 files
- **Actions**: 2 files
- **Regions**: 2 files
- **Sizes**: 2 files

### Add-ons (2 categories)
- **Addons**: 5 files
- **API**: 3 files

---

## CRUD Operation Coverage

| Operation | Resource Count |
|-----------|----------------|
| **Create** | 28 resources |
| **Read** | 34 resources |
| **Update** | 24 resources |
| **Delete** | 23 resources |

**Special Permissions**: admin, access_console, access_cluster, view_credentials, create_credentials

---

## Quick Search by Use Case

### Terraform Provider Development
1. Start: `digitalocean.md`
2. Auth: `create-personal-access-token.md`
3. Scopes: `scopes.md` + resource-specific files
4. Reference: All `scopes/*/` directories

### API Automation Scripts
1. Auth: `oauth.md` or `create-personal-access-token.md`
2. Endpoints: Resource-specific scope files
3. Examples: `oauth.md` (cURL examples)

### Security Auditing
1. Overview: `scopes.md`
2. Details: All `scopes/*/` files
3. Best practices: `create-personal-access-token.md`

---

## File Organization

```
api-reference/
├── Core docs (7 files)
│   ├── index.md, digitalocean.md, oauth.md
│   ├── create-personal-access-token.md
│   ├── metadata.md, spaces.md, scopes.md
│
└── scopes/ (160 files across 36 resources)
    ├── account/ (2), actions/ (2), addon/ (5)
    ├── api/ (3), app/ (6), billing/ (2)
    ├── block_storage/ (4), block_storage_action/ (3)
    ├── block_storage_snapshot/ (4), cdn/ (5)
    ├── certificate/ (4), database/ (6), domain/ (5)
    ├── droplet/ (6), firewall/ (5), function/ (6)
    ├── genai/ (5), image/ (5), kubernetes/ (6)
    ├── load_balancer/ (5), monitoring/ (5)
    ├── partner_network_connect/ (6), project/ (5)
    ├── regions/ (2), registry/ (5), reserved_ip/ (5)
    ├── sizes/ (2), snapshot/ (3), spaces/ (3)
    ├── spaces_key/ (7), ssh_key/ (5), tag/ (4)
    ├── uptime/ (5), vendor_portal/ (5), vpc/ (5)
    └── vpc_peering/ (5)
```

---

## Statistics

- **Total Files**: 168 (167 docs + 1 report)
- **Total Size**: 1.4 MB
- **Resource Categories**: 36
- **Success Rate**: 100%
- **Quality Score**: 100% (All files > 500 bytes, proper frontmatter)

---

**See also:**
- [HARVEST-SUMMARY.md](./HARVEST-SUMMARY.md) - Detailed analysis
- [SCRAPE-REPORT.md](./SCRAPE-REPORT.md) - Scraping statistics
