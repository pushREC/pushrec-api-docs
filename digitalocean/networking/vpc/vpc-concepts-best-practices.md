---
created: 2026-01-07
tags:
  - bright-data
  - scraper
  - digitalocean
  - networking
  - vpc
  - api-docs
tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/networking/vpc/concepts/best-practices/
domain: docs.digitalocean.com
---
                Use VPC Networks to Secure Your Servers and Other Best Practices | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/vpc.8e35a29c5ce11122208ae3824979d1635c2e67bfb31236328f0665502135db7e.svg)VPC](/products/networking/vpc/)
*   [Getting Started](/products/networking/vpc/getting-started/)
    *   [Quickstart](/products/networking/vpc/getting-started/quickstart/)
*   [How-Tos](/products/networking/vpc/how-to/)
    *   [Create VPCs](/products/networking/vpc/how-to/create/)
    *   [Destroy VPCs](/products/networking/vpc/how-to/destroy/)
    *   [Add Resources](/products/networking/vpc/how-to/add-resources/)
    *   [Migrate Resources](/products/networking/vpc/how-to/migrate-resources/)
    *   [Enable on Existing Droplets](/products/networking/vpc/how-to/enable/)
    *   [Set Default VPC](/products/networking/vpc/how-to/set-default-vpc/)
    *   [Use VPC-local DNS](/products/networking/vpc/how-to/use-local-dns-resolver/)
    *   [Create Peering](/products/networking/vpc/how-to/create-peering/)
    *   [Destroy Peering](/products/networking/vpc/how-to/destroy-peering/)
    *   [Update Peering Routes](/products/networking/vpc/how-to/update-peering-routes/)
    *   [Create NAT Gateway](/products/networking/vpc/how-to/create-nat-gateway/)
    *   [Destroy NAT Gateway](/products/networking/vpc/how-to/destroy-nat-gateway/)
    *   [Configure Droplets for NAT Gateway](/products/networking/vpc/how-to/configure-droplet-nat-gateway/)
    *   [Configure DOKS for NAT Gateway](/products/networking/vpc/how-to/configure-doks-nat-gateway/)
    *   [Create Partner Attachment](/products/networking/vpc/how-to/create-partner-attachment/)
    *   [Destroy Partner Attachment](/products/networking/vpc/how-to/destroy-partner-attachment/)
    *   [Edit Partner Attachment VPC](/products/networking/vpc/how-to/edit-partner-attachment-vpc/)
    *   [Add High Availability to Partner Attachment](/products/networking/vpc/how-to/add-ha-to-partner-attachment/)
    *   [Troubleshoot Partner Attachment](/products/networking/vpc/how-to/troubleshoot-partner-attachment/)
*   [Reference](/products/networking/vpc/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/VPCs)
    *   [CLI Reference](/reference/doctl/reference/vpcs/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/vpc/concepts/)
    *   [Plan Custom VPC Network](/products/networking/vpc/concepts/plan-your-network/)
    *   [VPC Best Practices](/products/networking/vpc/concepts/best-practices/)
*   [Details](/products/networking/vpc/details/)
    *   [Features](/products/networking/vpc/details/features/)
    *   [Pricing](/products/networking/vpc/details/pricing/)
    *   [Availability](/products/networking/vpc/details/availability/)
    *   [Limits](/products/networking/vpc/details/limits/)
*   [Support](/products/networking/vpc/support/)

*   [Concepts](/products/networking/vpc/concepts/) 
*   VPC Best Practices

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Use VPC Networks to Secure Your Servers and Other Best Practices

Validated on 28 Apr 2020 • Last edited on 14 Nov 2025

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

While developing your systems and applications, you should build your infrastructure as securely as possible to avoid bad actors from compromising your infrastructure. This guide outlines how to implement VPC and other best security practices to help you develop secure infrastructure.

## Isolate Environments and Tenants with VPC Networks[](#isolate-environments-and-tenants-with-vpc-networks)

VPC networks allow you to better secure execution environments, tenants, and applications by isolating resources into networks that can’t be reached by the public internet. This keeps your resources organized and keeps access to them limited to other resources in the VPC network. This can also boost privacy for tenants using your applications.

**Isolate Execution Environments**

A common implementation is to create a VPC network for each of your development, staging, and production environments. This would mean replicating your application’s web servers, databases, and storage volumes across three separate VPC networks and then safely deploying your application changes to each subsequent environment.

