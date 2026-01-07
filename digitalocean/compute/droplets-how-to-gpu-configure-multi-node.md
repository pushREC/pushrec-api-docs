---
source: https://docs.digitalocean.com/products/droplets/how-to/gpu/configure-multi-node/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Configure Multi-Node GPU Droplets | DigitalOcean Documentation

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
        *   [Create GPU Droplets](/products/droplets/how-to/gpu/create/)
        *   [Use the Scratch Disk](/products/droplets/how-to/gpu/use-scratch-disk/)
        *   [Enable GPU Metrics](/products/droplets/how-to/gpu/enable-metrics/)
        *   [Enable Jumbo Frames](/products/droplets/how-to/gpu/enable-jumbo-frames/)
        *   [Use Container Tools](https://www.digitalocean.com/community/tutorials/how-to-use-nvidia-container-tools-with-gpu-droplets)
        *   [Configure Multi-Node Setups](/products/droplets/how-to/gpu/configure-multi-node/)
    *   [Provide User Data](/products/droplets/how-to/provide-user-data/)
    *   [Connect with SSH](/products/droplets/how-to/connect-with-ssh/)
    *   [Add SSH Keys to Droplets](/products/droplets/how-to/add-ssh-keys/)
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
*   [Use GPU Droplets](/products/droplets/how-to/gpu/) 
*   Configure Multi-Node Setups

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Configure Multi-Node GPU Droplets

Generated on 6 Jan 2026

DigitalOcean Droplets are Linux-based virtual machines (VMs) that run on top of virtualized hardware. Each Droplet you create is a new server you can use, either standalone or as part of a larger, cloud-based infrastructure.

To create multi-node GPU deployments, you must first [contact support](https://cloudsupport.digitalocean.com/s/). Multi-node GPU deployments can only be created in multiples of 8 GPUs, and support needs to enable the specific Droplet plan slug for you to use when you create your GPU Droplets.

After creation, the configuration of the network that connects the GPUs using a [NCCL](https://docs.nvidia.com/deeplearning/nccl/user-guide/docs/overview.html) or [RCCL](https://rocm.docs.amd.com/projects/rccl/en/develop/) topology is not yet fully automated, so you then need to take some additional steps to assign IP addresses to the GPU network cards.

## Configure the GPU Network Interface Controllers[](#configure-the-gpu-network-interface-controllers)

The GPU’s eight network interface controllers (NICs) are `eth2` to `eth9`.

Warning

The `eth0` interface is for public connectivity to the internet and `eth1` is for private connectivity to other Droplets in the same VPC network. Multi-node applications must use the `eth2` to `eth9` network interfaces, which are for GPU-to-GPU communication.

Each NIC must have its own subnet that is disjoint from the others. For example, `eth2` could use `192.68.50.0/24`, `eth3` could use `192.68.51.0/24`, and so on.

Each Droplet additionally needs a unique IP address on each subnet. We recommend using the same final octet in each subnet for a given Droplet. For example, one Droplet would have the addresses `192.68.50.2`, `192.68.51.2`, and so on. An additional Droplet would have `192.68.50.3`, `192.68.51.3`, and so on.

We haven’t finished automating addressing the NICs, so until then, you can address the NICs in one of two ways:

*   With [user data](/products/droplets/how-to/provide-user-data/), which is useful if you intend to use a base image that doesn’t support Netplan, but requires a specific naming convention for your Droplets.
    
*   Manually with Netplan, which is useful if the Droplet naming convention for the user data script is not suitable for your needs.
    
*   Using [Ansible](https://www.ansible.com/), which is useful if you want to apply changes to an existing set of GPU Droplets.
    

 With User Data

To use our user data script, you must adopt a specific naming convention for your Droplets:

*   The name must end with a hyphen, `-`, followed by an integer between 1 to 254. For example, `examplename-1`.
*   The name must have no other hyphens.

Then, use the following `cloud-config` file when you create the Droplet:

    #cloud-config
    write_files:
    - path: /usr/sbin/gpu-fabric.sh
      content: |
        #!/bin/bash
        IFACES=$(ip -br addr | grep eth | grep -E 'eth2|eth3|eth4|eth5|eth6|eth7|eth8|eth9' | awk '{print $1}')
        subnet=50
        octet=$(hostname | cut -d '-' -f 2)
        for i in ${IFACES}; do
            /usr/sbin/ip link set dev ${i} up
            /usr/sbin/ip link set dev ${i} mtu 4200
            ADDR="192.168.${subnet}.${octet}/24"
            /usr/sbin/ip addr add dev ${i} ${ADDR}
            subnet=$((subnet + 1))
        done
        /usr/sbin/ip -br addr
      permissions: '0755'
    bootcmd:
    - /usr/sbin/gpu-fabric.sh
    runcmd:
    - /usr/sbin/gpu-fabric.sh

You can pass this script when creating a GPU Droplet with `doctl` by using the `-user-data-file` flag.

 Manually with Netplan

You can use Netplan to configure the NICs. The AI/ML-ready image we provide for GPU Droplets includes Netplan support.

On each Droplet, open `/etc/netplan/50-cloud-init.yaml` and add the following block after `eth1`:

    eth2:
      dhcp4: false
      dhcp6: false
      link-local: []          
      addresses:
        - 192.168.50.2/24
      mtu: 4200
    eth3:
      dhcp4: false
      dhcp6: false
      link-local: []
      addresses:
        - 192.168.51.2/24
      mtu: 4200
    eth4:
      dhcp4: false
      dhcp6: false
      link-local: []
      addresses:
        - 192.168.52.2/24
      mtu: 4200
    eth5:
      dhcp4: false
      dhcp6: false
      link-local: []
      addresses:
        - 192.168.53.2/24
      mtu: 4200
    eth6:
      dhcp4: false
      dhcp6: false
      link-local: []
      addresses:
        - 192.168.54.2/24
      mtu: 4200
    eth7:
      dhcp4: false
      dhcp6: false
      link-local: []
      addresses:
        - 192.168.55.2/24
      mtu: 4200 
    eth8:
      dhcp4: false
      dhcp6: false
      link-local: []
      addresses:
        - 192.168.56.2/24
      mtu: 4200
    eth9:
      dhcp4: false
      dhcp6: false
      link-local: []
      addresses:
        - 192.168.57.2/24
      mtu: 4200

You can optionally also edit the `eth1` MTU to 9002.

Save the file and apply the changes:

    sudo netplan apply

Repeat this process on every other Droplet, replacing the fourth octet each time. For example, change `192.168.50.2` to `192.168.50.3` on the next Droplet, then to `192.168.50.4` on the next, and so on.

 With Ansible

You can use our `gpu-fabric` Ansible playbook to configure multi-node GPU Droplets:

[](https://github.com/digitalocean/gpu-fabric)

![](https://docs.digitalocean.com/images/icons/default.svg)

DigitalOcean's gpu-fabric GitHub Repository

A simple Ansible playbook to configure multi-node GPU Droplets.

github.com

The README of the repository has installation and usage instructions which are replicated here:

> This content is automatically generated from [https://github.com/digitalocean/gpu-fabric/blob/main/README.md](https://github.com/digitalocean/gpu-fabric/blob/main/README.md).

This repository contains a simple Ansible playbook to configure multi-node GPU Droplets.

To use this playbook:

1.  On the machine that you will use to run this playbook, first [install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html) and then [clone this repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository).
    
2.  In the `inventory/droplets` file in your cloned version of this repository, in the `[multinode_gpu_droplets]` section, specify the public IP addresses of your GPU Droplets.
    
3.  Ansible uses SSH under the hood to configure Droplets. If you have never connected to your Droplets with SSH and the `.ssh/config` file on your machine does not include `StrictHostKeyChecking no`, add the following line to the `inventory/droplets` file:
    

    ansible_ssh_common_args='-o StrictHostKeyChecking=no'

4.  Save the file, then run the playbook from the root of the repository:

    ansible-playbook -i inventory/droplets customer-play.yaml

The output of a successful run looks similar to the following:

    PLAY [multinode_gpu_droplets] ***********************************************************************************
    
    TASK [Gathering Facts] ******************************************************************************************
    ok: [10.10.10.10]
    
    TASK [read /etc/netplan/50-cloud-init.yaml] *********************************************************************
    ok: [10.10.10.10]
    
    TASK [extract /etc/netplan/50-cloud-init.yaml] ******************************************************************
    ok: [10.10.10.10]
    
    TASK [set a unique index for each droplet] **********************************************************************
    ok: [10.10.10.10] => (item=10.10.10.10)
    
    TASK [adjust /etc/netplan/50-cloud-init.yaml] *******************************************************************
    ok: [10.10.10.10]
    
    TASK [write /etc/netplan/50-cloud-init.yaml] ********************************************************************
    ok: [10.10.10.10]
    
    TASK [install lldp] *********************************************************************************************
    ok: [10.10.10.10]
    
    PLAY RECAP ******************************************************************************************************
    10.10.10.10             : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

## Verify Connectivity[](#verify-connectivity)

You can check the IP addresses assigned to the fabric NICs:

    ip -br a

This lists the network interfaces and their IP addresses:

    lo               UNKNOWN        127.0.0.1/8 ::1/128 
    eth0             UP             162.243.220.179/24 10.13.0.5/16 fe80::4006:aff:fe4d:d7cb/64 
    eth1             UP             10.128.0.2/16 
    eth2             UP             192.168.50.1/24 
    eth3             UP             192.168.51.1/24 
    eth4             UP             192.168.52.1/24 
    eth5             UP             192.168.53.1/24 
    eth6             UP             192.168.54.1/24
    eth7             UP             192.168.55.1/24 
    eth8             UP             192.168.56.1/24 
    eth9             UP             192.168.57.1/24

Make sure these match the addresses you assigned.

## Configure NCCL or RCCL[](#configure-nccl-or-rccl)

For the best performance with multi-node training using NCCL (NVIDIA GPUs) or RCCL (AMD GPUs), you must provide additional GPU-specific configuration on all Droplets in your multi-node deployment.

### NVIDIA H100[](#nvidia-h100)

For H100 GPUs you must download a NCCL topology file, then configure it in `nccl.conf`.

First, download the [topology file](https://docs.digitalocean.com/products/droplets/how-to/gpu/configure-multi-node/topo.xml) and save it as `/etc/nccl/topo.xml`.

Then, edit `/etc/nccl.conf` to include the following lines:

/etc/nccl.conf

    NCCL_TOPO_FILE=/etc/nccl/topo.xml
    NCCL_SOCKET_IFNAME==eth1
    NCCL_CROSS_NIC=0
    NCCL_NET_DISABLE_INTRA=1
    NCCL_IB_TC=104

### NVIDIA H200[](#nvidia-h200)

For H200 GPUs, edit `/etc/nccl.conf` to include the following lines:

/etc/nccl.conf

    NCCL_SOCKET_IFNAME==eth1
    NCCL_CROSS_NIC=0
    NCCL_NET_DISABLE_INTRA=1
    NCCL_IB_TC=104

### AMD MI300X and MI325X[](#amd-mi300x-and-mi325x)

For AMD MI300X and MI325X GPUs, edit `/etc/rccl.conf` to include the following lines:

/etc/rccl.conf

    NCCL_SOCKET_IFNAME==eth1
    NCCL_CROSS_NIC=0
    NCCL_PXN_DISABLE=0
    NCCL_NET_DISABLE_INTRA=1
    NCCL_IB_GID_INDEX=3
    NCCL_DMABUF_ENABLE=1
    NCCL_IB_TC=104

In this article...

*   [Configure the GPU Network Interface Controllers](#configure-the-gpu-network-interface-controllers)
*   [Verify Connectivity](#verify-connectivity)
*   [Configure NCCL or RCCL](#configure-nccl-or-rccl)
    *   [NVIDIA H100](#nvidia-h100)
    *   [NVIDIA H200](#nvidia-h200)
    *   [AMD MI300X and MI325X](#amd-mi300x-and-mi325x)

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

Try using different keywords or simplifying your search
