# Sequin Database Triggers Guide Summary

## Overview
This guide demonstrates integrating Sequin with Trigger.dev to automate tasks triggered by database changes. The example creates embeddings for posts whenever they're inserted or updated in a PostgreSQL database.

## Key Components

**Architecture Flow:**
Sequin captures database changes → Sends webhook payload → Next.js API endpoint → Triggers Trigger.dev task → Updates database with results

## Prerequisites
- Next.js project with Trigger.dev installed
- Sequin account
- PostgreSQL database v12+
- Post table for demonstration

## Implementation Steps

**1. Create Trigger.dev Task**
Build an async function that receives Sequin change events, processes them (generating embeddings via OpenAI), and updates the database using pg client.

**2. Set Up API Route**
Create a Next.js route handler at `/app/api/create-embedding-for-post/route.ts` that:
- Validates authorization headers against `SEQUIN_WEBHOOK_SECRET`
- Parses incoming JSON payload
- Calls `tasks.trigger()` with the task name and payload

**3. Configure Environment Variables**
Required: `SEQUIN_WEBHOOK_SECRET`, `TRIGGER_SECRET_KEY`, `OPENAI_API_KEY`, `DATABASE_URL`

**4. Connect Sequin to Database**
- Register database connection
- Execute SQL commands creating publication and replication slot
- Set up HTTP endpoint with localhost tunneling using Sequin CLI

**5. Create Push Consumer**
Configure Sequin to:
- Monitor the posts table
- Process all rows sorted by updated_at
- Push changes to your API endpoint
- Include Bearer token authentication

## Testing Workflow
1. Run dev environment (Next.js, Trigger.dev, Sequin tunnel)
2. Insert test post into database
3. Verify delivery via Sequin Trace dashboard
4. Confirm 200 response in terminal
5. Monitor task execution in Trigger.dev dashboard

## Production Considerations
- Add retry logic for error handling
- Deploy endpoint to production
- Update consumer configuration for production database
- Configure all environment variables in Trigger.dev
