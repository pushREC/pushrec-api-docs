---
source: https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/to-existing-droplet/
scraped: 2026-01-07
tags: [digitalocean, compute, droplets, api-docs]
---

How to Upload an SSH Public Key to an Existing Droplet | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/droplets.f4877fc574e6b07f8fb9608e252be4160ebecd65569acea11775a046b9370c6f.svg)Droplets](/products/droplets/)
*   [Getting Started](/products/droplets/getting-started/)
    *   [Quickstart](/products/droplets/getting-started/quickstart/)
    *   [Recommended Droplet Setup](/products/droplets/getting-started/recommended-droplet-setup/)
    *   [Recommended GPU Setup](/products/droplets/getting-started/recommended-gpu-setup/)
*   [How-Tos](/products/droplets/how-to/)
    *   [Create Droplets](/products/droplets/how-to/create/)
    *   [Use GPU Droplets](/products/droplets/how-to/gpu/)
    *   [Provide User Data](/products/droplets/how-to/provide-user-data/)
    *   [Connect with SSH](/products/droplets/how-to/connect-with-ssh/)
    *   [Add SSH Keys to Droplets](/products/droplets/how-to/add-ssh-keys/)
        *   [Create Keys with OpenSSH](/products/droplets/how-to/add-ssh-keys/create-with-openssh/)
        *   [Create Keys with PuTTY](/products/droplets/how-to/add-ssh-keys/create-with-putty/)
        *   [Manage SSH Keys on Teams](/platform/teams/how-to/upload-ssh-keys/)
        *   [Add Keys to Existing Droplets](/products/droplets/how-to/add-ssh-keys/to-existing-droplet/)
    *   [Connect with the Droplet Console](/products/droplets/how-to/connect-with-console/)
    *   [Transfer Files with FileZilla](/products/droplets/how-to/transfer-files/)
    *   [Tag Droplets](/products/droplets/how-to/tag/)
    *   [Track Performance](/products/droplets/how-to/track-performance/)
    *   [Resize Droplets](/products/droplets/how-to/resize/)
    *   [Use Autoscale Pools](/products/droplets/how-to/use-autoscale-pools/)
    *   [Access Metadata](/products/droplets/how-to/access-metadata/)
    *   [Rebuild Droplets](/products/droplets/how-to/rebuild/)
    *   [Manage the Droplet Agent](/products/droplets/how-to/manage-agent/)
    *   [Manage the Kernel](/products/droplets/how-to/kernel/)
    *   [Recover Access or Data](/products/droplets/how-to/recovery/)
    *   [Destroy Droplets](/products/droplets/how-to/destroy/)
*   [Reference](/products/droplets/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Droplets)
    *   [CLI Reference](/reference/doctl/reference/compute/droplet/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/droplets/concepts/)
    *   [Choosing a Plan](/products/droplets/concepts/choosing-a-plan/)
    *   [Tips on Downsizing Droplets](/products/droplets/concepts/downsizing-considerations/)
    *   [Autoscale Pools](/products/droplets/concepts/autoscale-pools/)
    *   [Glossary](/glossary/droplets/)
