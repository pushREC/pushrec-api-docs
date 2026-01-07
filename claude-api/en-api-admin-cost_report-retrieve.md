---
source: https://docs.anthropic.com/en/api/admin/cost_report/retrieve
scraped: 2026-01-07
api_provider: Anthropic
discovery_tier: 3
verified: false
method: bright_data
duration_ms: 2041
---
et Cost Report - Claude API Reference

Loading...

[](/docs/en/home)

*   [Developer Guide](/docs/en/intro)
*   [API Reference](/docs/en/api/overview)
*   [MCP
    
    ](https://modelcontextprotocol.io)
*   [Resources](/docs/en/resources/overview)
*   [Release Notes](/docs/en/release-notes/overview)

English

[Log in](/login?returnTo=%2Fdocs%2Fen%2Fapi%2Fadmin%2Fcost_report%2Fretrieve)

Search...

⌘K

Using the API

[Features overview](/docs/en/api/overview)[Client SDKs](/docs/en/api/client-sdks)[Beta headers](/docs/en/api/beta-headers)[Errors](/docs/en/api/errors)

[

Messages

](/docs/en/api/messages)

[

Create a Message

](/docs/en/api/messages/create)[

Count tokens in a Message

](/docs/en/api/messages/count_tokens)

Batches

[

Models

](/docs/en/api/models)

[

List Models

](/docs/en/api/models/list)[

Get a Model

](/docs/en/api/models/retrieve)

[

Beta



](/docs/en/api/beta)

Models

Messages

Files

Skills

[

Admin

](/docs/en/api/admin)

Organizations

Invites

Users

Workspaces

API Keys

Usage Report

Cost Report

[

Get Cost Report

](/docs/en/api/admin/cost_report/retrieve)

[

Completions

](/docs/en/api/completions)

[

Create a Text Completion

](/docs/en/api/completions/create)

Support & configuration

[Rate limits](/docs/en/api/rate-limits)[Service tiers](/docs/en/api/service-tiers)[Versions](/docs/en/api/versioning)[IP addresses](/docs/en/api/ip-addresses)[Supported regions](/docs/en/api/supported-regions)[OpenAI SDK compatibility](/docs/en/api/openai-sdk)

[

Console

](/)

[

Log in

](/login)

Cost report

Retrieve

Copy page

# Get Cost Report

get/v1/organizations/cost\_report

Get Cost Report

##### Query ParametersExpand Collapse

starting\_at: string

Time buckets that start on or after this RFC 3339 timestamp will be returned. Each time bucket will be snapped to the start of the minute/hour/day in UTC.

formatdate-time

bucket\_width: optional "1d"

Time granularity of the response data.

Accepts one of the following:

"1d"

ending\_at: optional string

Time buckets that end before this RFC 3339 timestamp will be returned.

formatdate-time

group\_by: optional array of "workspace\_id" or "description"

Group by any subset of the available options.

Accepts one of the following:

"workspace\_id"

"description"

limit: optional number

Maximum number of time buckets to return in the response.

maximum31

minimum1

page: optional string

Optionally set to the `next_page` token from the previous response.

formatdate-time

##### ReturnsExpand Collapse

CostReport = object { data, has\_more, next\_page }

data: array of object { ending\_at, results, starting\_at }

ending\_at: string

End of the time bucket (exclusive) in RFC 3339 format.

results: array of object { amount, context\_window, cost\_type, 6 more }

List of cost items for this time bucket. There may be multiple items if one or more `group_by[]` parameters are specified.

amount: string

Cost amount in lowest currency units (e.g. cents) as a decimal string. For example, `"123.45"` in `"USD"` represents `$1.23`.

context\_window: "0-200k" or "200k-1M"

Input context window used. Null if not grouping by description or for non-token costs.

Accepts one of the following:

"0-200k"

"200k-1M"

cost\_type: "tokens" or "web\_search" or "code\_execution"

Type of cost. Null if not grouping by description.

Accepts one of the following:

"tokens"

"web\_search"

"code\_execution"

currency: string

Currency code for the cost amount. Currently always `"USD"`.

description: string

Description of the cost item. Null if not grouping by description.

model: string

Model name used. Null if not grouping by description or for non-token costs.

service\_tier: "standard" or "batch"

Service tier used. Null if not grouping by description or for non-token costs.

Accepts one of the following:

"standard"

"batch"

token\_type: "uncached\_input\_tokens" or "output\_tokens" or "cache\_read\_input\_tokens" or 2 more

Type of token. Null if not grouping by description or for non-token costs.

Accepts one of the following:

"uncached\_input\_tokens"

"output\_tokens"

"cache\_read\_input\_tokens"

"cache\_creation.ephemeral\_1h\_input\_tokens"

"cache\_creation.ephemeral\_5m\_input\_tokens"

workspace\_id: string

ID of the Workspace this cost is associated with. Null if not grouping by workspace or for the default workspace.

starting\_at: string

Start of the time bucket (inclusive) in RFC 3339 format.

has\_more: boolean

Indicates if there are more results.

next\_page: string

Token to provide in as `page` in the subsequent request to retrieve the next page of data.

formatdate-time

Get Cost Report

    curl https://api.anthropic.com/v1/organizations/cost_report \
        -H "X-Api-Key: $ANTHROPIC_ADMIN_API_KEY"

Response 200

    {
      "data": [
        {
          "ending_at": "2025-08-02T00:00:00Z",
          "results": [
            {
              "amount": "123.78912",
              "context_window": "0-200k",
              "cost_type": "tokens",
              "currency": "USD",
              "description": "Claude Sonnet 4 Usage - Input Tokens",
              "model": "claude-sonnet-4-20250514",
              "service_tier": "standard",
              "token_type": "uncached_input_tokens",
              "workspace_id": "wrkspc_01JwQvzr7rXLA5AGx3HKfFUJ"
            }
          ],
          "starting_at": "2025-08-01T00:00:00Z"
        }
      ],
      "has_more": true,
      "next_page": "2019-12-27T18:11:19.117Z"
    }

##### Returns Examples

Response 200

    {
      "data": [
        {
          "ending_at": "2025-08-02T00:00:00Z",
          "results": [
            {
              "amount": "123.78912",
              "context_window": "0-200k",
              "cost_type": "tokens",
              "currency": "USD",
              "description": "Claude Sonnet 4 Usage - Input Tokens",
              "model": "claude-sonnet-4-20250514",
              "service_tier": "standard",
              "token_type": "uncached_input_tokens",
              "workspace_id": "wrkspc_01JwQvzr7rXLA5AGx3HKfFUJ"
            }
          ],
          "starting_at": "2025-08-01T00:00:00Z"
        }
      ],
      "has_more": true,
      "next_page": "2019-12-27T18:11:19.117Z"
    }

[](/docs)

[](https://x.com/claudeai)[](https://www.linkedin.com/showcase/claude)[](https://instagram.com/claudeai)

### Solutions

*   [AI agents](https://claude.com/solutions/agents)
*   [Code modernization](https://claude.com/solutions/code-modernization)
*   [Coding](https://claude.com/solutions/coding)
*   [Customer support](https://claude.com/solutions/customer-support)
*   [Education](https://claude.com/solutions/education)
*   [Financial services](https://claude.com/solutions/financial-services)
*   [Government](https://claude.com/solutions/government)
*   [Life sciences](https://claude.com/solutions/life-sciences)

### Partners

*   [Amazon Bedrock](https://claude.com/partners/amazon-bedrock)
*   [Google Cloud's Vertex AI](https://claude.com/partners/google-cloud-vertex-ai)

### Learn

*   [Blog](https://claude.com/blog)
*   [Catalog](https://claude.ai/catalog/artifacts)
*   [Courses](https://www.anthropic.com/learn)
*   [Use cases](https://claude.com/resources/use-cases)
*   [Connectors](https://claude.com/partners/mcp)
*   [Customer stories](https://claude.com/customers)
*   [Engineering at Anthropic](https://www.anthropic.com/engineering)
*   [Events](https://www.anthropic.com/events)
*   [Powered by Claude](https://claude.com/partners/powered-by-claude)
*   [Service partners](https://claude.com/partners/services)
*   [Startups program](https://claude.com/programs/startups)

### Company

*   [Anthropic](https://www.anthropic.com/company)
*   [Careers](https://www.anthropic.com/careers)
*   [Economic Futures](https://www.anthropic.com/economic-futures)
*   [Research](https://www.anthropic.com/research)
*   [News](https://www.anthropic.com/news)
*   [Responsible Scaling Policy](https://www.anthropic.com/news/announcing-our-updated-responsible-scaling-policy)
*   [Security and compliance](https://trust.anthropic.com)
*   [Transparency](https://www.anthropic.com/transparency)

### Learn

*   [Blog](https://claude.com/blog)
*   [Catalog](https://claude.ai/catalog/artifacts)
*   [Courses](https://www.anthropic.com/learn)
*   [Use cases](https://claude.com/resources/use-cases)
*   [Connectors](https://claude.com/partners/mcp)
*   [Customer stories](https://claude.com/customers)
*   [Engineering at Anthropic](https://www.anthropic.com/engineering)
*   [Events](https://www.anthropic.com/events)
*   [Powered by Claude](https://claude.com/partners/powered-by-claude)
*   [Service partners](https://claude.com/partners/services)
*   [Startups program](https://claude.com/programs/startups)

### Help and security

*   [Availability](https://www.anthropic.com/supported-countries)
*   [Status](https://status.anthropic.com/)
*   [Support](https://support.claude.com/)
*   [Discord](https://www.anthropic.com/discord)

### Terms and policies

*   [Privacy policy](https://www.anthropic.com/legal/privacy)
*   [Responsible disclosure policy](https://www.anthropic.com/responsible-disclosure-policy)
*   [Terms of service: Commercial](https://www.anthropic.com/legal/commercial-terms)
*   [Terms of service: Consumer](https://www.anthropic.com/legal/consumer-terms)
*   [Usage policy](https://www.anthropic.com/legal/au
