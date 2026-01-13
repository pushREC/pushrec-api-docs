Wait until a token is completed using waitpoint tokens.

Copy page

Waitpoint tokens pause task runs until you complete the token. They’re commonly used for approval workflows and other scenarios where you need to wait for external confirmation, such as human-in-the-loop processes.
You can complete a token using the SDK or by making a POST request to the token’s URL.

## [​
](#usage)Usage

To get started using wait tokens, you need to first create a token using the `wait.createToken` function:

Copy

Ask AI

```
import { wait } from "@trigger.dev/sdk";

// This can be called anywhere in your codebase, either in a task or in your backend code
const token = await wait.createToken({
 timeout: "10m", // you can optionally specify a timeout for the token
});

```

Once you have a token, you can wait for it to be completed using the `wait.forToken` function:

Copy

Ask AI

```
import { wait } from "@trigger.dev/sdk";

type ApprovalToken = {
 status: "approved" | "rejected";
};

// This must be called inside a task run function
const result = await wait.forToken(tokenId);

if (result.ok) {
 console.log("Token completed", result.output.status); // "approved" or "rejected"
} else {
 console.log("Token timed out", result.error);
}

```

To complete a token, you can use the `wait.completeToken` function:

Copy

Ask AI

```
import { wait } from "@trigger.dev/sdk";
// This can be called anywhere in your codebase, or from an external service,
// passing in the token ID and the output of the token
await wait.completeToken(tokenId, {
 status: "approved",
});

```

Or you can make an HTTP POST request to the `url` it returns. This is an HTTP callback:

Copy

Ask AI

```
import { wait } from "@trigger.dev/sdk";

const token = await wait.createToken({
 timeout: "10m",
});

const call = await replicate.predictions.create({
 version: "27b93a2413e7f36cd83da926f3656280b2931564ff050bf9575f1fdf9bcd7478",
 input: {
 prompt: "A painting of a cat by Andy Warhol",
 },
 // pass the provided URL to Replicate's webhook, so they can "callback"
 webhook: token.url,
 webhook_events_filter: ["completed"],
});

const prediction = await wait.forToken(token).unwrap();
// unwrap() throws a timeout error or returns the result 👆

```

## 
[​
](#wait-createtoken)wait.createToken

Create a waitpoint token.

### 
[​
](#options)options

The `createToken` function accepts an object with the following properties:

[​
](#param-timeout)
timeout

string

The maximum amount of time to wait for the token to be completed. Defaults to “10m”.

[​
](#param-idempotency-key)
idempotencyKey

string

An idempotency key for the token. If provided, the token will be completed with the same payload
if the same idempotency key is used again.

[​
](#param-idempotency-key-ttl)
idempotencyKeyTTL

string

The time to live for the idempotency key. Defaults to “1h”.

[​
](#param-tags)
tags

string[]

Tags to attach to the token. Tags can be used to filter waitpoints in the dashboard.

### 
[​
](#returns)returns

The `createToken` function returns a token object with the following properties:

[​
](#param-id)
id

string

The ID of the token. Starts with `waitpoint_`.

[​
](#param-url)
url

string

The URL of the token. This is the URL you can make a POST request to in order to complete the token.The JSON body of the POST request will be used as the output of the token. If there’s no body the output will be an empty object `{}`.

[​
](#param-is-cached)
isCached

boolean

Whether the token is cached. Will return true if the token was created with an idempotency key and
the same idempotency key was used again.

[​
](#param-public-access-token)
publicAccessToken

string

A Public Access Token that can be used to complete the token from a client-side application (or
another backend). See our [Realtime docs](/docs/realtime/auth) for more details.

### 
[​
](#example)Example

Copy

Ask AI

```
import { wait } from "@trigger.dev/sdk";

const token = await wait.createToken({
 timeout: "10m",
 idempotencyKey: "my-idempotency-key",
 tags: ["my-tag"],
});

```

## 
[​
](#wait-completetoken)wait.completeToken

Complete a waitpoint token.

### 
[​
](#parameters)parameters

[​
](#param-id-1)
id

string

The ID of the token to complete.

[​
](#param-output)
output

any

The data to complete the token with.

### 
[​
](#returns-2)returns

The `completeToken` function returns an object with the following properties:

[​
](#param-success)
success

boolean

Whether the token was completed successfully.

### 
[​
](#example-2)Example

Copy

Ask AI

```
import { wait } from "@trigger.dev/sdk";

await wait.completeToken(tokenId, {
 status: "approved",
});

```

### 
[​
](#from-another-language)From another language

You can complete a token using a raw HTTP request or from another language.

curl

python

ruby

go

Copy

Ask AI

```
curl -X POST "https://api.trigger.dev/api/v1/waitpoints/tokens/{tokenId}/complete" \
 -H "Authorization: Bearer {token}" \
 -H "Content-Type: application/json" \
 -d '{"output": { "status": "approved"}}'

```

## 
[​
](#wait-fortoken)wait.forToken

Wait for a token to be completed.

### 
[​
](#parameters-2)parameters

[​
](#param-token)
token

string | { id: string }

The token to wait for.

### 
[​
](#returns-3)returns

The `forToken` function returns a result object with the following properties:

[​
](#param-ok)
ok

boolean

Whether the token was completed successfully.

[​
](#param-output-1)
output

any

If `ok` is `true`, this will be the output of the token.

[​
](#param-error)
error

Error

If `ok` is `false`, this will be the error that occurred. The only error that can occur is a
timeout error.

### 
[​
](#unwrap)unwrap()

We provide a handy `.unwrap()` method that will throw an error if the result is not ok. This means your happy path is a lot cleaner.

Copy

Ask AI

```
const approval = await wait.forToken(tokenId).unwrap();
// unwrap means an error will throw if the waitpoint times out 👆

// This is the actual data you sent to the token now, not a result object
console.log("Approval", approval);

```

### 
[​
](#example-3)Example

Copy

Ask AI

```
import { wait } from "@trigger.dev/sdk";

const result = await wait.forToken(tokenId);

if (result.ok) {
 console.log("Token completed", result.output.status); // "approved" or "rejected"
} else {
 console.log("Token timed out", result.error);
}

```

## 
[​
](#wait-listtokens)wait.listTokens

List all tokens for an environment.

### 
[​
](#parameters-3)parameters

The `listTokens` function accepts an object with the following properties:

[​
](#param-status)
status

string | string[]

Statuses to filter by. Can be one or more of: `WAITING`, `COMPLETED`, `TIMED_OUT`.

[​
](#param-idempotency-key-1)
idempotencyKey

string

The idempotency key to filter by.

[​
](#param-tags-1)
tags

string | string[]

Tags to filter by.

[​
](#param-period)
period

string

The period to filter by. Can be one of: `1h`, `1d`, `7d`, `30d`.

[​
](#param-from)
from

Date | number

The start date to filter by.

[​
](#param-to)
to

Date | number

The end date to filter by.

### 
[​
](#returns-4)returns

The `listTokens` function returns a list of tokens that can be iterated over using a for-await-of loop.
Each token is an object with the following properties:

[​
](#param-id-2)
id

string

The ID of the token.

[​
](#param-url-1)
url

string

The URL of the token. This is the URL you can make a POST request to in order to complete the token.The JSON body of the POST request will be used as the output of the token. If there’s no body the output will be an empty object `{}`.

[​
](#param-status-1)
status

string

The status of the token.

[​
](#param-completed-at)
completedAt

Date

The date and time the token was completed.

[​
](#param-timeout-at)
timeoutAt

Date

The date and time the token will timeout.

[​
](#param-idempotency-key-2)
idempotencyKey

string

The idempotency key of the token.

[​
](#param-idempotency-key-expires-at)
idempotencyKeyExpiresAt

Date

The date and time the idempotency key will expire.

[​
](#param-tags-2)
tags

string[]

The tags of the token.

[​
](#param-created-at)
createdAt

Date

The date and time the token was created.

The output of the token is not included in the list. To get the output, you need to retrieve the
token using the `wait.retrieveToken` function.

### 
[​
](#example-4)Example

Copy

Ask AI

```
import { wait } from "@trigger.dev/sdk";

const tokens = await wait.listTokens({
 status: "COMPLETED",
 tags: ["user:123"],
});

for await (const token of tokens) {
 console.log(token);
}

```

## 
[​
](#wait-retrievetoken)wait.retrieveToken

Retrieve a token by ID.

### 
[​
](#parameters-4)parameters

[​
](#param-id-3)
id

string

The ID of the token to retrieve.

### 
[​
](#returns-5)returns

The `retrieveToken` function returns a token object with the following properties:

[​
](#param-id-4)
id

string

The ID of the token.

[​
](#param-url-2)
url

string

The URL of the token. This is the URL you can make a POST request to in order to complete the token.The JSON body of the POST request will be used as the output of the token. If there’s no body the output will be an empty object `{}`.

[​
](#param-status-2)
status

string

The status of the token.

[​
](#param-completed-at-1)
completedAt

Date

The date and time the token was completed.

[​
](#param-timeout-at-1)
timeoutAt

Date

The date and time the token will timeout.

[​
](#param-idempotency-key-3)
idempotencyKey

string

The idempotency key of the token.

[​
](#param-idempotency-key-expires-at-1)
idempotencyKeyExpiresAt

Date

The date and time the idempotency key will expire.

[​
](#param-tags-3)
tags

string[]

The tags of the token.

[​
](#param-created-at-1)
createdAt

Date

The date and time the token was created.

[​
](#param-output-2)
output

any

The output of the token.

[​
](#param-error-1)
error

Error

The error that occurred.

### 
[​
](#example-5)Example

Copy

Ask AI

```
import { wait } from "@trigger.dev/sdk";

const token = await wait.retrieveToken(tokenId);

console.log(token);

```

## 
[​
](#wait-idempotency)Wait idempotency

You can pass an idempotency key to any wait function, allowing you to skip waits if the same idempotency key is used again. This can be useful if you want to skip waits when retrying a task, for example:

Copy

Ask AI

```
// Specify the idempotency key and TTL when creating a wait token
const token = await wait.createToken({
 idempotencyKey: "my-idempotency-key",
 idempotencyKeyTTL: "1h",
});

```

Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/wait-for-token.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /wait-for-token)

[Previous](/docs/wait-until)[Concurrency & QueuesConfigure what you want to happen when there is more than one run at a time.

Next
](/docs/queue-concurrency)
⌘I

On this page
- [Usage](#usage)
- [wait.createToken](#wait-createtoken)
- [options](#options)
- [returns](#returns)
- [Example](#example)
- [wait.completeToken](#wait-completetoken)
- [parameters](#parameters)
- [returns](#returns-2)
- [Example](#example-2)
- [From another language](#from-another-language)
- [wait.forToken](#wait-fortoken)
- [parameters](#parameters-2)
- [returns](#returns-3)
- [unwrap()](#unwrap)
- [Example](#example-3)
- [wait.listTokens](#wait-listtokens)
- [parameters](#parameters-3)
- [returns](#returns-4)
- [Example](#example-4)
- [wait.retrieveToken](#wait-retrievetoken)
- [parameters](#parameters-4)
- [returns](#returns-5)
- [Example](#example-5)
- [Wait idempotency](#wait-idempotency)

[Trigger.dev home page](https://trigger.dev)[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

Developers
[Changelog](https://trigger.dev/changelog)[Contributing](https://github.com/triggerdotdev/trigger.dev/blob/main/CONTRIBUTING.md)[Open source](https://github.com/triggerdotdev/trigger.dev?tab=Apache-2.0-1-ov-file#readme)[GitHub](https://github.com/triggerdotdev/trigger.dev)[OSS Friends](https://trigger.dev/oss-friends)

Product
[Pricing](https://trigger.dev/pricing)[How it works](https://trigger.dev/#how-it-works)[Features](https://trigger.dev/product)[Roadmap](https://feedback.trigger.dev/roadmap)[FAQs](https://trigger.dev/pricing#faqs)[Uptime status](https://status.trigger.dev/)

Company
[Blog](https://trigger.dev/blog)[Contact](https://trigger.dev/contact)[Careers](https://trigger.dev/jobs)[Privacy](https://trigger.dev/legal/privacy)[Terms of service](https://trigger.dev/legal)

[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

[Powered by](https://www.mintlify.com?utm_campaign=poweredBy&utm_medium=referral&utm_source=trigger)