![Isolate environments using VPCs](https://docs.digitalocean.com/screenshots/vpc/resources/vpc-isolate-environments.00f8cd2cf167e475c91894730c6092448ee673cc40fe65beb5d24b1f72bfdb8b.png)

**Isolate Tenants**

VPC networks also allow you to isolate different tenants (customers) from one another by separating them into each of their own VPC networks. Isolating tenants to their own VPC network keeps their resources secure from other tenants from connecting to their resources by mistake and avoids privacy issues.

This network diagram illustrates how tenants’ environments could be isolated. The internet gateways in each tenancy are optional.

![Isolate tenants using VPCs](https://docs.digitalocean.com/screenshots/vpc/resources/vpc-isolate-tenants.e097ce0da845bb1d52af0d75e2e9d24fafb2b5bdf491025048dd4c9d52f9f37b.png)

## Internet Gateways[](#internet-gateways)

Internet gateways route traffic between your VPC resources and the public internet. DigitalOcean provides a managed Network Address Translation (NAT) Gateway service that centralizes outbound internet access for VPC resources within a datacenter. This enables isolating backend IPs while maintaining secure internet connectivity.

*   When implementing internet gateways for your VPC network, use the DigitalOcean [Network Address Translation (NAT) Gateway](/products/networking/vpc/how-to/create-nat-gateway/) service instead of manual Droplet configuration.
*   Configuring internet gateways involves networking changes that impact network connectivity and performance if not done properly. Test NAT Gateway configurations and connectivity in a development environment before implementing in production.
*   Verify outbound internet connectivity from all backend Droplets and services through the NAT Gateway.
*   Configure Droplets behind the NAT Gateway to use the VPC-local DNS resolver for reliable performance and to prevent DNS rate-limiting issues.

**How to Implement NAT Gateways**

You can [create NAT gateways](/products/networking/vpc/how-to/create-nat-gateway/) using the DigitalOcean Control Panel, CLI, or API. You can also configure backend resources to use NAT gateways:

*   [Configure Droplets for NAT Gateway](/products/networking/vpc/how-to/configure-droplet-nat-gateway/) for outbound internet access through the gateway.
*   [Configure DOKS for NAT Gateway](/products/networking/vpc/how-to/configure-doks-nat-gateway/) to route Kubernetes cluster traffic through the gateway.

## SSH Keys[](#ssh-keys)

SSH keys are cryptographic keys that can be used as credentials to access your Droplets using an encrypted connection. Each set of keys contains one public and one private key: the public key residing on the Droplet being accessed, and the private key residing on the device accessing the server.

Because SSH keys contain more bits of data, they are significantly more difficult to compromise than traditional passwords. Establishing SSH keys allows you to safely disable password-based authentication to your Droplets.

**How to Implement SSH Keys**

You can [add SSH keys when you create new Droplets](/products/droplets/how-to/create/) or [add SSH keys to existing Droplets](/products/droplets/how-to/add-ssh-keys/).

## Cloud Firewalls[](#cloud-firewalls)

Cloud Firewalls provide an additional layer of protection between your DigitalOcean resources and the public internet. They allow you to define which types of connections are allowed to connect to your Droplets and what services are exposed on them. You can configure them to restrict access to specific ports on your Droplet or block specific types of connections, such as SSH or SMTP connections.

On your Droplet, a number of services are running by default, which you can categorize into the following groups:

*   **Public services** can be accessed by anyone on the public internet, such as your personal blog or company website.
*   **Private services** can be accessed by a select group of authorized users, such as a database.
*   **Internal services** should only be accessible from within the server itself, such as databases that only accept local connections or server logs.

You can configure cloud firewalls with varying layers of granularity to filter traffic to your Droplet’s services, such as only allowing inbound SSH connections from a specific range of IPs to your Droplet. These are called rules. Each firewall can have up to 50 total incoming and outgoing rules. A DigitalOcean Cloud Firewall can protect a maximum of 10 individual Droplets. A cloud firewall can protect more than 10 Droplets if the firewall is applied to an entire tag of Droplets.

**How to Implement Cloud Firewalls** You can [create and apply cloud firewalls](/products/networking/firewalls/getting-started/quickstart/) using the DigitalOcean Control Panel or API. You can also use third-party firewall software on your Droplets, such as UFW, iptables, or CSF, but they require some manual configuration. See our community tutorials on how to set up third-party firewall software:

*   [How To Setup a Firewall with UFW on an Ubuntu and Debian Cloud Server](https://www.digitalocean.com/community/tutorials/how-to-setup-a-firewall-with-ufw-on-an-ubuntu-and-debian-cloud-server)
*   [How To Set Up a Firewall Using Iptables on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-iptables-on-ubuntu-14-04)
*   [How To Install and Configure Config Server Firewall (CSF) on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-config-server-firewall-csf-on-ubuntu)

## Service Auditing[](#service-auditing)

Service auditing is the practice of regularly reviewing the services running on your infrastructure to ensure that they are supposed to be running on your system and are behaving correctly. Often, the default operating system is configured to run certain services at boot. Installing additional software can sometimes pull in dependencies that are also auto-started. Each service running on your servers is an increased opportunity for malicious attackers to compromise your infrastructure. As you run more services on a server, you need to update more to keep your services security compliant.

**How to Implement Service Auditing on Your Droplet**

You can audit your Droplet’s services several different ways. The `netstat` tool is one option, but you can use other networking tools to develop a regimen that works for you.

`netstat` returns a list of services currently running on your machine, the ports they are using, and the types of connections they are making to other resources in your network or on the internet:

    sudo netstat -plunt

You receive output that looks like this:

    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      887/sshd
    tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      919/nginx
    tcp6       0      0 :::22                   :::*                    LISTEN      887/sshd
    tcp6       0      0 :::80                   :::*                    LISTEN      919/nginx

The most important columns are `Proto`, `Local Address`, and `PID/Program name`. If the address is 0.0.0.0, then the service is accepting connections on all interfaces. If you do not recognize a service that is running on your server, research its purpose and whether it belongs on your server.

In this article...

*   [Isolate Environments and Tenants with VPC Networks](#isolate-environments-and-tenants-with-vpc-networks)
*   [Internet Gateways](#internet-gateways)
*   [SSH Keys](#ssh-keys)
*   [Cloud Firewalls](#cloud-firewalls)
*   [Service Auditing](#service-auditing)

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

Try using different keywords or simplifying you