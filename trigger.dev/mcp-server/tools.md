# MCP Tools Documentation - Trigger.dev

The Trigger.dev MCP Server provides AI assistants with a comprehensive toolkit for interacting with Trigger.dev projects. The system is organized into six categories of tools:

## Documentation and Search Tools

**search_docs** enables querying the Trigger.dev documentation. It accepts a required `query` parameter (string) to find information across code examples, API references, and guides. Example searches include "How do I create a scheduled task?" or "webhook examples".

## Project Management Tools

**list_projects** retrieves all projects in a Trigger.dev account without requiring parameters. It returns an array of project objects containing IDs, names, slugs, and organization metadata.

**list_orgs** lists all accessible organizations. No parameters are required.

**create_project_in_org** establishes a new project within an organization. It requires `orgParam` (organization slug or ID) and `name` (project name) parameters.

**initialize_project** sets up Trigger.dev in a project with automatic configuration. Required parameters include `orgParam`, `projectName`, and `cwd` (current working directory). The `projectRef` parameter is optional.

## Task Management Tools

**get_tasks** retrieves all tasks in a project. Optional parameters include `projectRef`, `configPath`, `environment` (defaulting to "dev"), and `branch` for preview environments.

**trigger_task** executes a task. Essential parameters include `projectRef`, `taskId`, and `payload` (valid JSON string). The `options` object supports nested properties like `queue.name`, `delay`, `idempotencyKey`, `machine`, `maxAttempts`, `maxDuration`, `tags`, and `ttl`.

## Run Monitoring Tools

**get_run_details** retrieves specific task run information using `runId`. It supports a `debugMode` boolean for enhanced trace information.

**cancel_run** terminates an in-progress task using the `runId`.

**list_runs** provides comprehensive run filtering with parameters for `status`, `taskIdentifier`, `version`, `tag`, date ranges (`from`/`to`), `period`, and `machine` type.

## Deployment Tools

**deploy** deploys projects to staging, production, or preview environments. Parameters include `environment` (defaulting to "prod"), with optional flags for `skipPromotion`, `skipSyncEnvVars`, and `skipUpdateCheck`.

**list_deployments** queries deployment history with filters for `status`, date ranges, and `period`.

**list_preview_branches** lists all preview branches within a project.

**Important Note:** The deploy tool and list_preview_branches tool are unavailable when the MCP server runs with the `--dev-only` flag.
