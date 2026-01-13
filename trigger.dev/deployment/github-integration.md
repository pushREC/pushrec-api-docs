# GitHub Integration Documentation - Trigger.dev

## Overview
Trigger.dev's GitHub integration enables automatic task deployments whenever code is pushed to your repository, eliminating manual deployment commands.

## How It Works
Once connected, the integration monitors tracked branches for production and staging environments. "Every push to a tracked branch creates a deployment in the corresponding environment."

## Setup Process

### Step 1: Install GitHub App
Navigate to project settings and click the installation option. This authorizes Trigger.dev for your organization or personal account.

### Step 2: Connect Repository
Select which repository to integrate with your project.

### Step 3: Configure Branch Tracking
Specify deployment branches:
- **Production**: Primary branch (typically `main`)
- **Staging**: Secondary deployment branch
- **Preview**: Optional pull request deployments

### Step 4: Customize Build Settings (Optional)
Configure three optional parameters:
- **Trigger config file path**: Default searches root; accepts relative paths like `apps/tasks/trigger.config.ts`
- **Install command**: Auto-detected; override if needed
- **Pre-build command**: Execute tasks before deployment (example: `pnpm run prisma:generate`)

## Branch Tracking Details

### Production & Staging Branches
"When you configure a production or staging branch, every push to that branch will trigger a deployment." Multiple consecutive pushes queue subsequent deployments until previous ones complete.

### Pull Requests
Pull requests automatically deploy to preview environments when enabled. Merging or closing PRs archives the corresponding preview branch.

## Disconnecting Repositories
Remove repository connections anytime from project git settings to stop automated deployments.

## Managing Repository Access
Manage app permissions through GitHub's Applications settings or via the connection modal in Trigger.dev.

## Build-Time Environment Variables

### TRIGGER_BUILD_ Prefix
"You can expose environment variables during the build and deployment process by prefixing them with `TRIGGER_BUILD_`." The prefix strips during build execution (e.g., `TRIGGER_BUILD_MY_TOKEN` becomes `MY_TOKEN`).

### Private npm Registry Authentication

**TRIGGER_BUILD_NPM_RC** environment variable enables private package authentication. Set its value to a base64-encoded `.npmrc` file containing registry credentials.

Example `.npmrc` structure:
```
//registry.npmjs.org/:_authToken=<YOUR_NPM_TOKEN>
@<YOUR_NAMESPACE>:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:always-auth=true
//npm.pkg.github.com/:_authToken=<YOUR_GITHUB_TOKEN>
```

Encode with: `cat .npmrc | base64`

"The build server will automatically create a `.npmrc` file in the installation directory based on the content of the `TRIGGER_BUILD_NPM_RC` environment variable."
