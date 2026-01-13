---
source: https://trigger.dev/docs/limits
scraped: 2026-01-13
---

# Limits - Trigger.dev Documentation

There are some hard and soft limits that you might hit when using Trigger.dev.

## Concurrency Limits

| Pricing Tier | Limit |
|---|---|
| Free | 10 concurrent runs |
| Hobby | 25 concurrent runs |
| Pro | 100+ concurrent runs |

Extra concurrency above the Pro tier limit is available through the dashboard. Click the "Concurrency" page from the left sidebar when on the Pro plan to purchase additional capacity.

## Rate Limits

| Limit | Details |
|---|---|
| API | 1,500 requests per minute |

You can request higher rate limits if you're on a paid plan.

The most common cause of hitting the API rate limit is calling `trigger()` on a task in a loop. Instead, use `batchTrigger()` to trigger multiple tasks in a single API call. You can have up to 1,000 tasks in a single batch trigger call with SDK 4.3.1+ (500 in prior versions).

## Queued Tasks

The number of queued tasks by environment:

| Environment | Limit |
|---|---|
| Dev | At most 500 |
| Staging | At most 10 million |
| Prod | At most 10 million |

## Schedules

| Pricing Tier | Limit |
|---|---|
| Free | 10 per project |
| Hobby | 100 per project |
| Pro | 1,000+ per project |

Additional bundles above the Pro tier are available for $10/month per 1,000 schedules. Contact support via email or Discord to request more.

When attaching schedules to tasks, strongly recommend adding them in the dashboard if they're "static" for easy per-environment control. If adding them dynamically using code, add a `deduplicationKey` to avoid duplicate schedule additions. Creating schedules for users will likely require requesting additional schedule capacity.

## Preview Branches

| Pricing Tier | Limit |
|---|---|
| Free | Not available |
| Hobby | 5 preview branches |
| Pro | 20+ preview branches |

Additional bundles above the Pro tier are available for $10/month per preview branch. Contact support for more.

## Realtime Connections

| Pricing Tier | Limit |
|---|---|
| Free | 10 concurrent connections |
| Hobby | 50 concurrent connections |
| Pro | 500+ concurrent connections |

Additional bundles are available for $10/month per 100 concurrent connections. Contact support for more.

## Task Payloads and Outputs

| Limit | Details |
|---|---|
| Single trigger payload | Must not exceed 3MB |
| Batch trigger payload | Each item up to 3MB (SDK 4.3.1+); prior: 1MB total combined |
| Task outputs | Must not exceed 10MB |

Payloads and outputs exceeding 512KB are offloaded to object storage with a presigned URL provided when calling `runs.retrieve`. Transparent upload/download handling occurs during operation.

## Batch Size

A single batch can have a maximum of 1,000 items with SDK 4.3.1+. Prior versions are limited to 500 items.

## Batch Trigger Rate Limits

Batch triggering uses a token bucket algorithm to rate limit runs per environment. Each run in a batch consumes one token.

| Pricing Tier | Bucket Size | Refill Rate |
|---|---|---|
| Free | 1,200 runs | 100 runs every 10 sec |
| Hobby | 5,000 runs | 500 runs every 5 sec |
| Pro | 5,000 runs | 500 runs every 5 sec |

**How it works**: Burst up to your bucket size, then tokens refill at the specified rate. For example, a Free user can trigger 1,200 runs immediately, then must wait for tokens to refill.

When hitting batch rate limits, the SDK throws a `BatchTriggerError` with `isRateLimited: true`. See the handling guide for detecting and reacting to rate limits in code.

## Batch Processing Concurrency

The number of batches that can be processed concurrently per environment:

| Pricing Tier | Limit |
|---|---|
| Free | 1 concurrent batch |
| Hobby | 10 concurrent batches |
| Pro | 10 concurrent batches |

This limits how many batches can have their items actively being processed into runs simultaneously.

## Log Retention

| Pricing Tier | Limit |
|---|---|
| Free | 1 day |
| Hobby | 7 days |
| Pro | 30 days |

## Log Size

Limits prevent oversized data from causing issues:

### Attribute Limits
- Span Attribute Count Limit: 256
- Log Attribute Count Limit: 256
- Span Attribute Value Length Limit: 131,072 characters
- Log Attribute Value Length Limit: 131,072 characters

### Event and Link Limits
- Span Event Count Limit: 10
- Link Count Limit: 2
- Attributes per Link Limit: 10
- Attributes per Event Limit: 10

### I/O Packet Length Limit
128 KB (131,072 bytes)

### Attribute Clipping Behavior
- Attributes exceeding the value length limit (1,028 characters) are discarded
- If total attributes exceed 256, additional attributes are not included

### Attribute Value Size Calculation
- Strings: Actual length
- Numbers: 8 bytes
- Booleans: 4 bytes
- Arrays: Sum of element sizes
- Undefined or null: 0 bytes

## Alerts

An alert destination is a single email address, Slack channel, or webhook URL:

| Pricing Tier | Limit |
|---|---|
| Free | 1 alert destination |
| Hobby | 3 alert destinations |
| Pro | 100+ alert destinations |

If on the Pro plan and needing more than the plan limit, contact support via email or Discord.

## Machines

The default machine is `small-1x` with 0.5 vCPU and 0.5 GB of RAM. Optionally configure higher spec machines to increase cost but improve performance for CPU or memory-bound tasks. See machine configurations for more details.

## Team Members

| Pricing Tier | Limit |
|---|---|
| Free | 5 team members |
| Hobby | 5 team members |
| Pro | 25+ team members |

Additional seats are available for $20/month per seat. Contact support to request more.
