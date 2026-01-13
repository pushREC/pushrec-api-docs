# Advanced Usage - Trigger.dev

## Page Overview
This documentation page covers advanced usage patterns for the Trigger.dev management API, specifically focusing on accessing raw HTTP responses.

## Main Content

### Accessing Raw HTTP Responses

The page explains that all API methods return a `Promise` subclass called `ApiPromise` that includes helpers for accessing the underlying HTTP response.

#### Key Methods

**withResponse()** - Allows you to destructure both the data and raw response object from an API call, providing access to HTTP status codes and headers.

**asResponse()** - Returns a complete Response object instead of just the data payload.

#### Code Example

The documentation provides a TypeScript example demonstrating both approaches:

```typescript
import { runs } from "@trigger.dev/sdk";

async function main() {
  const { data: run, response: raw } = await runs.retrieve("run_1234").withResponse();

  console.log(raw.status);
  console.log(raw.headers);

  const response = await runs.retrieve("run_1234").asResponse();

  console.log(response.status);
  console.log(response.headers);
}
```

## Navigation Context

This page is part of the API reference section under "Advanced usage" within the broader management API documentation for Trigger.dev.