*   [Details](/products/droplets/details/)
    *   [Features](/products/droplets/details/features/)
    *   [Pricing](/products/droplets/details/pricing/)
    *   [Availability](/products/droplets/details/availability/)
    *   [Images](/products/droplets/details/images/)
    *   [Limits](/products/droplets/details/limits/)
    *   [Image Deprecation Policy](/products/droplets/details/image-deprecation/)
    *   [Droplet Policies](/products/droplets/details/policies/)
    *   [Live Migrations](/products/droplets/details/live-migration/)
    *   [CPU Droplet SLA](https://www.digitalocean.com/sla/cpu-droplets)
    *   [GPU Droplet SLA](https://www.digitalocean.com/sla/gpu-droplets)
    *   [GPU Droplets](/products/gpu-droplets/)
*   [Support](/products/droplets/support/)

*   [How-Tos](/products/droplets/how-to/) 
*   [Add SSH Keys to Droplets](/products/droplets/how-to/add-ssh-keys/) 
*   Add Keys to Existing Droplets

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Upload an SSH Public Key to an Existing Droplet

Validated on 28 Aug 2023 • Last edited on 19 Jun 2025

DigitalOcean Droplets are Linux-based virtual machines (VMs) that run on top of virtualized hardware. Each Droplet you create is a new server you can use, either standalone or as part of a larger, cloud-based infrastructure.

Note

If you’re struggling with SSH and server management, try our managed products: [Cloudways](/products/cloudways/) deploys pre-installed software stacks onto Droplets, and [App Platform](/products/app-platform/) deploys and scales apps directly from your code repository, along with databases and serverless functions.

For security reasons, you can’t add or modify the SSH keys on your Droplet using the control panel after you create it, but you have several options to add and modify them via the command line. If you currently have SSH access to the Droplet, you can upload keys in multiple ways:

*   [**From your local computer using `ssh-copy-id`**](#with-ssh-copy-id), which is included in many Linux distributions’ OpenSSH packages. We recommend this option if it is available for ease of use.
    
*   [**From your local computer by piping the key**](#with-ssh) into the `~/.ssh/authorized_keys` file on the Droplet. This is a good choice if you don’t have `ssh-copy-id`.
    
*   [**By connecting to your Droplet with SSH and manually adding the public key**](#manually), which is necessary if you do not have password-based SSH access.
    

If you currently can’t connect to your Droplet at all, [use the Recovery Console to reset the root user password](/products/droplets/how-to/recovery/recovery-console/). Once logged in on the console, you can either [add your key manually from the console](#manually) or [temporarily enable password authentication](/support/i-lost-the-ssh-key-for-my-droplet/#enable-password-authentication) to add the key [via SSH](#with-ssh-copy-id).

## Locally Using ssh-copy-id and Password-Based Access[](#with-ssh-copy-id)

If you have password-based access to your Droplet, you can copy your SSH key from your local computer to your Droplet using `ssh-copy-id`.

On your local computer, run `ssh-copy-id`, substituting your username and your Droplet’s IP address:

    ssh-copy-id [email protected]

By default, `ssh-copy-id` copies the default key, `~/.ssh/id_ed25519.pub`, to the target server. To specify a different key, use the `-i` flag, as in `ssh-copy-id -i ~/path/to/key.pub [[email protected]](/cdn-cgi/l/email-protection)`.

Running `ssh-copy-id` prompts you for the user’s password on the Droplet:

    The authenticity of host '203.0.113.0 (203.0.113.0)' can't be established.
    ECDSA key fingerprint is fd:fd:d4:f9:EX:AM:PL:E0:e1:55:00:ad:d6:6d:22:fe.
    Are you sure you want to continue connecting (yes/no)? yes
    /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
    /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
    [email protected]'s password:

After you enter the password, it confirms the addition of the key:

    Number of key(s) added: 1
    
    Now try logging in to the machine, with:   "ssh '[email protected]'"
    and check to make sure that only the key(s) you wanted were added.

You can now log in without a password.

## Locally by Piping into ssh with Password-Based Access[](#with-ssh)

If you do not have `ssh-copy-id` on your local computer but you do have password-based SSH access to your Droplet, you can add an SSH key to your Droplet by [piping](https://www.digitalocean.com/community/tutorials/an-introduction-to-linux-i-o-redirection#pipes) the contents of the key into the `ssh` command.

The following command makes sure the `~/.ssh` directory exists on your Droplet, then pipes the content of the `~/.ssh/id_ed25519.pub` file on your local computer to the `~/.ssh/authorized_keys` file on your Droplet.

Run this command on your local computer, substituting your username and the Droplet’s IP address:

    cat ~/.ssh/id_ed25519.pub | ssh [email protected] "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"

Running this command prompts you for the user’s password on the Droplet:

    The authenticity of host '203.0.113.0 (203.0.113.0)' can't be established.
    ECDSA key fingerprint is fd:fd:d4:f9:EX:AM:PL:E0:e1:55:00:ad:d6:6d:22:fe.
    Are you sure you want to continue connecting (yes/no)? yes
    [email protected]'s password:

After you enter the password, it copies your key, and you can log in without a password.

## Manually from the Droplet[](#manually)

If you do not have password-based SSH access available, you must add your public key to the remote server manually.

On your local machine, output the contents of your public key.

    cat ~/.ssh/id_ed25519.pub

Copy the output, which looks similar to this example:

    ssh-ed25519 EXAMPLEzaC1lZDI1NTE5AAAAIGKy65/WWrFKeWdpJKJAuLqev9bb9ZNofcMrR/OnC9BM [email protected]

Next, [connect to your Droplet with SSH](/products/droplets/how-to/connect-with-ssh/).

Note

If you can’t connect to your Droplet, you can [use the Recovery Console to recover access](/products/droplets/how-to/recovery/recovery-console/) by resetting your Droplet’s root password, and then [use `ssh` to add your keys](#with-ssh).

On your Droplet, create the `~/.ssh` directory if it does not already exist:

    mkdir -p ~/.ssh

The public keys listed in `~/.ssh/authorized_keys` are the ones that you can use to log in to the server as this user, so you need to add the public key you copied into this file.

To do so, run the following command on your Droplet, replacing the example key in quotes (`ssh-ed25519 EXAMPLEzaC1yc2E...GvaQ== [[email protected]](/cdn-cgi/l/email-protection)`) with the key you copied:

    echo "ssh-ed25519 EXAMPLEzaC1yc2E...GvaQ== [email protected]" >> ~/.ssh/authorized_keys

Alternatively, you can open the `~/.ssh/authorized_keys` file with [a terminal-based text editor, like `nano`](https://www.digitalocean.com/community/tutorials/basic-linux-navigation-and-file-management#editing-files), and paste the contents of the key into the file that way.

The `~/.ssh` directory and `authorized_keys` file must have specific restricted [permissions](https://www.digitalocean.com/community/tutorials/an-introduction-to-linux-permissions) (`700` for `~/.ssh` and `600` for `authorized_keys`). If they don’t, you cannot log in.

Once the `authorized_keys` file contains the public key, set the permissions and ownership of the files:

    chmod -R go= ~/.ssh
    chown -R $USER:$USER ~/.ssh

You can now log out of your Droplet. The next time you log in, you can do so without a password.

In this article...

*   [Locally Using ssh-copy-id and Password-Based Access](#with-ssh-copy-id)
*   [Locally by Piping into ssh with Password-Based Access](#with-ssh)
*   [Manually from the Droplet](#manually)

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

Try using different keywor
