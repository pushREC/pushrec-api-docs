# CI / GitHub Actions - Trigger.dev Documentation

## Overview

The documentation explains how to deploy Trigger.dev tasks using GitHub Actions and other CI environments. While the instructions are GitHub-specific, the same concepts apply to other CI systems.

## Key Sections

### GitHub Actions Workflow Example

The guide provides sample workflow files for deploying to production and staging environments. The production workflow triggers automatically on pushes to the main branch, while the staging workflow requires manual triggering via `workflow_dispatch`.

Basic workflow structure includes:
- Checkout code with `actions/checkout@v4`
- Setup Node.js 20.x
- Install dependencies via npm
- Deploy using `npx trigger.dev@latest deploy`

### Personal Access Token Setup

The deployment process requires three steps:

1. **Create access token** - Generate a new token from your Trigger.dev profile's Personal Access Tokens section
2. **Add to GitHub secrets** - Navigate to repository Settings → Secrets and variables → Actions → New repository secret
3. **Configure token** - Name it `TRIGGER_ACCESS_TOKEN` and paste your access token value

### CLI Version Pinning

The documentation emphasizes that "the CLI and @trigger.dev/* package versions need to be in sync" to avoid errors. The recommendation is to:

- Add `trigger.dev` to `devDependencies` in `package.json`
- Create npm scripts for deployment commands
- Reference these scripts in GitHub Actions workflows
- This ensures version consistency across all deployments

### Self-Hosting Considerations

For self-hosted deployments, you must:

- Setup Docker Buildx in your CI environment
- Add registry credentials to GitHub secrets
- Specify `TRIGGER_API_URL` environment variable pointing to your webapp domain (e.g., `https://trigger.example.com`)

The self-hosted workflow includes additional steps for Docker authentication before deployment.
