---
source: https://openrouter.ai/docs/sdks/typescript/oauth
scraped: 2026-01-08
---

# OAuth

The OpenRouter TypeScript SDK provides OAuth authentication endpoints for exchanging authorization codes and creating auth codes through a PKCE flow.

## Core Operations

### exchangeAuthCodeForAPIKey

This operation exchanges an authorization code from a PKCE flow for a user-controlled API key.

#### Basic Implementation

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

await openRouter.oAuth.exchangeAuthCodeForAPIKey({
  code: "auth_code_abc123def456",
});
```

#### Standalone Function Approach

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { oAuthExchangeAuthCodeForAPIKey } from "@openrouter/sdk/funcs/oAuthExchangeAuthCodeForAPIKey.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await oAuthExchangeAuthCodeForAPIKey(openRouter, {
  code: "auth_code_abc123def456",
});
```

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `request` | ExchangeAuthCodeForAPIKeyRequest | Yes | Request object containing the auth code |
| `options` | RequestOptions | No | HTTP request configuration |
| `options.fetchOptions` | RequestInit | No | Standard Request/Response init options |
| `options.retries` | RetryConfig | No | Automatic retry handling |

#### Possible Errors

| Status | Error Type |
|--------|------------|
| 400 | BadRequestResponseError |
| 403 | ForbiddenResponseError |
| 500 | InternalServerResponseError |
| 4XX/5XX | OpenRouterDefaultError |

---

### createAuthCode

This operation initiates a PKCE flow by creating an authorization code for generating user-controlled API keys.

#### Basic Implementation

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

await openRouter.oAuth.createAuthCode({
  callbackUrl: "https://myapp.com/auth/callback",
});
```

#### Standalone Function Approach

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { oAuthCreateAuthCode } from "@openrouter/sdk/funcs/oAuthCreateAuthCode.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await oAuthCreateAuthCode(openRouter, {
  callbackUrl: "https://myapp.com/auth/callback",
});
```

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `request` | CreateAuthKeysCodeRequest | Yes | Request object containing the callback URL |
| `options` | RequestOptions | No | HTTP request configuration |
| `options.fetchOptions` | RequestInit | No | Standard Request/Response init options |
| `options.retries` | RetryConfig | No | Automatic retry handling |

#### Possible Errors

| Status | Error Type |
|--------|------------|
| 400 | BadRequestResponseError |
| 401 | UnauthorizedResponseError |
| 500 | InternalServerResponseError |
| 4XX/5XX | OpenRouterDefaultError |

## Implementation Options

Both methods support standard class-based usage and standalone function imports for optimal tree-shaking performance.

## Note

The TypeScript SDK and docs are currently in beta.
