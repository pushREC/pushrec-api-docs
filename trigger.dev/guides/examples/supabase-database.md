# Supabase Database Operations Using Trigger.dev

## Overview
This documentation demonstrates how to execute fundamental CRUD operations on Supabase database tables using Trigger.dev.

## Task 1: Add New User to Table

### Key Features
- Sets up Supabase client using `@supabase/supabase-js` library
- Implements row insertion via `insert` method

### Prerequisites
- Active Supabase account with project
- Table named `user_subscriptions`
- Column `user_id` with text data type

### Implementation Example
The task creates JWT tokens for authenticated access, initializes a Supabase client with authorization headers, and inserts new user records into the `user_subscriptions` table. Error handling throws exceptions if JWT secrets are undefined or insertion fails.

### Testing
Use payload `{"userId": "user_12345"}` in the Trigger.dev dashboard to verify successful row creation.

## Task 2: Update User Subscription

### Key Features
- Determines whether to insert or update based on existing records
- Uses `update` method for existing subscriptions
- Employs `AbortTaskRunError` to halt execution without retry for invalid plan types

### Prerequisites
- Supabase project with `user_subscriptions` table
- Columns: `user_id` (text), `plan` (text), `updated_at` (timestamptz)

### Implementation Details
This task accepts allowed plan types: "hobby," "pro," and "enterprise." It queries existing subscriptions, performs conditional inserts or updates, and manages timestamps automatically.

### Test Payload
```json
{
  "userId": "user_12345",
  "newPlan": "pro"
}
```

## Security Considerations
The update task uses service role keys to bypass Row Level Security. Ensure proper RLS policy configuration for your specific requirements.

## Additional Resources
- Edge function integration guides
- Database webhook triggers
- Supabase authentication patterns for RLS and admin access
- Storage upload examples
