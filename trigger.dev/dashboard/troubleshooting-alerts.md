# Trigger.dev Alerts Documentation

## Overview

Trigger.dev supports alerts for three key events: run failures, deployment failures, and successful deployments. Users can configure notifications through email, Slack, or webhooks.

## Setup Instructions

The alert creation process involves three main steps:

1. **Create Alert**: Access the Alerts menu and select "New alert" to open the configuration modal
2. **Choose Notification Method**: Select between email, Slack notifications, or webhook delivery
3. **Manage Alerts**: Use the triple-dot menu to disable or delete existing alerts

## Alert Webhooks

For webhook integration, the SDK provides a `webhooks.constructEvent()` method to parse and verify webhook payloads. The example demonstrates handling webhook events in a Remix action function, including:

- Event type switching for `alert.run.failed`, `alert.deployment.success`, and `alert.deployment.failed`
- Error handling with `WebhookError` exception catching
- Proper HTTP response codes (200 for success, 400 for validation errors, 500 for server errors)

## Webhook Payload Structure

All webhook events share common properties:
- **id**: Unique event identifier
- **created**: Event timestamp
- **webhookVersion**: Payload format version
- **type**: Event classification

### Run Failed Alert Payload

Contains comprehensive task and run details including identifiers, timestamps, status, error information, machine specifications, and associated organizational/project metadata.

### Deployment Alerts

**Success**: Includes deployment ID, version, status, completion timestamp, task arrays, and environment information.

**Failure**: Contains deployment data plus error details (name, message, stack trace, stderr output).

Both include organization, project, and environment context.
