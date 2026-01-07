---
created: 2026-01-07
tags:
  - bright-data
  - scraper
  - digitalocean
  - networking
  - dns
  - api-docs
tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/networking/dns/how-to/manage-records/
domain: docs.digitalocean.com
---
                How to Create, Edit, and Delete DNS Records | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/dns.cb34d0653affb99d6826d0a3c70bdb8311ae7f51ca44810ae41cb1deb2e03a71.svg)Domains and DNS](/products/networking/dns/)
*   [Getting Started](/products/networking/dns/getting-started/)
    *   [Quickstart](/products/networking/dns/getting-started/quickstart/)
    *   [Use DO Name Servers](/products/networking/dns/getting-started/dns-registrars/)
*   [How-Tos](/products/networking/dns/how-to/)
    *   [Add Domains](/products/networking/dns/how-to/add-domains/)
    *   [Manage DNS Records](/products/networking/dns/how-to/manage-records/)
    *   [Manage CAA Records](/products/networking/dns/how-to/create-caa-records/)
    *   [Delete Domains](/products/networking/dns/how-to/delete-domains/)
    *   [Add Subdomains](/products/networking/dns/how-to/add-subdomain/)
    *   [Download Zone Files](/products/networking/dns/how-to/download-zone-file/)
*   [Reference](/products/networking/dns/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Domains)
    *   [CLI Reference](/reference/doctl/reference/compute/domain/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/dns/concepts/)
*   [Details](/products/networking/dns/details/)
    *   [Features](/products/networking/dns/details/features/)
    *   [Pricing](/products/networking/dns/details/pricing/)
    *   [Availability](/products/networking/dns/details/availability/)
    *   [Limits](/products/networking/dns/details/limits/)
*   [Support](/products/networking/dns/support/)

*   [How-Tos](/products/networking/dns/how-to/) 
*   Manage DNS Records

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create, Edit, and Delete DNS Records

Validated on 12 Aug 2025 • Last edited on 18 Dec 2025

Adding a domain you own to your DigitalOcean account lets you manage the domain’s DNS records with the control panel and API. Domains you manage on DigitalOcean integrate with DigitalOcean Load Balancers and Spaces to streamline automatic SSL certificate management.

Each type of DNS record has its own values and settings, and the sections below explain what each of these records are used for and how to configure them.

### Time To Live (TTL) Guidance[](#time-to-live-ttl-guidance)

All DNS records have one value in common: TTL, or time to live. TTL determines how long the record remains cached in an ISP’s DNS resolver before it expires.

Keeping records cached in local resolvers across the internet helps improve your website’s performance but it may mean that your site’s users don’t see DNS updates immediately. Setting a record’s TTL is a balance between performance and propagation of changes. If you don’t intend to update record data frequently, a higher TTL like 3600 (1 hour) or 86400 seconds (24 hours) is reasonable. If you update records often, a lower TTL like 300 (5 minutes) or 600 seconds (10 minutes) ensures changes propagate more quickly.

## Create, Update, or Delete Records Using the CLI[](#create-update-or-delete-records-using-the-cli)

Some of these commands require you to provide the record’s ID. You can retrieve a list of records and their IDs for a domain by using the `doctl compute domain records list <domain>` command.

How to Add a Record Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute domain records create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/domain/records/create/) for more details:
    
        doctl compute domain records create <domain> [flags]
    
    The following command creates an A record for the domain example.com:
    
        doctl compute domain records create example.com --record-type A --record-name example.com --record-data 198.51.100.215
    

How to Update a Record Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute domain records update`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/domain/records/update/) for more details:
    
        doctl compute domain records update <domain> [flags]
    
    The following command updates the record with the ID `98858421` for the domain `example.com`:
    
        doctl compute domain records update example.com --record-id 98858421 --record-name example.com --record-data 198.51.100.215
    

How to Delete a Record Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute domain records delete`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/domain/records/delete/) for more details:
    
        doctl compute domain records delete <domain> <record-id>... [flags]
    
    The following command deletes a DNS record with the ID `98858421` from the domain `example.com`:
    
        doctl compute domain records delete example.com 98858421
    

## Create, Update, or Delete Records Using the API[](#create-update-or-delete-records-using-the-api)

