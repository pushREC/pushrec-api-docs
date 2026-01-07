---
source: '[unknown - README.md]'
scraped: '2026-01-07'
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
# DigitalOcean Networking Documentation

Complete documentation harvest from DigitalOcean's networking products.

## Overview

This directory contains comprehensive documentation for all DigitalOcean networking products:

- **VPC (Virtual Private Cloud)** - Private network isolation and connectivity
- **Load Balancers** - Traffic distribution and high availability
- **Firewalls** - Network security and access control
- **DNS** - Domain name system management
- **Reserved IPs** - Static IP addressing (including BYOIP)
- **IPv6** - IPv6 networking configuration

## Statistics

- **Total Files:** 134
- **Total Size:** 1.2 MB
- **Success Rate:** 100%
- **Scraped:** 2025-01-07

## Directory Structure

```
networking/
├── dns/                (19 files) - Domain and DNS record management
├── firewalls/          (18 files) - Cloud firewall configuration
├── ipv6/               (15 files) - IPv6 enablement and configuration
├── load-balancers/     (25 files) - Load balancer setup and management
├── reserved-ips/       (23 files) - Static IP management and BYOIP
├── vpc/                (33 files) - VPC, peering, NAT gateway, partner attachments
└── general/            (1 file)  - Networking overview
```

## Categories

### VPC (33 files)
- Network planning and CIDR blocks
- VPC peering connections
- NAT Gateway configuration
- Partner Network Connect
- Resource migration
- Best practices

### Load Balancers (25 files)
- Regional and Global load balancers
- SSL/TLS termination and passthrough
- Health checks
- Scaling strategies
- CLI usage (doctl)

### Reserved IPs (23 files)
- Floating IP management
- BYOIP (Bring Your Own IP)
- Anchor IPs
- Outbound traffic configuration

### DNS (19 files)
- Domain management
- Record types (A, AAAA, CNAME, MX, TXT, NS, SRV, CAA)
- Zone file management
- DNS registrar integration

### Firewalls (18 files)
- Rule configuration (inbound/outbound)
- Droplet management
- Organization strategies
- Security best practices

### IPv6 (15 files)
- Enabling IPv6 on Droplets
- IPv6-only configuration
- Additional address configuration

## Quality

All files include:
- ✅ Complete frontmatter with source URL
- ✅ Comprehensive tags (digitalocean, networking, category, api-docs)
- ✅ Preserved code examples and CLI commands
- ✅ Minimum 500 bytes (average: 9.2 KB)

## Usage

### Search by Topic
```bash
# Find firewall rules
grep -r "inbound-rules\|outbound-rules" firewalls/

# Find DNS record types
grep -r "A record\|CNAME\|MX record" dns/

# Find VPC peering
grep -r "peering\|CIDR" vpc/
```

### Browse by Category
- See individual category directories for organized documentation
- Each file named descriptively (e.g., `vpc-how-to-create-nat-gateway.md`)

## Key Files

### Comprehensive Guides
- `load-balancers/load-balancers-how-to-manage.md` (37 KB)
- `dns/dns-how-to-manage-records.md` (27 KB)
- `firewalls/firewalls-how-to-configure-rules.md` (26 KB)

### Advanced Topics
- `vpc/vpc-how-to-create-partner-attachment.md`
- `reserved-ips/reserved-ips-how-to-provision-byoip.md`
- `load-balancers/load-balancers-how-to-create-global-load-balancer.md`

## Source

All documentation scraped from: https://docs.digitalocean.com/products/networking/

## Report

See `HARVEST-REPORT.md` for detailed scraping statistics and quality metrics.

---

*Last Updated: 2025-01-07*
*Scraped by: Agent 7 (bright-data-skill)*
