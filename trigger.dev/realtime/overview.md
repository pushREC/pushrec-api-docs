# Trigger.dev Realtime Overview

## Core Functionality

Trigger.dev Realtime enables real-time triggering, subscription, and monitoring of task runs. The platform supports multiple subscription scopes:

- **Individual runs**: Monitor specific run progress by ID
- **Tagged runs**: Track all runs with particular tags (e.g., `user:123`)
- **Batch runs**: Subscribe to all runs within a batch
- **Trigger + subscribe**: Initiate a task and immediately subscribe to updates (frontend only)

## Real-Time Updates

Subscribers receive complete run objects with automatic updates for:

- **Status transitions**: Tracking progression through queued → executing → completed states
- **Metadata changes**: Custom progress tracking and user data modifications
- **Tag modifications**: Addition or removal of run tags
- **Realtime Streams**: Live data streaming from tasks, particularly useful for AI/LLM outputs

## Implementation Approaches

### Frontend Integration
React hooks provide real-time UI updates during task execution. This approach suits progress indicators, status displays, and live dashboards.

### Backend Implementation
Server-side SDK enables subscription from backend code, other tasks, or serverless environments. Ideal for workflow orchestration, notifications, and database updates triggered by run status changes.

### Authentication Requirements
All realtime operations require secure authentication to protect run data and control access.
