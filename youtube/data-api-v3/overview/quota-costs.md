---
source: https://developers.google.com/youtube/v3/guides/quota_and_compliance_audits
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: overview
method: bright_data
---
 YouTube Data API v3: Quota and Compliance Audits

## Overview

The YouTube Data API implements a quota system designed to maintain service quality and prevent abuse. All projects enabling the YouTube Data API receive a default allocation of 10,000 units per day, which covers the needs of most developers.

### Key Points

- You can monitor your quota usage via the Quotas page in the Google API Console
- Requesting quota beyond the default requires completing a compliance audit first
- The audit process ensures projects align with the YouTube API Services Terms of Service

## Default Quota Allocation

- **10,000 units per day** - Default allocation for all projects

## Quota Costs by Operation Type

| Operation Type | Quota Cost |
|----------------|------------|
| Read operations | 1 unit |
| Write operations | 50 units |
| Search requests | 100 units |
| Video uploads | 100 units |

## Audit Requirements

To request additional quota, developers must demonstrate compliance with YouTube's policies. This verification process gives YouTube insight into how large projects intend to use the API and confirms the service is protected from misuse.

For detailed policy requirements, consult the Developer Policies Guide available on the YouTube developers site.

## Available Forms

### Initial Audit Request
Complete the "YouTube API Services - Audit and Quota Extension Form" to begin the audit process. A member of YouTube's API Services team will contact you.

### Additional Quota Extension
If you've completed an audit within the past 12 months but need more quota, use the "Audited Developer Requests Form."

### Appeal Process
Developers who failed an audit can submit the "Appeals Form" to challenge the decision.

### Periodic Audits
YouTube conducts ongoing compliance reviews. If contacted, complete the "Periodic Audit Form."

### Change of Control
Any ownership changes affecting an API project require submitting the "Change of Control Form" to YouTube immediately.

## Monitoring Quota Usage

Use the Google API Console Quotas page to:
- Track current usage against daily limits
- View quota consumption over time
- Identify which operations consume the most quota
