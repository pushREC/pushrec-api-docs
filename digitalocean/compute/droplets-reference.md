---
source: https://docs.digitalocean.com/products/droplets/reference/
scraped: 2026-01-07
tags: [digitalocean, compute, droplets, api-docs]
---

How to Work with DigitalOcean Load Balancers Using doctl | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/load-balancers.1b5f8a9d40bf92d2798a187032a28a29572afdd5e74855e5b1c1d30dfffc07ed.svg)Load Balancers](/products/networking/load-balancers/)
*   [Getting Started](/products/networking/load-balancers/getting-started/)
    *   [Quickstart](/products/networking/load-balancers/getting-started/quickstart/)
    *   [Manage Load Balancers with doctl](/products/networking/load-balancers/getting-started/with-doctl/)
*   [How-Tos](/products/networking/load-balancers/how-to/)
    *   [Create Regional Load Balancers](/products/networking/load-balancers/how-to/create/)
    *   [Create Global Load Balancers](/products/networking/load-balancers/how-to/create-global-load-balancer/)
    *   [Manage Regional Load Balancers](/products/networking/load-balancers/how-to/manage/)
    *   [Manage Global Load Balancers](/products/networking/load-balancers/how-to/manage-global-load-balancers/)
    *   [Scale Regional Load Balancers](/products/networking/load-balancers/how-to/scale/)
    *   [Configure SSL Passthrough](/products/networking/load-balancers/how-to/ssl-passthrough/)
    *   [Balance TCP Traffic](/products/networking/load-balancers/how-to/tcp/)
    *   [Configure Backend Droplets](/products/networking/load-balancers/how-to/configure-droplets-for-nlb/)
    *   [Destroy Load Balancers](/products/networking/load-balancers/how-to/destroy/)
    *   [Configure SSL Termination](/products/networking/load-balancers/how-to/ssl-termination/)
*   [Reference](/products/networking/load-balancers/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Load-Balancers)
    *   [CLI Reference](/reference/doctl/reference/compute/load-balancer/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/load-balancers/concepts/)
    *   [Best Practices](/products/networking/load-balancers/concepts/best-practices/)
    *   [Load Balancer Status](/products/networking/load-balancers/concepts/load-balancer-status/)
*   [Details](/products/networking/load-balancers/details/)
    *   [Features](/products/networking/load-balancers/details/features/)
    *   [Pricing](/products/networking/load-balancers/details/pricing/)
    *   [Availability](/products/networking/load-balancers/details/availability/)
    *   [Limits](/products/networking/load-balancers/details/limits/)
*   [Support](/products/networking/load-balancers/support/)

*   [Getting Started](/products/networking/load-balancers/getting-started/) 
*   Manage Load Balancers with doctl

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Work with DigitalOcean Load Balancers Using doctl

Validated on 20 Sep 2021 • Last edited on 14 Aug 2024

DigitalOcean fully manages Regional Load Balancers and Global Load Balancers, ensuring they are highly available load balancing services. Load balancers distribute traffic to groups of backend resources in specific regions or across different regions, which prevents the health of a service from depending on the health of a single server, cluster, or region.

DigitalOcean Load Balancers let you distribute HTTP, HTTPS, and TCP traffic between multiple backend servers. This tutorial uses `doctl`, the official command-line client for DigitalOcean’s API, to create and configure a load balancer for multiple backend web servers.

## Prerequisites[](#prerequisites)

Before starting this tutorial, we recommend familiarizing yourself with `doctl` and DigitalOcean Load Balancers:

