# Automated Website Monitoring with Anchor Browser

## Overview

This example demonstrates automating web monitoring using Trigger.dev's task scheduling capabilities combined with Anchor Browser's AI-powered browser automation. The system runs daily at 5pm ET to identify the cheapest Broadway tickets currently available for same-day performances.

**How it operates:**
- Trigger.dev manages scheduling and executes the monitoring task
- Anchor Browser initiates a remote browser session with an AI agent
- The AI agent leverages computer vision and natural language processing to examine the TDF website
- The AI agent identifies and returns the lowest-priced show with name, price, and showtime details

## Technology Stack

- **Node.js** (version 18.2+) - runtime environment
- **Trigger.dev** - task scheduling and orchestration
- **Anchor Browser** - AI-powered browser automation
- **Playwright** - browser automation libraries (external dependencies)

## Key Implementation

### Broadway Ticket Monitor Task

The task runs daily at 5pm ET (cron: `0 21 * * *`) and uses the Anchor Browser client to visit the TDF website. It sends a specific prompt requesting the show with the absolute lowest starting price, formatting the response as: `Show: [name], Price: [exact price], Time: [time]`.

The task includes proper error handling with a try-finally block that ensures the browser session is cleaned up after execution, logging warnings if cleanup fails.

### Build Configuration

Since Anchor Browser depends on Playwright libraries, the `trigger.config.ts` file excludes these dependencies (`playwright-core`, `playwright`, `chromium-bidi`) from the build bundle using the `external` array. The project is configured with a 3600-second (1-hour) maximum duration to accommodate web automation processing.

## Additional Resources

- [Anchor Browser documentation](https://anchorbrowser.io/docs) - explore AI-powered automation capabilities
- [GitHub repository](https://github.com/triggerdotdev/examples/tree/main/anchor-browser-web-scraper) - access complete source code
- [Example projects collection](/guides/introduction) - discover other Trigger.dev integrations
