# Authenticating Supabase Tasks: JWTs and Service Roles

## Overview

Trigger.dev provides two authentication methods for Supabase clients in tasks:

### 1. JWT Authentication (Recommended for User-Specific Operations)

**What it is:** "A JWT (JSON Web Token) is a string-formatted data container that typically stores user identity and permissions data."

**Setup requirements:**
- Add `SUPABASE_JWT_SECRET` environment variable to your project
- This secret signs JWTs and is found in Supabase project settings under "Data API"

**How it works:**
The example demonstrates creating a token for a user, then initializing a Supabase client using that token in the Authorization header. This approach allows tasks to perform database operations with the specific user's permissions.

**Key implementation steps:**
1. Extract the JWT secret from environment variables (with error handling)
2. Sign a JWT token with the user ID, setting an expiration time (e.g., "1h")
3. Pass the token via Authorization header when creating the Supabase client
4. Initialize with `SUPABASE_URL` and `SUPABASE_ANON_KEY`

**Security benefits:** "Using JWTs to authenticate Supabase operations is more secure than using service role keys because it respects Row Level Security policies, maintains user-specific audit trails, and follows the principle of least privileged access."

### 2. Service Role Key (For Admin-Level Access)

**What it does:** Provides unlimited access, bypassing all security checks.

**Critical warning:** "The service role key has unlimited access and bypasses all security checks. Only use it when you need admin-level privileges, and never expose it client-side."

**Implementation:**
The example shows creating a Supabase client with `SUPABASE_PROJECT_URL` and `SUPABASE_SERVICE_ROLE_KEY` for unrestricted database access.

**Use cases:** Admin-level operations requiring bypass of Row Level Security policies.

## Additional Resources

The documentation references guides for:
- Triggering tasks from Supabase edge functions
- Database webhooks
- CRUD operations with Supabase
- Storage uploads via S3
