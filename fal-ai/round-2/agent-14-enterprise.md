---
source: '[unknown - agent-14-enterprise.md]'
scraped: 2025-12-29
api_provider: FAL.ai
discovery_tier: 3
verified: false
---
 FAL.ai Enterprise Features - Complete Reference

> **Research Agent:** Round 2 - Gap-Filling
> **Topic:** Enterprise Features, SOC2, SSO, SLA, Pricing
> **Created:** 2025-12-29
> **Words:** ~5,200
> **Status:** Complete

---

## Executive Summary

FAL.ai is a San Francisco-based generative AI infrastructure company valued at over $4 billion (October 2025). With backing from Andreessen Horowitz, Salesforce Ventures, Shopify Ventures, and Google AI Futures Fund, FAL.ai serves Fortune 500 companies including Adobe, Canva, Shopify, and Perplexity. The platform serves 500,000+ developers producing 50+ million AI-generated creations daily across 600+ model endpoints.

---

## Table of Contents

1. [Enterprise Plans & Pricing](#1-enterprise-plans--pricing)
2. [Security & Compliance](#2-security--compliance)
3. [SSO & Authentication](#3-sso--authentication)
4. [Dedicated Infrastructure](#4-dedicated-infrastructure)
5. [SLA Guarantees](#5-sla-guarantees)
6. [Support Options](#6-support-options)
7. [Billing & Invoicing](#7-billing--invoicing)
8. [API Features](#8-api-features)
9. [Enterprise Customers](#9-enterprise-customers)
10. [Legal Considerations](#10-legal-considerations)

---

## Related Documentation

- [[agent-01-core-api|Core API Reference]]
- [[agent-08-billing-usage|Billing & Usage]]
- [[agent-12-serverless|Serverless Deployment]]
- [[agent-13-errors|Error Handling]]

---

## 1. Enterprise Plans & Pricing

### Plan Tiers

**Free Tier:**
- Basic model API access
- 2 concurrent tasks per user
- Promotional credits expire in 90 days
- Suitable for prototyping

**Pay-Per-Use (Standard):**
- Usage-based, no upfront commitment
- Output-based or GPU-based pricing
- Purchased credits expire in 365 days
- Credit/debit cards, ACH (USD only)

**Enterprise Plan:**
- Custom pricing based on volume
- Invoice-based payments
- Volume discounts
- Dedicated account management
- Custom rate limits
- SLA guarantees
- 24/7 priority support

### GPU Fleet Pricing

| GPU Type | VRAM | Hourly Rate | Per-Second |
|----------|------|-------------|------------|
| H100-SXM | 80GB | $1.89/hr | $0.0005/sec |
| H200-SXM | 141GB | $2.10/hr | $0.0006/sec |
| A100 | 40GB | $0.99/hr | $0.0003/sec |
| B200 | 184GB | Contact Sales | Custom |

### Video Model Pricing

| Model | Unit | Price | Output per $1 |
|-------|------|-------|---------------|
| Wan 2.5 | per second | $0.05 | 20 seconds |
| Kling 2.5 Turbo Pro | per second | $0.07 | 14 seconds |
| Veo 3 | per second | $0.40 | 3 seconds |
| Ovi | per video | $0.20 | 5 videos |

### Image Model Pricing

| Model | Unit | Price | Output per $1 |
|-------|------|-------|---------------|
| Seedream V4 | per image | $0.03 | 33 images |
| FLUX Kontext Pro | per image | $0.04 | 25 images |
| FLUX.1 [dev] | per image | $0.025 | 40 images |

### Training Pricing

| Training Type | Price |
|---------------|-------|
| FLUX.2 [dev] Trainer | $0.008/step |
| Z-Image Turbo LoRA | $2.26/1,000 steps |

### Billing Rules

- 422 errors (user error) **are billed**
- 5xx errors (server error) **are not billed**
- Cold starts are **not charged**
- Credits: non-refundable, non-transferable

---

## 2. Security & Compliance

### Compliance Certifications

| Certification | Status |
|---------------|--------|
| **SOC 2 Type II** | Compliant |
| **ISO 27001** | Compliant |
| **GDPR** | Compliant |
| **HIPAA** | Compliant |
| **PCI DSS** | Compliant |
| **FedRAMP** | Compliant |
| **CSA STAR Level 1** | Compliant |

### Trust Center

Access at **trust.fal.ai**:
- Compliance documentation
- Security control details
- Audit reports
- Compliance posture updates

### Data Protection

**Enterprise Data Commitment:**
- "Your data stays yours, period"
- Never trains LLMs on enterprise data
- Highest security and privacy standards
- Protection from unauthorized access

**Data Retention:**
- Generated files: minimum 7 days
- After 7 days: may be deleted
- Enterprise: extended retention negotiable

**GDPR Features:**
- Data subject rights supported
- Processing agreements available
- EU/UK/Switzerland DPA support

### Security Measures

**Infrastructure:**
- Enterprise-grade encryption
- Real-time threat monitoring
- Suspicious behavior alerts
- Continuous data monitoring
- Supply chain: Google Cloud, Auth0, Cloudflare

**API Security:**
- API key authentication
- ED25519 webhook signatures
- JWKS key rotation
- Signature verification

---

## 3. SSO & Authentication

### SSO Support

- Identity provider integration
- Centralized authentication
- Multiple IdP support
- Reduced password breach risk

### Authentication Methods

| Method | Status |
|--------|--------|
| Google Login | Supported |
| Microsoft Login | Supported |
| SSO (SAML/OAuth) | Supported |
| SMS 2FA | Supported |
| Email 2FA | Supported |
| Hardware Token (U2F) | Supported |
| Software TOTP | Supported |

### Team Management

**Organization Features:**
- Centralized billing
- Administrator controls
- Member add/remove
- Access control
- Activity monitoring

**API Key Management:**
- Multiple scopes (API, Admin)
- Team-specific keys
- Profile switching: `fal profile`
- Team switching: `fal team`
- Dashboard: fal.ai/dashboard/keys

### Access Control

- Role-based access (RBAC)
- Granular permissions
- Resource access by team
- Audit logging

---

## 4. Dedicated Infrastructure

### FAL Compute Platform

**Instance Types:**

| Type | CPU | RAM | GPU VRAM | Storage |
|------|-----|-----|----------|---------|
| 1xH100-SXM | 16 | 200GB | 80GB | 1TB SSD |
| 8xH100-SXM | 128 | 1600GB | 640GB | 8TB SSD |

**Hardware Options:**
- NVIDIA H100 (80GB)
- NVIDIA H200 (141GB)
- NVIDIA B200 (184GB)
- NVIDIA A100 (40GB)
- Thousands of GPUs globally
- Multi-GPU inference/training

### Infrastructure Features

**Dedicated Resources:**
- Full GPU control
- Guaranteed availability
- No contention
- Predictable performance

**Storage:**
- High-speed SSD (up to 8TB)
- Low-latency I/O
- Large dataset handling

**Networking:**
- InfiniBand interconnect
- High-bandwidth transfer
- Optimized distributed training

### Private Endpoints

**Features:**
- Deploy private/fine-tuned models
- Bring your own weights
- Secure custom endpoints
- SOC 2 compliant
- Usage analytics

**Model Hosting:**
- Proprietary models secure
- Custom Docker containers
- ComfyUI support
- Model exclusivity guaranteed

### Global Distribution

- Latest NVIDIA hardware globally
- Inference near users
- Multiple cloud providers
- Custom inference engine (10x faster)
- Cold starts <10 seconds
- 10+ TB/hr ingestion
- 100+ TB global storage

---

## 5. SLA Guarantees

### Uptime Commitment

**Published SLA:** 99.99% uptime

**Performance Benchmarks:**

| Metric | Performance |
|--------|-------------|
| Uptime | 99.99% |
| Cold Start | <10 seconds |
| Inference Speed | Up to 10x faster |
| Daily Capacity | 100M+ calls |
| Data Ingestion | 10+ TB/hour |

### Enterprise SLA Features

- Custom SLA agreements
- SLA guarantees in enterprise tier
- Dedicated infrastructure
- 24/7 priority support
- Guaranteed resource availability

### Service Suspension Conditions

May suspend for:
- Terms of Service violation
- Fraudulent activity
- Service interference
- Court/government orders
- Non-payment (10-day notice)
- Security threats

---

## 6. Support Options

### Enterprise Support

**24/7 Priority Support:**
- Included in enterprise tier
- Priority queue access
- Real-time availability

**Dedicated Account Management:**
- Enterprise Account Managers
- Strategic guidance
- Portfolio management
- Partnership approach

### Technical Support

**ML Engineer Collaboration:**
- Direct engineer access
- Custom model co-development
- Performance optimization
- Bespoke kernel development
- Tailored AI solutions

**Applied ML Engineering:**
- Custom solutions
- Optimization consultation
- Architecture guidance
- Training assistance

### Resources

- Documentation: docs.fal.ai
- 600+ model endpoints documented
- Integration guides
- Code examples

### SDKs

- Python SDK
- JavaScript/TypeScript SDK
- PHP client
- Laravel integration
- REST API

### Contact

- Sales: fal.ai/enterprise
- Email: support@fal.ai
- Legal: legal@fal.ai
- Address: 2261 Market St. Suite 10467, San Francisco, CA 94114

---

## 7. Billing & Invoicing

### Payment Methods

**Standard:**
- Credit/debit cards
- ACH (USD only)
- Third-party processor

**Enterprise:**
- Invoice-based payments
- Custom payment terms
- Volume discounts
- Enterprise agreements

### Credit System

**Mechanics:**
- Pre-purchase credits
- Real-time deductions
- Dashboard visibility

**Expiration:**
- Purchased: 365 days
- Promotional: 90 days
- Non-refundable

### Usage API

**Endpoint:** `GET /v1/models/usage`

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| limit | integer | Max items |
| cursor | string | Pagination |
| start | datetime | Start date |
| end | datetime | End date |
| timezone | string | Bucketing zone |
| timeframe | enum | minute/hour/day/week/month |
| endpoint_id | string/array | Filter endpoints |
| expand | string/array | time_series, summary |

**Response:**
- Time-bucketed records
- Endpoint identifiers
- Billing units
- Quantity consumed
- Unit price and cost
- Currency (ISO 4217)

### Pricing API

**Endpoint:** `GET /v1/models/pricing`

- Unit pricing for 600+ endpoints
- 1-50 endpoint IDs per request
- Pagination support

---

## 8. API Features

### Rate Limits

**Standard:** 2 concurrent tasks per user

**Enterprise:**
- Scalable limits
- Custom configurations
- Priority queue
- Guaranteed capacity

### Processing Modes

**Synchronous:** `https://fal.run`
- Immediate response
- Best for real-time

**Queue-Based:** `https://queue.fal.run`
- Recommended for most cases
- Better reliability
- Request tracking

**WebSocket:**
- Real-time bidirectional
- Minimal latency
- Status streaming

### Webhooks

**Configuration:**
- `fal_webhook` parameter
- Automatic POST on completion
- No polling needed

**Reliability:**
- 10 retries over 2 hours
- ED25519 signatures
- Origin verification

### Custom Model Hosting

**Private Serverless:**
- Custom models/apps/workflows
- Same infrastructure as FAL
- Python deployment
- GPU type specification

**Deployment Options:**
- Ephemeral: `fal run`
- Permanent: `fal deploy`
- Multi-GPU: `num_gpus`

**Supported:**
- Text-to-image
- Text-to-video
- Text-to-speech
- Text-to-music
- Custom Docker
- ComfyUI

### Fine-Tuning

**FLUX.2 [dev] Trainer:**
- LoRA fine-tuning
- Brand visual language
- Character generation
- Style transfer
- Commercial use

**Z-Image Trainer:**
- 6B parameter base
- Cost-effective training

**Preference Fine-Tuning:**
- REST API data collection
- Private datasets
- One-click training
- Improved alignment

---

## 9. Enterprise Customers

### Notable Customers

| Company | Industry |
|---------|----------|
| Adobe | Creative Software |
| Canva | Design Platform |
| Shopify | E-commerce |
| Perplexity | AI Search |

### Platform Scale

| Metric | Value |
|--------|-------|
| Developers | 500,000+ |
| Daily Creations | 50,000,000+ |
| Model Endpoints | 600+ |
| Valuation | $4B+ |

### Investment

**Recent Funding:**
- October 2025: ~$250M at $4B+ valuation
- July 2025: $125M Series C at $1.5B

**Investors:**
- Andreessen Horowitz
- Salesforce Ventures
- Shopify Ventures
- Google AI Futures Fund
- Bessemer Venture Partners
- Notable Capital

---

## 10. Legal Considerations

### Liability Limitations

**Damage Cap:**
- Greater of $50 or 12-month payments
- Excludes indirect damages
- Lost profits excluded
- Exception: gross negligence, fraud

### Intellectual Property

**Company Ownership:**
- FAL.ai owns platform rights
- Software, algorithms, models, workflows

**Customer Input:**
- Customer retains ownership
- FAL.ai gets processing license
- Non-exclusive, royalty-free

**Output:**
- No originality warranty
- No IP non-infringement guarantee
- Customer responsible for usage

### Indemnification

Customer indemnifies FAL.ai for:
- Customer input IP infringement
- Customer breach of Terms
- Customer misconduct
- End User actions
- Customer Solutions

### Dispute Resolution

**Mandatory Arbitration:**
- Binding under FAA rules
- AAA administration
- No class actions
- Jury trial waived
- 30-day opt-out window

**Filing Limitation:**
- Claims within one year
- 30-day informal resolution first

### Prohibited Uses

- Facial recognition databases (no consent)
- Real-time biometric ID (law enforcement)
- Deepfakes, biometric ID, unlawful activities
- Metadata extraction for personal info
- Developing competing products

---

## Implementation Checklist

### Pre-Contract

- [ ] Contact enterprise sales
- [ ] Request custom pricing
- [ ] Negotiate SLA terms
- [ ] Review data processing agreement
- [ ] Confirm compliance certifications
- [ ] Evaluate infrastructure requirements

### Technical Setup

- [ ] Configure SSO integration
- [ ] Set up team organization
- [ ] Establish API key management
- [ ] Configure webhooks with verification
- [ ] Implement usage monitoring
- [ ] Set up billing dashboards

### Operational

- [ ] Document incident response
- [ ] Establish support escalation
- [ ] Configure data retention
- [ ] Set up rate limit monitoring
- [ ] Implement cost allocation

---

## Sources

- [FAL.ai Enterprise](https://fal.ai/enterprise)
- [FAL.ai Pricing](https://fal.ai/pricing)
- [FAL.ai Documentation](https://docs.fal.ai/)
- [FAL.ai Terms of Service](https://fal.ai/terms)
- [FAL.ai Privacy Policy](https://fal.ai/privacy)
- [FAL.ai Trust Center](https://trust.fal.ai/controls)
- [FAL.ai Compute](https://docs.fal.ai/compute)
- [Private Serverless Models](https://docs.fal.ai/private-serverless-models/)
- [Usage API](https://docs.fal.ai/platform-apis/v1/models/usage)
- [Pricing API](https://docs.fal.ai/platform-apis/v1/models/pricing)