Some of these calls require you to provide the record’s ID. You can retrieve a list of records and their IDs for a domain using the [`/v2/domains/$DOMAIN_NAME/records` endpoint](/reference/api/digitalocean/#operation/domains_list_records).

How to Add a Record Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/domains/{domain_name}/records`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/domains_create_record).

### cURL[](#add-a-record-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"A","name":"www","data":"162.10.66.0","priority":null,"port":null,"ttl":1800,"weight":null,"flags":null,"tag":null}' \
      "https://api.digitalocean.com/v2/domains/example.com/records"

### Go[](#add-a-record-go)

Using [Godo](https://github.com/digitalocean/godo), the official DigitalOcean API client for Go:

    import (
        "context"
        "os"
    
        "github.com/digitalocean/godo"
    )
    
    func main() {
        token := os.Getenv("DIGITALOCEAN_TOKEN")
    
        client := godo.NewFromToken(token)
        ctx := context.TODO()
    
        createRequest := &godo.DomainRecordEditRequest{
          Type: "A",
          Name: "www",
          Data: "1.2.3.4",
        }
    
        domainRecord, _, err := client.Domains.CreateRecord(ctx, "example.com", createRequest)
    }

### Ruby[](#add-a-record-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    record = DropletKit::DomainRecord.new(
      type: 'A',
      name: 'www',
      data: '162.10.66.0'
    )
    client.domain_records.create(record, for_domain: 'example.com')

### Python[](#add-a-record-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "type": "A",
      "name": "www",
      "data": "162.10.66.0",
      "priority": None,
      "port": None,
      "ttl": 1800,
      "weight": None,
      "flags": None,
      "tag": None
    }
    
    resp = client.domains.create_record(domain_name="example.com", body=req)

How to Update a Record Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PATCH request to [`https://api.digitalocean.com/v2/domains/{domain_name}/records/{domain_record_id}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/domains_patch_record).

### cURL[](#update-a-record-curl)

Using cURL:

    curl -X PATCH \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name":"blog","type":"A"}' \
      "https://api.digitalocean.com/v2/domains/example.com/records/3352896"

### Python[](#update-a-record-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "name": "blog",
      "type": "A"
    }
    
    resp = client.domains.patch_record(domain_name="example.com", domain_record_id=2432342, body=req)

