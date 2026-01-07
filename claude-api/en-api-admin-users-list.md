---
source: https://docs.anthropic.com/en/api/admin/users/list
scraped: 2026-01-07
method: bright_data
duration_ms: 2137
---

List Users - Claude API Reference

Loading...

[](/docs/en/home)

*   [Developer Guide](/docs/en/intro)
*   [API Reference](/docs/en/api/overview)
*   [MCP
    
    ](https://modelcontextprotocol.io)
*   [Resources](/docs/en/resources/overview)
*   [Release Notes](/docs/en/release-notes/overview)

English

[Log in](/login?returnTo=%2Fdocs%2Fen%2Fapi%2Fadmin%2Fusers%2Flist)

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

[

Get User

](/docs/en/api/admin/users/retrieve)[

List Users

](/docs/en/api/admin/users/list)[

Update User

](/docs/en/api/admin/users/update)[

Remove User

](/docs/en/api/admin/users/delete)

Workspaces

API Keys

Usage Report

Cost Report

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

Users

List

Copy page

# List Users

get/v1/organizations/users

List Users

##### Query ParametersExpand Collapse

after\_id: optional string

ID of the object to use as a cursor for pagination. When provided, returns the page of results immediately after this object.

before\_id: optional string

ID of the object to use as a cursor for pagination. When provided, returns the page of results immediately before this object.

email: optional string

Filter by user email.

formatemail

limit: optional number

Number of items to return per page.

Defaults to `20`. Ranges from `1` to `1000`.

maximum1000

minimum1

##### ReturnsExpand Collapse

data: array of [User](/docs/en/api/admin#user) { id, added\_at, email, 3 more }

id: string

ID of the User.

added\_at: string

RFC 3339 datetime string indicating when the User joined the Organization.

formatdate-time

email: string

Email of the User.

name: string

Name of the User.

role: "user" or "developer" or "billing" or 2 more

Organization role of the User.

Accepts one of the following:

"user"

"developer"

"billing"

"admin"

"claude\_code\_user"

type: "user"

Object type.

For Users, this is always `"user"`.

Accepts one of the following:

"user"

first\_id: string

First ID in the `data` list. Can be used as the `before_id` for the previous page.

has\_more: boolean

Indicates if there are more results in the requested page direction.

last\_id: string

Last ID in the `data` list. Can be used as the `after_id` for the next page.

List Users

    curl https://api.anthropic.com/v1/organizations/users \
        -H "X-Api-Key: $ANTHROPIC_ADMIN_API_KEY"

Response 200

    {
      "data": [
        {
          "id": "user_01WCz1FkmYMm4gnmykNKUu3Q",
          "added_at": "2024-10-30T23:58:27.427722Z",
          "email": "[email protected]",
          "name": "Jane Doe",
          "role": "user",
          "type": "user"
        }
      ],
      "first_id": "first_id",
      "has_more": true,
      "last_id": "last_id"
    }

##### Returns Examples

Response 200

    {
      "data": [
        {
          "id": "user_01WCz1FkmYMm4gnmykNKUu3Q",
          "added_at": "2024-10-30T23:58:27.427722Z",
          "email": "[email protected]",
          "name": "Jane Doe",
          "role": "user",
          "type": "user"
        }
      ],
      "first_id": "first_id",
      "has_more": true,
      "last_id": "last_id"
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
*   [Usage policy](https://www.anthropic.com/legal/
