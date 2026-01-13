# Docker Compose Self-Hosting Guide for Trigger.dev

## Overview

Trigger.dev v4 introduces simplified self-hosting via Docker Compose. The major architectural change combines the provider and coordinator into a single supervisor component, eliminating complex startup scripts.

## Key Improvements in v4

The new version features "much simpler setup" with `docker compose up` replacing previous multi-step processes. Additional enhancements include automatic container cleanup, horizontal worker scaling, resource limits enforcement, Docker Socket Proxy integration, network isolation, built-in container registry and object storage, and improved CLI commands.

## System Requirements

**Webapp Machine:**
- 3+ vCPU
- 6+ GB RAM
- Hosts webapp, PostgreSQL, Redis, and services

**Worker Machine:**
- 4+ vCPU
- 8+ GB RAM
- Hosts supervisor and task runs

Resource needs scale with concurrency. For example, "100 concurrency x small-1x (0.5 vCPU, 0.5 GB RAM) = 50 vCPU and 50 GB RAM."

## Installation Steps

Clone the repository, create `.env` from `.env.example`, then navigate to webapp or worker directories and execute `docker compose up -d`. Configuration occurs through environment variables before restarting containers.

## Worker Token Management

When running webapp and worker separately, "you will need to manually set the worker token." The webapp generates this token on first run and outputs it to console with explicit warning: "This will only be shown once."

## Registry and Storage Setup

The built-in registry defaults to `localhost:5000` with credentials `registry-user:very-secure-indeed`. The MinIO-based object storage uses endpoint `http://localhost:9000` with credentials `admin:very-safe-password`. Production deployments require secure credential updates.

## Authentication Options

Supports magic link authentication (default), Resend, SMTP, AWS SES, and GitHub OAuth. Email transport configuration is optional; without it, magic links are logged to console.

## CLI Usage

Use `npx trigger.dev@latest login -a http://trigger.example.com` for self-hosted instances. The tool supports multiple profiles for managing different Trigger.dev instances, with commands like `switch`, `list-profiles`, and profile-specific deployments.

## Production Considerations

"This guide alone is unlikely to result in a production-ready deployment." Security, scaling, and reliability require additional configuration beyond documented defaults. The platform offers cloud hosting as an alternative for organizations preferring managed services.