*   [How To Use doctl, the Official DigitalOcean Command-Line Client](https://www.digitalocean.com/community/tutorials/how-to-use-doctl-the-official-digitalocean-command-line-client)
*   [Documentation home page for DigitalOcean Load Balancers](/products/networking/load-balancers/)

You also need to have `doctl` version 1.6.0 or higher installed and authenticated. You can check your `doctl` version by running `doctl version`. You also need to have an SSH key added to your DigitalOcean account.

## Step 1: Setting Up the Backend Web Servers[](#step-1-setting-up-the-backend-web-servers)

First, use `doctl` to create the two web servers for the load balancer to use. This example starts with two servers that have the LAMP stack (Linux, Apache, MySQL, PHP) preinstalled, and updates them to each serve unique web pages so you can verify that the load balancer is distributing connections between multiple servers.

In order to create the two servers, you need to choose the region in which to create them and you need the fingerprint of the SSH key you want to use.

This example uses the **nyc1** region, but you can list all the regions and their shortened slugs with `doctl compute region list`. Your load balancer and its target Droplets must all be in the same region.

To find your SSH key fingerprint, again use `doctl`:

    doctl compute ssh-key list

    ID         Name          FingerPrint
    7738555    sammy@host    your_ssh_key_fingerprint

This example uses a one-click LAMP stack image running Ubuntu 20.04 installed on a 1GB Droplet. You can list the different options available for images and Droplet sizes with [`doctl list`](https://www.digitalocean.com/community/tutorials/how-to-use-doctl-the-official-digitalocean-command-line-client#creating,-deleting,-and-inspecting-droplets).

Use the following command to create both servers:

    doctl compute droplet create web-1 web-2 \
       --region nyc1 \
       --image lamp-20-04 \
       --ssh-keys your_ssh_key_fingerprint \
       --enable-private-networking \
       --size s-1vcpu-1gb

`web-1` and `web-2` are be the names of the servers. `--enable-private-networking` ensures that the traffic from the load balancer to the target Droplets stays on DigitalOcean’s unmetered private network.

The `create` command outputs information about the new Droplets:

    ID          Name     Public IPv4    Private IPv4    Public IPv6    Memory    VCPUs    Disk    Region    Image                   Status    Tags
    48463543    web-1                                                  1024      1        25      nyc1      Ubuntu LAMP on 20.04    new
    48463544    web-2                                                  1024      1        25      nyc1      Ubuntu LAMP on 20.04    new

Wait a few minutes for both servers to finish being provisioned, and then list the Droplets with the `list` command. This command accepts the `*` wildcard character, which this command uses to only show Droplets with at least `web-` in their name:

    doctl compute droplet list web-*

    ID          Name      Public IPv4        Private IPv4    Public IPv6    Memory    VCPUs    Disk    Region    Image                   Status    Tags
    48603683    web-1    111.111.111.111     111.111.111.333                   1024      1       25      nyc1      Ubuntu LAMP on 20.04    active
    48603684    web-2    111.111.111.222     111.111.111.444                   1024      1       25      nyc1      Ubuntu LAMP on 20.04    active

The Droplets now have IPv4 addresses assigned and are listed as `active`. If you navigate to either of the Droplets’ public addresses in your web browser, a default Apache placeholder page loads.

Next, you should add new unique page to each to be able to tell `web-1` apart from `web-2`.

SSH into the server with `doctl`:

    doctl compute ssh web-1

This connects and logs you in as **root** using the SSH key you specified during creation. Open up a new HTML file on the server using `nano` or your favorite text editor:

    nano /var/www/html/test.html

Paste the following HTML snippet in `/var/www/html/test.html`:

    <h1 style="color:blue">Hello from web-1!</h1>

Save the file and exit the text editor. This is not a full HTML file, but browsers are forgiving and it’s sufficient for testing purposes.

Navigate to the following address `http://web-1_public_ip_address/test.html` to make sure the new page is being served properly. Substitute the correct IP address. On the page, you should see the headline **Hello from web-1!**.

Exit out of the SSH session and SSH into the second server, repeating the same process using a different message in the HTML page:

    exit
    doctl compute ssh web-2

Open the new HTML file:

    nano /var/www/html/test.html

Paste the following content into `/var/www/html/test.html`:

    <h1 style="color: orange">Hello from web-2!</h1>

Save and exit the text editor, then exit the SSH session:

    exit

Use your browser to check that `web-2` is also serving the new web page properly. If so, you can now create a load balancer to distribute load between the two servers.

## Step 2: Creating a Load Balancer[](#step-2-creating-a-load-balancer)

This example creates a new load balancer in the `nyc1` region. The load balancer and its target Droplets need to be in the same region, so if you created your Droplets in a different region, use that region instead.

    doctl compute load-balancer create \
       --name load-balancer-1 \
       --region nyc1 \
       --forwarding-rules entry_protocol:http,entry_port:80,target_protocol:http,target_port:80

This command creates a load balancer with the name `load-balancer-1` in the `nyc1` region. Each load balancer needs at least one rule under the `--forwarding-rules` flag. These rules describe how the load balancer accepts and forwards traffic onto the targets. The above forwarding rule passes HTTP traffic on port 80 straight through to the target servers.

Other `--forwarding-rules` protocol options are `https` and `tcp`, and you can choose any valid ports for both entry and target. If you need to specify multiple forwarding rules, surround the whole list of rules in quotes and use a space between each rule. Here’s an example that would enable both HTTP and HTTPS forwarding:

    --forwarding-rules "entry_protocol:http,entry_port:80,target_protocol:http,target_port:80 entry_protocol:https,entry_port:443,target_protocol:https,target_port:443"

The `create` command outputs information about the new load balancer:

    ID                                      IP    Name               Status    Created At              Algorithm      Region    Tag    Droplet IDs    SSL      Sticky Sessions                                Health Check                                                                                                                   Forwarding Rules
    ae3fa042-bfd2-5e94-b564-c352fc6874ef          load-balancer-1    new       2017-05-10T19:28:30Z    round_robin    nyc1                            false    type:none,cookie_name:,cookie_ttl_seconds:0    protocol:http,port:80,path:/,check_interval_seconds:10,response_timeout_seconds:5,healthy_threshold:5,unhealthy_threshold:3    entry_protocol:http,entry_port:80,target_protocol:http,target_port:80,certificate_id:,tls_passthrough:false

This displays information, like the load balancer’s ID (which you need in the next step), as well as information on some default configurations unused in this example, such as health check rules and sticky sessions. For details on how to set these options using `doctl`, you can run the `create` command with a `--help` flag, like `doctl compute load-balancer create --help`, which outputs all available command line flags and options.

Now that you created the load balancer, you need to add the target Droplets to it.

## Step 3: Adding Droplets to the Load Balancer[](#step-3-adding-droplets-to-the-load-balancer)

List the information for the two web Droplets again to get their IDs:

    doctl compute droplet list web-*

    ID          Name      Public IPv4        Private IPv4    Public IPv6    Memory    VCPUs    Disk    Region    Image                   Status    Tags
    48603683    web-1    111.111.111.111    111.111.111.333                   512       1        20      nyc1      Ubuntu LAMP on 20.04    active
    48603684    web-2    111.111.111.222     111.111.111.444                   512       1        20      nyc1      Ubuntu LAMP on 20.04    active

Use the `add-droplets` command to add the target Droplets to the load balancer. Use the ID of the load balancer and Droplets you created in previous steps.

    doctl compute load-balancer add-droplets
       ae3fa042-bfd1-4e94-b564-c352fc6874ef \
       --droplet-ids 48463543,48463544

Then, use the `get` command to retrieve the updated info for the load balancer:

    doctl compute load-balancer get ae3fa042-bfd1-4e94-b564-c352fc6874ef

    ID                                      IP                Name               Status    Created At              Algorithm      Region    Tag    Droplet IDs          SSL      Sticky Sessions                                Health Check                                                                                                                   Forwarding Rules
    ae3fa042-bfd1-4e94-b564-c352fc6874ef    111.111.111.555    load-balancer-1    active    2017-05-10T19:28:30Z    round_robin    nyc1             48603683,48603684    false    type:none,cookie_name:,cookie_ttl_seconds:0    protocol:http,port:80,path:/,check_interval_seconds:10,response_timeout_seconds:5,healthy_threshold:5,unhealthy_threshold:3    entry_protocol:http,entry_port:80,target_protocol:http,target_port:80,certificate_id:,tls_passthrough:false

The status is now `active`, it has an IP address assigned, and the target Droplets are listed. Navigate to this new IP address in your browser on the test page, `http://load-balancer-1_ip_address/test.html`, substituting in your load balancer’s IP address.

Your browser loads the message from either **web-1** or **web-2**. Refresh the page to see the other server’s message. The load balancer is in _round robin_ mode, meaning it sends connections to the next Droplet on the list for each request. The alternative is _least connections_ mode, where the load balancer sends new traffic to whichever target has the fewest active connections.

Now that the load balancer is working, you can disable a server to see how it handles the interruption.

## Step 4: Testing Fail Over[](#step-4-testing-fail-over)

One advantage of load balancers is increased tolerance to problems with individual backend web servers. The load balancer runs a health check at predetermined intervals (every 10 seconds by default). The default health check fetches a web page on the target server. If this check fails a few times in a row, the load balancer takes the target out of the rotation and stops sending traffic to it until it recovers.

To test the failover feature, SSH into **web-2** again:

    doctl compute ssh web-2

Shut down the Apache web server:

    systemctl stop apache2

Return to the browser and refresh the load balanced page a few times. At first, you may see some **503 Service Unavailable** errors. By default, the load balancer waits for three health checks to fail before removing a server from the pool. This takes about thirty seconds. After that, you should only see responses from **web-1**.

Start Apache back up on **web-2**:

    systemctl start apache2

After a short time, the load balancer detects that **web-2** is up and adds it back to the pool, at which point you can see **web-2** responses when refreshing the page.

## Summary[](#summary)

In this tutorial, you used `doctl` to create a DigitalOcean Load Balancer and some backend web servers, configured the load balancer to send HTTP traffic to the backend servers, and tested the load balancer’s health check functionality.

## What’s Next?[](#whats-next)

There are more steps you can take to make your load balancer ready for production:

*   Point a [domain name](/products/networking/dns/how-to/add-domains/) at your load balancer so your users don’t have to use an IP address to access your site.
*   Tag your Droplets to keep them organized and to address whole sets of Droplets at once. You can configure your load balancer to send traffic to all Droplets with a certain tag instead of adding Droplets individually. This lets you add new backend servers to the pool dynamically. Learn more in [How To Tag DigitalOcean Droplets](/products/droplets/how-to/tag/).
*   Add HTTPS security to your load balanced website. There are two different ways you can achieve this: [SSL passthrough](/products/networking/load-balancers/how-to/ssl-passthrough/) and [SSL termination](/products/networking/load-balancers/how-to/ssl-termination/).

In this article...

*   [Prerequisites](#prerequisites)
*   [Step 1: Setting Up the Backend Web Servers](#step-1-setting-up-the-backend-web-servers)
*   [Step 2: Creating a Load Balancer](#step-2-creating-a-load-balancer)
*   [Step 3: Adding Droplets to the Load Balancer](#step-3-adding-droplets-to-the-load-balancer)
*   [Step 4: Testing Fail Over](#step-4-testing-fail-over)
*   [Summary](#summary)
*   [What’s Next?](#whats-next)

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

Try using different keywords or sim
