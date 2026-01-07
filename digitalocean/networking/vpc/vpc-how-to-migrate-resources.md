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
source_url: https://docs.digitalocean.com/products/networking/vpc/how-to/migrate-resources/
domain: docs.digitalocean.com
---
                How to Migrate Resources Into and Between VPC Networks | DigitalOcean Documentation

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

*   [How-Tos](/products/networking/vpc/how-to/) 
*   Migrate Resources

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Migrate Resources Into and Between VPC Networks

Validated on 6 Oct 2020 • Last edited on 17 Apr 2025

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

Some DigitalOcean resources can be migrated into and between VPC networks. DigitalOcean currently supports migration for Droplets and Databases.

Note

Kubernetes clusters and load balancers cannot be migrated between VPC networks at this time.

## Migrate Droplets Into A VPC Network[](#migrate-droplets-into-a-vpc-network)

You can’t migrate Droplets into or between VPC networks directly, but you can recreate a Droplet inside of a VPC network using a [snapshot](/products/snapshots/). Snapshots are on-demand images of Droplets. You can create new Droplets based on snapshots to create a copy of it in the same state. You can use this workflow to add older Droplets to a VPC network that do not currently have VPC networking enabled.

To migrate a Droplet into a VPC network, from the [control panel](https://cloud.digitalocean.com), click **Droplets** in the main menu. In the list of Droplets, click the name of Droplet that you want to migrate.

You can power off a Droplet through the control panel or from the command line. We recommend the command line because it ensures all services are stopped before the Droplet is powered off:

    sudo shutdown -h now

However, if you want to power off a Droplet through the control panel, click the Droplet’s name to go to its detail page. Click the **ON** switch in the upper-right corner, then click **Turn off** from the pop-up warning window.

Once the Droplet is powered off, you can take a snapshot from the Droplet’s **Snapshots** menu, in the **Take snapshot** section.

![Take snapshot button](https://docs.digitalocean.com/screenshots/snapshots/take-snapshot.e5a1614921a1748b3ff166993c9330496964438059589f4160060a3c4342e0b5.png)

The **Enter snapshot name** field prefills the Droplet’s name followed by the current [Unix timestamp](https://www.unixtimestamp.com/index.php) to help you identify the snapshot later, but you can customize the name now or after you take it. Click the **Take Snapshot** or **Take Live Snapshot** button to create a snapshot.

A progress bar shows the progress of snapshot creation. Once complete, the snapshot is listed along with any other previous snapshots. To power the Droplet back on, click the **OFF** switch.

If you are migrating the Droplet to a VPC network in another datacenter region, click the **More** menu of the newly created snapshot, then click **Add to region** to copy the image to the new region. This lets you create Droplets based on that snapshot in the new region.

![Add snapshot to region](https://docs.digitalocean.com/screenshots/vpc/vpc-snapshot-add-region.89ed002f93661ef23f8f87998fbc953063e6691469b4364f2ebb7a26f2a4ff75.png)

Once you have created the snapshot, click the **More** menu beside the snapshot and select **Create Droplets**.

![Create Droplet from Snapshot](https://docs.digitalocean.com/screenshots/vpc/vpc-snapshot-create-droplet.6d49ef3f453da5c62fd248a3d207ff1892d9cc3430e171dc4ba26798b4636469.png)

On the **Create Droplets** page, under the **Choose a datacenter region**, select the region that the target VPC network resides in and then select the target VPC network from the **VPC Network** menu.

![Choose datacenter region and VPC network](https://docs.digitalocean.com/screenshots/vpc/vpc-droplet-choose-region.b04785992f3ecd2aad6ceab7eae5cbd41abf14ba35ba4ada4b454aa413b6d6db.png)

Specify any additional tags, names, and projects for your Droplet, then click the **Create Droplet** button. A progress bar displays your Droplet’s creation progress.

Once the Droplet is created, it is automatically assigned an IP address in your VPC network and is accessible from other resources in the network.

## Migrate Your Database to a Different VPC Network[](#migrate-your-database-to-a-different-vpc-network)

You can migrate managed databases directly between VPC networks in your account.

From the control panel, click **Databases** in the main menu. From the list of databases, click the database that you want to migrate, then click the **Settings** tab.

Under **Cluster datacenter** click **Edit**.

![Database settings](https://docs.digitalocean.com/screenshots/vpc/vpc-db-settings.2e4dca25b060aab5ba339a9bbfd14b23f88e406c09feece4b42d59949c56a1b4.png)

Select the datacenter the target VPC network resides in, then select the target VPC network from the **VPC Network** menu.

![Choose region and VPC network](https://docs.digitalocean.com/screenshots/vpc/vpc-db-region-network.585e81da30f2cf01d4fdc557d4c02ae10a278ca757157c26b4843ce94d2a91eb.png)

Click **Save**. A progress bar displays your database’s migration progress. Once the database is migrated, it is automatically assigned an IP address in your VPC network and is accessible from other resources in the network.

In this article...

*   [Migrate Droplets Into A VPC Network](#migrate-droplets-into-a-vpc-network)
*   [Migrate Your Database to a Different VPC Network](#migrate-your-database-to-a-different-vpc-network)

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

Try using different keywords or simplifying y