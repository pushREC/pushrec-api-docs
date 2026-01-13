# useWaitToken Hook Documentation

## Overview
The `useWaitToken` React hook enables completing a wait token from a React component using a Public Access Token for authentication.

## Backend Implementation

Create and expose a wait token:

```typescript
import { wait } from "@trigger.dev/sdk";

const token = await wait.createToken({
  timeout: "10m",
});

return {
  tokenId: token.id,
  publicToken: token.publicAccessToken,
};
```

The public access token automatically expires after one hour.

## Frontend Usage

```typescript
import { useWaitToken } from "@trigger.dev/react-hooks";

export function MyComponent({ publicToken, tokenId }) {
  const { complete } = useWaitToken(tokenId, {
    accessToken: publicToken,
  });

  return <button onClick={() => complete({ foo: "bar" })}>Complete</button>;
}
```

## Key Features

- Allows frontend components to complete backend wait tokens
- Uses automatically-generated public access tokens
- Tokens expire after one hour for security
- Supports configurable timeouts (e.g., "10m")
- Returns a `complete` function to resolve the wait operation
