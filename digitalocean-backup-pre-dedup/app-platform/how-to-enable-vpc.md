---
source: https://docs.digitalocean.com/products/app-platform/how-to/enable-vpc/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Enable App Platform VPC

Validated on 8 Jul 2025 • Last edited on 24 Sep 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

App Platform apps in all regions support VPC networks, allowing you to connect apps to other VPC-enabled resources (such as DBaaS, Droplets, and Kubernetes) over a private network. For more details about VPC networks, see the [VPC product page](/products/networking/vpc/).

The App Platform VPC integration enables you to:

*   Access resources over a secure private network instead of the public internet
*   Connect to VPC resources in any DigitalOcean datacenter using VPC peering

Apps can only directly connect to VPCs in one specific datacenter in their region. This limitation exists because App Platform regions abstract away underlying datacenters, but VPC networks are tied to specific datacenter locations. As a result, apps can only connect to VPC networks that are in the same datacenter where the app is deployed.

App Spec Region

App Can Connect To VPCs In

`ams`

`ams3`

`blr`

`blr1`

`fra`

`fra1`

`lon`

`lon1`

`nyc`

`nyc1`

`sfo`

`sfo3`

`sgp`

`sgp1`

`syd`

`syd1`

`tor`

`tor1`

You can use [VPC peering](/products/networking/vpc/how-to/create-peering/) to work around this limitation. Peering allows resources in different VPC networks, including those in other regions, to communicate over the private network. For example, if an app is deployed in the `nyc` region and connects to a VPC network in `nyc1`, you can peer that `nyc1` VPC network with another in `ams3`. This allows your app to privately access resources located in Amsterdam through the peered connection.

To set this up:

1.  Create or use an existing VPC network in the app’s region based on the mapping above. For example, an app deployed in the `nyc` region must connect to a VPC network in `nyc1`.
2.  Peer that VPC network with another VPC network in the region where your resources are located. For instance, peering a VPC network in `nyc1` with one in `ams3`.

Once peered, your app can connect to resources in the peered VPC network through its regional VPC network, all over a private connection.

To connect to a [database with trusted sources enabled](/products/databases/mysql/how-to/secure/) through the VPC network, you must first add the app’s VPC egress private IP to the database’s list of trusted sources.

## Enable VPC using the App Spec[](#enable-vpc-using-the-app-spec)

You can enable VPC network access for your app in the **App Settings** page. You can also use `doctl` with the public API. First, find the UUID of the VPC network you want to connect your app to. To list all DigitalOcean VPCs and their UUIDs, run the following [`doctl` command](/reference/doctl/how-to/install/):

    doctl vpcs list

Alternatively, you can go to a specific VPC’s dashboard in the [control panel](https://cloud.digitalocean.com/networking/vpc) and check the URL in your browser. The following example URL displays the VPC network’s UUID as `your-id`:

    https://cloud.digitalocean.com/networking/vpc/your-id/resources?i=c7a311

Once you have the VPC’s ID, update or add the `vpc` field to [your app’s spec file](/products/app-platform/how-to/update-app-spec/), replacing `your-id` with the UUID of the VPC you want to connect to:

    vpc:
        id: your-id

Click **Save** and wait for your app to redeploy. Then, confirm you have successfully enabled VPC on your app by running the following command from the app’s terminal in the control panel:

    curl <droplet private ip>:<port>

To change which VPC network your app is connected to, update the `id` field in the app spec and then click **Save**. To disconnect your app from the VPC network, remove the entire `vpc` field from the app spec and then click **Save**.

VPC is not currently supported for Function components.