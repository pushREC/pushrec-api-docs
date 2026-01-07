---
source: https://docs.digitalocean.com/products/droplets/getting-started/recommended-droplet-setup/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
egistry:update | DigitalOcean Documentation

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
        *   [account](/reference/api/scopes/account/)
        *   [actions](/reference/api/scopes/actions/)
        *   [addon](/reference/api/scopes/addon/)
        *   [api](/reference/api/scopes/api/)
        *   [app](/reference/api/scopes/app/)
        *   [billing](/reference/api/scopes/billing/)
        *   [block\_storage](/reference/api/scopes/block_storage/)
        *   [block\_storage\_action](/reference/api/scopes/block_storage_action/)
        *   [block\_storage\_snapshot](/reference/api/scopes/block_storage_snapshot/)
        *   [cdn](/reference/api/scopes/cdn/)
        *   [certificate](/reference/api/scopes/certificate/)
        *   [database](/reference/api/scopes/database/)
        *   [domain](/reference/api/scopes/domain/)
        *   [droplet](/reference/api/scopes/droplet/)
        *   [firewall](/reference/api/scopes/firewall/)
        *   [function](/reference/api/scopes/function/)
        *   [genai](/reference/api/scopes/genai/)
        *   [image](/reference/api/scopes/image/)
        *   [kubernetes](/reference/api/scopes/kubernetes/)
        *   [load\_balancer](/reference/api/scopes/load_balancer/)
        *   [monitoring](/reference/api/scopes/monitoring/)
        *   [partner\_network\_connect](/reference/api/scopes/partner_network_connect/)
        *   [project](/reference/api/scopes/project/)
        *   [regions](/reference/api/scopes/regions/)
        *   [registry](/reference/api/scopes/registry/)
            *   [registry:create](/reference/api/scopes/registry/create/)
            *   [registry:delete](/reference/api/scopes/registry/delete/)
            *   [registry:read](/reference/api/scopes/registry/read/)
            *   [registry:update](/reference/api/scopes/registry/update/)
        *   [reserved\_ip](/reference/api/scopes/reserved_ip/)
        *   [sizes](/reference/api/scopes/sizes/)
        *   [snapshot](/reference/api/scopes/snapshot/)
        *   [spaces](/reference/api/scopes/spaces/)
        *   [spaces\_key](/reference/api/scopes/spaces_key/)
        *   [ssh\_key](/reference/api/scopes/ssh_key/)
        *   [tag](/reference/api/scopes/tag/)
        *   [uptime](/reference/api/scopes/uptime/)
        *   [vendor\_portal](/reference/api/scopes/vendor_portal/)
        *   [vpc](/reference/api/scopes/vpc/)
        *   [vpc\_peering](/reference/api/scopes/vpc_peering/)
*   [![](/images/icons/mcp.ecd474dcd1a6781abb68b3a2ccb9cec4594cac83394f0c3b3661148969c0700e.svg)MCP Server](/reference/mcp/)
*   [![](/images/icons/ml.8fa526f2000be550be4cf13328efa900204aadddf78ca969ef95c31dee1c9c94.svg)Paperspace](/reference/paperspace/)
*   [![](/images/icons/ansible.e7aa45274ed1f6e2568e7246a3176c23f381abf51095a7ed3248431c6dfb75e1.svg)Ansible](/reference/ansible/)
*   [![](/images/icons/terraform.1c898126c7e49861340a2005886eb496e4755c9b2b737b14ea0d3a949a7ec619.svg)Terraform](/reference/terraform/)
*   [![](/images/icons/python.ccad6ea84a17bb64de581eba7a7efe96ff4b80b41bdf53a90a4819ba20e0dcaa.svg)PyDo](/reference/pydo/)
*   [![](/images/icons/libraries.f718f930c4f806c3d2f8548b78661d1b4e835959e441cd3499fb93dac044b021.svg)Libraries](/reference/libraries/)
*   [![](/images/icons/opensource.e3aaf41478fe88f6808cf399b9357d9d23fe3f04f3a9ed58f6cc7b261f2e04c3.svg)Open Source](/reference/opensource/)

*   
*   [Token Scopes](/reference/api/scopes/) 
*   [registry](/reference/api/scopes/registry/) 
*   registry:update

[Give Feedback](https://ideas.digitalocean.com/documentation)

# registry:update

Last edited on 28 Aug 2025

## Scope Summary[](#scope-summary)

Modify container registries

## Required Scopes[](#required-scopes)

To add a scope to an API token, you must also add its required scopes. For example, to add a non-read scope for a resource type, you must also add the read scope for that resource type.

The following scopes are required for `registry:update`:

Scope

Description

[`registry:read`](../../registry/read)

View container registries

In this article...

*   [Scope Summary](#scope-summary)
*   [Required Scopes](#required-scopes)

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

Try using different keywords or simplifying your search terms
