---
source: https://docs.digitalocean.com/products/app-platform/reference/mcp/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 MCP Reference

Validated on 5 Dec 2025 • Last edited on 11 Dec 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

You can integrate App Platform with AI development tools using DigitalOcean’s local or remote MCP servers and [App Platform’s llms.txt](https://docs.digitalocean.com/products/app-platform/llms.txt). Together, these components standardize how context is provided to large language models (LLMs):

*   [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) is an open standard for providing structured context to LLMs. DigitalOcean MCP servers bridge your development tools and the DigitalOcean API, exposing tools and context that allow MCP clients to manage resources.
    
*   [llms.txt](https://llmstxt.org/) is a standardized Markdown file format that supplies LLMs with relevant product documentation and environment context. When included in an app, [App Platform’s llms.txt](https://docs.digitalocean.com/products/app-platform/llms.txt) helps LLMs better understand the structure, configuration, and workflows associated with your app.
    

MCP clients like Windsurf, Cursor, Claude, or VS Code Copilot can connect to MCP servers to access tools and context. When connected, these clients can reason about your infrastructure and perform API-backed operations on your behalf.

[](/products/app-platform/reference/mcp/use-local-mcp/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

Configure Local MCP Server

Launch MCP locally to manage your DigitalOcean resources directly from your machine.

[](/reference/mcp/configure-mcp/)

![](https://docs.digitalocean.com/images/icons/mcp.svg)

DigitalOcean Remote MCP Server

Configure your MCP client to connect to hosted MCP servers.