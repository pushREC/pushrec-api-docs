---
source: https://docs.digitalocean.com/reference/api/create-personal-access-token/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
--
created: 2026-01-07
tags:
  - bright-data
  - scraper
tool: bright-data-skill
source_url: https://docs.digitalocean.com/reference/api/create-personal-access-token/
domain: docs.digitalocean.com
---
                How to Create a Personal Access Token | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/doctl.8752eb00eab1370da259c7536b272e156687733b207709b145ac9725f986eda0.svg)doctl CLI](/reference/doctl/)
*   [![](/images/icons/api.47c17d0d57a6ef27c2bdc744b3a7b71edc80838dfbe8431e12f5c3e81f371510.svg)APIs](/reference/api/)
    *   [DigitalOcean API](/reference/api/#digitalocean)
        *   [Reference](/reference/api/digitalocean/)
        *   [Create an Access Token](/reference/api/create-personal-access-token/)
    *   [Spaces API](/reference/api/#spaces)
        *   [Reference](/reference/api/spaces/)
        *   [Manage Access](/products/spaces/how-to/manage-access/)
        *   [Use AWS S3 SDKs](/products/spaces/how-to/use-aws-sdks/)
    *   [OAuth API](/reference/api/oauth/)
    *   [Metadata API](/reference/api/#metadata)
        *   [Reference](/reference/api/metadata/)
        *   [Access Metadata](/products/droplets/how-to/access-metadata/)
    *   [Token Scopes](/reference/api/scopes/)
*   [![](/images/icons/mcp.ecd474dcd1a6781abb68b3a2ccb9cec4594cac83394f0c3b3661148969c0700e.svg)MCP Server](/reference/mcp/)
*   [![](/images/icons/ml.8fa526f2000be550be4cf13328efa900204aadddf78ca969ef95c31dee1c9c94.svg)Paperspace](/reference/paperspace/)
*   [![](/images/icons/ansible.e7aa45274ed1f6e2568e7246a3176c23f381abf51095a7ed3248431c6dfb75e1.svg)Ansible](/reference/ansible/)
*   [![](/images/icons/terraform.1c898126c7e49861340a2005886eb496e4755c9b2b737b14ea0d3a949a7ec619.svg)Terraform](/reference/terraform/)
*   [![](/images/icons/python.ccad6ea84a17bb64de581eba7a7efe96ff4b80b41bdf53a90a4819ba20e0dcaa.svg)PyDo](/reference/pydo/)
*   [![](/images/icons/libraries.f718f930c4f806c3d2f8548b78661d1b4e835959e441cd3499fb93dac044b021.svg)Libraries](/reference/libraries/)
*   [![](/images/icons/opensource.e3aaf41478fe88f6808cf399b9357d9d23fe3f04f3a9ed58f6cc7b261f2e04c3.svg)Open Source](/reference/opensource/)

*   [APIs](/reference/api/) 
*   [DigitalOcean API](/reference/api/#digitalocean) 
*   Create an Access Token

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create a Personal Access Token

Validated on 1 Aug 2024 • Last edited on 10 Dec 2025

To use the DigitalOcean API, you need to generate a personal access token. Personal access tokens function like ordinary OAuth access tokens. You use them to authenticate to the API by including one in a bearer-type `Authorization` header with your request.

Warning

**Keep your tokens secret.** They function like passwords. Do not hard code your tokens into programs where they may accidentally be released in version control and are harder to rotate. Instead, use environment variables. If a token becomes compromised, delete it to revoke that token’s access.

## About Custom Scopes[](#about-custom-scopes)

Previously, DigitalOcean personal access tokens (PATs) [had two scopes](/notes/2024/custom-scope-token-ga/): read access to all team resources or full (read and write) access to all team resources.

Custom scopes grant more specific permissions, like only creating Droplets or updating cloud firewalls, which lets you secure your workflows by granting only the permissions the token needs and restricting access to other resources and actions.

Generally, the [CRUD scopes](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) map to equivalent actions on the associated kind of resource:

*   _Create_ scope lets you create the resource type and perform additive actions within that resource type. For example, `database:create` lets you create database clusters and create new users or databases within that cluster.
    
*   _Read_ scope lets you view information about a resource by type and also view information that the resource returns. For example, `app:read` lets you view App Platform apps and their logs.
    
*   _Update_ scope allows you modify a resource type and perform actions that would otherwise modify a resource. For example, `droplet:update` lets you power a Droplet on or off.
    
*   _Delete_ scope lets you delete a resource by type and perform actions that delete information about the resource type. For example, `database:delete` lets you delete databases from a database cluster and remove existing users from a database.
    

Each custom scope correlates to one [public API endpoint](/reference/api/digitalocean/).

## Creating a Token[](#creating-a-token)

To generate a personal access token, log in to [the DigitalOcean Control Panel](https://cloud.digitalocean.com).

In the left menu, click **API**, which takes you to the **Applications & API** page on the **Tokens** tab. In the **Personal access tokens** section, click the **Generate New Token** button.

![Create Personal Access Token page showing fields for token name, expiration, and scope selection options including Custom Scopes, Read Only, and Full Access.](https://docs.digitalocean.com/screenshots/api/create-new-pat.f31e0229974379278a5d4d97d37c0c9a7510144c9785175becb4f742d7be6658.png)

On the **Create A New Personal Access Token** page, fill out the fields:

*   **Token name**. Choose a name for the token. This is for your own reference.
    
*   **Expiration**. Choose when the token expires. After the interval passes, the token can no longer authenticate you to the API and it disappears from your account.
    
*   **Scopes**. Choose the permissions that define which resources and actions the token can access. The available options are based on your [team role](/platform/teams/roles/).
    
    *   **Custom Scopes** lets you select specific scopes from the full list of scopes available to you based on your team role.
        
        If a team owner expands the permissions of your team role, a token with custom scopes maintains its original scopes and does not include any new scopes.
        
    *   **Read Only** grants the token read scope for all resources available based on the permissions of your team role.
        
        If a team owner expands the read permissions of your team role, a read only token reflects the updated permissions.
        
    *   **Full Access** grants the token all scopes available based on the permissions of your team role.
        
        If a team owner expands the permissions of your team role, a full access token reflects the updated permissions.
        

If a team owner restricts the permissions of your team role, those permissions are also no longer available to any existing tokens.

You can use the **Quick bulk scope select** to select all scopes for any CRUD action, **Search by resource type** to look for a scope by name, or select and expand sections in the full list:

![Custom scopes selection section with bulk scope filters and expandable resource-type sections.](https://docs.digitalocean.com/screenshots/api/custom-scopes.37613ad745b1b4d433834545d35148efcab51b9922fb90107b2d568b5e4e6217.png)

The bottom of the page displays the summary of custom chosen scopes. When you finish selecting your options, click **Generate Token** to create the token and return to the **Applications & API** page. Save the displayed token. For security purposes, the secret is only shown once.

You can use tokens with custom scopes in the same way as previous tokens. If you try to use a token to call an endpoint that requires a scope the token does not have, the API returns a 403 Forbidden response.

## Managing Tokens with Custom Scopes[](#managing-tokens-with-custom-scopes)

In the **Personal access tokens** section, you can view the scopes for existing tokens.

![Personal access tokens table showing token name, number of scopes, creation time, last used status, and expiration date.](https://docs.digitalocean.com/screenshots/api/pats.57d8d742b24a1dc17065fc76bf8189f401067b0954fd12fb6317157da2a38f99.png)

You can click the entry in the **Scopes** column to view details about the token’s usage and scopes.

In the **…** menu for a token, you can rename, regenerate, or delete the token.

## Limits[](#limits)

*   You cannot edit the scope of a token after creation. You can rename and regenerate tokens with custom scopes.

In this article...

*   [About Custom Scopes](#about-custom-scopes)
*   [Creating a Token](#creating-a-token)
*   [Managing Tokens with Custom Scopes](#managing-tokens-with-custom-scopes)
*   [Limits](#limits)

##### Company

*   [About](https://www.digitalocean.com/about)
*   [Careers](https://www.digitalocean.com/careers)
*   [Blog](https://www.digitalocean.com/blog)

##### Docs

*   [Docs Home](https://docs.digitalocean.com)
*   [API Reference](https://docs.digitalocean.com/reference/api)
*   [CLI Reference](https://docs.digitalocean.com/reference/doctl)
*   [Release Notes](https://docs.digitalocean.com/release-notes)
*   [Trust Platform](https://www.digitalocean.com/trust)

##### Community

*   [Tutorials](https://www.digitalocean.com/community/tutorials)
*   [Q&A](https://www.digitalocean.com/community/questions)
*   [Write for DOnations](https://www.digitalocean.com/community/pages/write-for-digitalocean)
*   [Currents Research](https://www.digitalocean.com/currents)
*   [Legal](https://www.digitalocean.com/legal)
*   [Code of Conduct](https://www.digitalocean.com/community/pages/code-of-conduct)

##### Support

*   [Support Center](/support)
*   [Report Abuse](https://www.digitalocean.com/company/contact/abuse)

* * *

© 2025 DigitalOcean, LLC. All rights reserved

[](https://x.com/digitalocean)[](https://www.instagram.com/thedigitalocean)[](https://www.facebook.com/DigitalOceanCloudHosting)[](https://discord.gg/digitalocean)[](https://www.youtube.com/DigitalOcean)[](https://www.linkedin.com/company/digitalocean)[](https://github.com/digitalocean)

### We can't find any results for your search.

Try using different keywords or simplifying your sear
