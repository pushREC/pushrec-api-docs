---
source: https://docs.digitalocean.com/products/spaces/details/pricing/
scraped: 2025-01-07
tags: ["digitalocean", "storage", "api-docs", "spaces", "s3"]
---

# Spaces Pricing - DigitalOcean Documentation

## Overview

"Spaces Object Storage is an S3-compatible service for storing and serving large amounts of data." The service features an integrated CDN to reduce page load times and infrastructure costs.

## Base Subscription

The foundational Spaces plan costs "$5.00 per month" and permits creation of multiple buckets across the platform.

## Standard Storage

Users receive 250 GiB of storage included with the base subscription. "Additional storage beyond this allotment costs $0.02 per GiB per month." Billing is prorated hourly if you cancel your subscription.

## Bandwidth

The subscription includes 1,024 GiB of outbound transfer monthly, with "Additional outbound transfer is $0.01 per GiB." Inbound bandwidth is always free.

Free outbound transfer applies between Spaces and Droplets in specific region pairs (NYC3, SGP1, SFO2/SFO3, AMS3, FRA1, SYD1, and BLR1).

## Content Delivery Network

"The Spaces Content Delivery Network (CDN) is available at no additional cost." The included transfer allowance covers both CDN and origin bandwidth.

## Cold Storage

A lower-cost storage class for infrequently accessed data features tiered pricing:

- **Storage:** $0.007 per GiB monthly
- **Retrieval:** $0.01 per GiB (waived up to average daily usage)
- **Early deletion:** $0.007 per GiB (first 250 GiB monthly free)

Objects require 30-day minimum retention. Minimum charges apply to objects under 128 KiB and read operations.