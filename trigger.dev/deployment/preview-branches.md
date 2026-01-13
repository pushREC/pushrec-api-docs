# Preview Branches - Trigger.dev Documentation

## Overview

Preview branches create isolated testing environments for each git branch, enabling developers to test code changes before merging to production. The preview environment functions as a parent from which individual branches are created.

## Key Features

According to the documentation, preview branches support "all the features you're used to from other environments (like staging or production). That means you can trigger runs, have schedules, test them, use Realtime, etc."

## Implementation Workflow

The recommended process involves four steps:

1. Create a preview branch
2. Deploy to the preview branch (one or more times)
3. Trigger runs using Preview API credentials and branch names
4. Archive the preview branch when work completes

## Active Preview Branch Limits

Restrictions exist per project based on subscription tier:

- **Free Plan:** 0 active branches
- **Hobby Plan:** 5 active branches
- **Pro Plan:** 20 active branches (with paid upgrades available)

Archived branches remain viewable in dashboards but cannot execute new runs or write operations.

## Configuration Requirements

Two environment variables are essential:

- `TRIGGER_SECRET_KEY`: Preview API authentication token
- `TRIGGER_PREVIEW_BRANCH`: Target branch identifier

## Deployment Methods

**GitHub Actions (Recommended):** Automates creation on pull request opening, deployment on push, and archival on merge/close.

**Manual CLI:** Developers can manually deploy using `npx trigger.dev@latest deploy --env preview` or archive branches with the preview archive command.

## Environment Variable Management

Variables can be set globally for the preview environment or for specific branches, with branch-specific values taking precedence. The `syncEnvVars()` and `syncVercelEnvVars()` build extensions enable automatic synchronization during deployment.
