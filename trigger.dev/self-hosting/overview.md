# Trigger.dev Self-Hosting Overview

## Key Concepts

Self-hosting Trigger.dev means running and managing the platform on your own infrastructure. This approach provides full control over your environment, deployment process, and exposed service URLs, but you assume complete responsibility for provisioning resources, updates, security, scaling, and reliability.

## When to Self-Host

Trigger.dev Cloud offers a fully managed, scalable experience with dedicated support. However, self-hosting becomes attractive when you have specific requirements around data residency, compliance, or infrastructure control. The self-hosted version provides comparable functionality to the cloud offering, though the managed infrastructure is specifically designed for high availability, security, and scalability.

**Important caveat:** Since Trigger.dev doesn't manage self-hosted instances, performance guarantees don't apply to your deployment. You bear all responsibility and risk regarding security, uptime, and data integrity.

## Architecture

The self-hosted deployment consists of containerized components split into two independently scalable parts:

- **Webapp**: Contains the dashboard, Redis, and Postgres services
- **Worker**: Houses the supervisor and runners that execute tasks

## Feature Comparison

| Feature | Cloud | Self-Hosted |
|---------|-------|------------|
| Warm starts | ✅ | ❌ |
| Auto-scaling | ✅ | ❌ |
| Checkpoints | ✅ | ❌ |
| Dedicated support | ✅ | ❌ |
| Community support | ✅ | ✅ |
| ARM support | ✅ | ✅ |

## Configurable Limits

Most operational limits are configurable via environment variables on the webapp container, including concurrency, rate limits, task payloads, batch sizes, and log sizes. Some hardcoded exceptions exist: I/O packet length (128KB), alerts, schedules, team members, and preview branches.

## Machine Configuration Override

You can customize machine specifications by setting the `MACHINE_PRESETS_OVERRIDE_PATH` environment variable to reference a JSON file defining CPU and memory allocations. Partial overrides are supported, allowing selective modifications to specific machine types.

## Support Resources

The self-hosting community channel on Discord provides peer support and guidance for implementation challenges.