How to Delete a Record Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a DELETE request to [`https://api.digitalocean.com/v2/domains/{domain_name}/records/{domain_record_id}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/domains_delete_record).

### cURL[](#delete-a-record-curl)

Using cURL:

    curl -X DELETE \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/domains/example.com/records/3352896"

### Go[](#delete-a-record-go)

Using [Godo](https://github.com/digitalocean/godo), the official DigitalOcean API client for Go:

    import (
        "context"
        "os"
    
        "github.com/digitalocean/godo"
    )
    
    func main() {
        token := os.Getenv("DIGITALOCEAN_TOKEN")
    
        client := godo.NewFromToken(token)
        ctx := context.TODO()
    
        _, err := client.Domains.DeleteRecord(ctx, "example.com", 3352896)
    }

### Ruby[](#delete-a-record-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    client.domain_records.delete(for_domain: 'example.com', id: 3352896)

### Python[](#delete-a-record-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "name": "example.com"
    }
    
    resp = client.domains.delete_record(domain_name="example.com", domain_record_id=3352896)

## Create, Update, and Delete Records Using the Control Panel[](#create-update-and-delete-records-using-the-control-panel)

You can add, modify, and delete DNS records for a domain from the **Networking** page. From the [control panel](https://cloud.digitalocean.com), click **Networking** in the main menu, click the **Domains** tab, then click the domain you would like to manage.

To create a record, click **Create a record**, select the record type, fill in the fields required for that record type, and then click **Create Record**. The [supported record types](#supported-record-types) section below provides detailed configuration instructions for each type.

To modify or delete a record, on the right, open the record’s **More** menu, and then click **Edit record** to change the values for that record. To permanently delete the record, click **Delete**, then in the confirmation window enter the name of the domain and click **Delete**.

## Supported Record Types[](#supported-record-types)

### A Records[](#a-records)

An A record maps an IPv4 address to a domain name. This determines where to direct any requests for a domain name.

On DigitalOcean, A records have the following fields.

*   **Hostname** defines the hostname or subdomain to map. This can be:
    *   The **apex of a domain** (`@`). To map an apex domain, like `example.com`, to an IPv4 address, enter the `@` symbol.
        
    *   A **subdomain prefix**, such as `www`. To create a subdomain, enter a subdomain prefix. For example, to create `www.example.com`, enter `www` in the field.
        
    *   A **wildcard** (`*`). Wildcard records direct requests for a non-existent subdomain to a specified resource or IP address. For example, if you type `help.example.com` into your browser and the domain `example.com` doesn’t have a DNS record for that subdomain, the wildcard record directs you to the resource or IP address specified in its **WILL DIRECT TO** field. However, if any kind of DNS record exists for a subdomain, the existing record takes priority and the wildcard record is not applied. In this case, you need to explicitly define an A record for the subdomain. To create a wildcard record, enter a `*` into the **HOSTNAME** field.
        

*   **Will direct to** defines the resource or IP address to direct queries to. This can be:

*   A **DigitalOcean Droplet or Load Balancer** by typing its name into the field and selecting it from the menu.
*   A **non-DigitalOcean resource** by entering its IP address.

Note

It is possible to add multiple records for the same DNS entry, each pointing to a different IP address. This supports a load distribution and balancing strategy known as [Round Robin DNS](https://www.digitalocean.com/community/tutorials/how-to-configure-dns-round-robin-load-balancing-for-high-availability#traditional-application-deployment-structure).

### AAAA Records[](#aaaa-records)

An AAAA record, also called a Quad A record, maps an IPv6 address to a domain name. This determines where to direct requests for a domain name in the same way that an A record does for IPv4 addresses.

On DigitalOcean, AAAA records have the following fields.

*   **Hostname** defines the hostname or subdomain to map. This can be:
    *   The **apex of a domain** (`@`). To map an apex domain, like `example.com`, to an IPv4 address, enter the `@` symbol.
        
    *   A **subdomain prefix**, such as `www`. To create a subdomain, enter a subdomain prefix. For example, to create `www.example.com`, enter `www` in the field.
        
    *   A **wildcard** (`*`). Wildcard records direct requests for a non-existent subdomain to a specified resource or IP address. For example, if you type `help.example.com` into your browser and the domain `example.com` doesn’t have a DNS record for that subdomain, the wildcard record directs you to the resource or IP address specified in its **WILL DIRECT TO** field. However, if any kind of DNS record exists for a subdomain, the existing record takes priority and the wildcard record is not applied. In this case, you need to explicitly define an A record for the subdomain. To create a wildcard record, enter a `*` into the **HOSTNAME** field.
        

*   **Will direct to** defines the resource or IP address to direct queries to. This can be:

*   A DigitalOcean Droplet by typing its name and selecting it from the menu. The menu displays all of your Droplets but you can only select Droplets with IPv6 addresses. DigitalOcean Load Balancers support IPv6.
*   A non-DigitalOcean resource by entering its IPv6 address.

### CNAME Records[](#cname-records)

A CNAME record defines an alias for an A record and points one domain to another domain instead of an IP address. When the associated A record’s IP address changes, the CNAME directs traffic to the new address.

On DigitalOcean, CNAME records have the following fields.

*   **Hostname** defines the subdomain prefix for the new alias you want to create.
*   **Is an alias of** defines the hostname where the alias points to. For the alias to work, the target hostname must have an A record or be handled by a wildcard A record. This can be:
    *   The **apex of a domain** (`@`). To map an apex domain, like `example.com`, to an IPv4 address, enter the `@` symbol.
        
    *   A **subdomain prefix**, such as `www`. To create a subdomain, enter a subdomain prefix. For example, to create `www.example.com`, enter `www` in the field.
        

### MX Records[](#mx-records)

An MX record specifies the mail servers responsible for accepting email on behalf of your domain. Providers often make multiple name servers available so that if one is offline, another can respond. Each server needs its own MX record.

On DigitalOcean, MX records have the following fields.

*   **Hostname** specifies the domain the record applies to. In most cases, this field is set to the apex of your domain (`@`).
*   **Mail providers mail server** specifies the hostname that contains the A record for your mail provider’s server.
*   **Priority** indicates the order in which the mail servers are contacted. If you have multiple MX records, outgoing mail servers attempt to deliver the email to the record with the lowest priority first. This field takes a positive whole number where 1 is the highest priority.

### TXT Records[](#txt-records)

A TXT record is used to associate a string of text with a hostname. These are primarily used to verify that you own a domain.

On DigitalOcean, TXT records have the following fields.

*   **Hostname** defines the hostname or subdomain the record applies to. This can be:
    
    *   The **apex of a domain** (`@`). To map an apex domain, like `example.com`, to an IPv4 address, enter the `@` symbol.
        
    *   A **subdomain prefix**, such as `www`. To create a subdomain, enter a subdomain prefix. For example, to create `www.example.com`, enter `www` in the field.
        
*   **TXT Value** contains the text string associated with the hostname, such as `example_name=example_value`.
    

### SPF Records[](#spf-records)

Sender Policy Framework (SPF) records contain lists of email servers that are authorized to send email on behalf of your domain. SPF records increase your email sending reputation with inbox providers by providing a means to check that your emails are being sent from your domain and not by a malicious user.

SPF records are special TXT records. You can create them using the TXT record option in the control panel.

### DKIM Record[](#dkim-record)

Domain Keys Identified Mail (DKIM) records contain public keys used to authenticate email arriving from a domain. When you use DKIM on your email server, your server signs emails with a private key that receiving email servers then validate using the public key contained in a DKIM DNS record. DKIM records increase your email sending reputation with inbox providers by providing a means to check that no one has intercepted or altered the email during transit.

DKIM records are special TXT records. You can create them using the TXT record option in the control panel.

### NS Records[](#ns-records)

NS records specify the _name servers_, or servers that provide DNS services, for a domain or subdomain. You can use these to direct part of your traffic to another DNS service or to delegate DNS administration for a subdomain.

On DigitalOcean, NS records have the following fields.

*   **Hostname** specifies the domain or subdomain the record applies to. This can be:
    *   The **apex of a domain** (`@`). To map an apex domain, like `example.com`, to an IPv4 address, enter the `@` symbol.
        
    *   A **subdomain prefix**, such as `www`. To create a subdomain, enter a subdomain prefix. For example, to create `www.example.com`, enter `www` in the field.
        
    *   A **wildcard** (`*`). Wildcard records direct requests for a non-existent subdomain to a specified resource or IP address. For example, if you type `help.example.com` into your browser and the domain `example.com` doesn’t have a DNS record for that subdomain, the wildcard record directs you to the resource or IP address specified in its **WILL DIRECT TO** field. However, if any kind of DNS record exists for a subdomain, the existing record takes priority and the wildcard record is not applied. In this case, you need to explicitly define an A record for the subdomain. To create a wildcard record, enter a `*` into the **HOSTNAME** field.
        

*   **Will direct to** specifies the name server’s hostname to direct DNS queries to for the specified hostname.

Note

When you add a domain to DigitalOcean DNS, NS records pointing at DigitalOcean’s name servers are automatically created for it.

### SRV Records[](#srv-records)

SRV records specify a hostname and port number to direct certain types of traffic to particular servers. Some services, like [SIP](https://en.wikipedia.org/wiki/Session_Initiation_Protocol) (Session Initiation Protocol) and [XMPP/Jabber](https://en.wikipedia.org/wiki/XMPP) (Extensible Messaging and Presence Protocol), require SRV records.

On DigitalOcean, SRV records have the following fields.

*   **Hostname** specifies the symbolic name for the service followed by the service’s transport protocol (UDP or TCP), in the following format: `_service._protocol`. For example, to create a record for a SIP service that uses UDP, the value would look like this: `_sip._udp`.

*   **Will direct to**, which can be set to:

*   The **apex of a domain** (`@`). To map an apex domain, like `example.com`, to an IPv4 address, enter the `@` symbol.
    
*   A **subdomain prefix**, such as `www`. To create a subdomain, enter a subdomain prefix. For example, to create `www.example.com`, enter `www` in the field.
    
*   A **fully qualified domain name** (FQDN), such as `fqdn.example.com.`. To use an FQDN, enter the FQDN with a period (`.`) at the end. This distinguishes it from a subdomain prefix.
    
*   **Port** specifies the port that the service listens on, for example, `5060`.
    
*   **Priority** specifies the priority of the record. If there are multiple SRV records with the same service and protocol, the one with the lowest priority is used first. This field takes a positive whole number, such as `3`.
    
*   **Weight** determines which record to use if multiple SRV records exist with the same priority value. This field takes a positive whole number, such as `60`. Records with higher numbers receive higher preference.
    

### CAA Records[](#caa-records)

CAA records specify which certificate authorities are permitted to issue certificates for a domain. You can use them to reduce the risk of bad actors from creating unauthorized SSL/TLS certificates for your domain. See our [detailed CAA record documentation](/products/networking/dns/how-to/create-caa-records/) for detailed information on how to use them.

### PTR (rDNS) Records[](#ptr-rdns-records)

PTR (pointer) records, also known as an rDNS (reverse DNS) records, map an IP address to a domain name.

We automatically create PTR records for Droplets based on the name you give that Droplet in the control panel. The name must be a valid FQDN. For example, using `example.com` as the Droplet name creates a PTR record, but `ubuntu-s-4vcpu-8gb-fra1-01` or `my-droplet` does not. Droplets with IPv6 enabled only have PTR records enabled for the first IPv6 address assigned to it, not to all 16 addresses available.

You cannot manually create PTR records through the DigitalOcean DNS interface.

In this article...

*   *   [Time To Live (TTL) Guidance](#time-to-live-ttl-guidance)
*   [Create, Update, or Delete Records Using the CLI](#create-update-or-delete-records-using-the-cli)
*   [Create, Update, or Delete Records Using the API](#create-update-or-delete-records-using-the-api)
*   [Create, Update, and Delete Records Using the Control Panel](#create-update-and-delete-records-using-the-control-panel)
*   [Supported Record Types](#supported-record-types)
    *   [A Records](#a-records)
    *   [AAAA Records](#aaaa-records)
    *   [CNAME Records](#cname-records)
    *   [MX Records](#mx-records)
    *   [TXT Records](#txt-records)
    *   [SPF Records](#spf-records)
    *   [DKIM Record](#dkim-record)
    *   [NS Records](#ns-records)
    *   [SRV Records](#srv-records)
    *   [CAA Records](#caa-records)
    *   [PTR (rDNS) Records](#ptr-rdns-records)

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

Try using different key