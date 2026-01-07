---
source: https://docs.digitalocean.com/products/app-platform/how-to/manage-domains/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Manage Domains in App Platform

Validated on 30 Apr 2021 • Last edited on 8 Jul 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

App Platform provides a starter domain for apps on `ondigitalocean.app` upon successful deployment. You can also add a custom domain in your app’s settings to map a domain you own to your app. For example, you can add the domain `example.com` to your app and then update your domain’s DNS configuration to direct traffic to your app.

You can also edit the app spec to [redirect starter domain traffic to an app’s custom domain](#use-subdomain-routing).

App Platform offers two public ingress IPs that you can point DNS records at to direct traffic to your app, free of charge. For more details, see [How to Add Static IP Addresses to App Platform Components](/products/app-platform/how-to/add-ip-address/#use-public-static-ingress-ips).

App Platform does not support adding DNSSEC enabled domains to apps.

## Add a Domain to an App Using Automation[](#add-a-domain-to-an-app-using-automation)

You can add a domain to an app using the CLI’s app update command or the API’s app update endpoint. To add a domain, update the [app’s spec](/products/app-platform/reference/app-spec/) with the domain’s specifications and submit the spec using the following command or endpoint. The app spec must completely define all of your app’s configurations. We recommend [downloading your current app spec](/products/app-platform/how-to/update-app-spec/) from the control panel, API, or CLI, and modifying it to include the domain.

How to Add a Domain to an App Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl apps update`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/apps/update/) for more details:
    
        doctl apps update <app id> [flags]
    
    The following example updates an app with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6` using an app spec located in a directory called `/src/your-app.yaml`. Additionally, the command returns the updated app’s ID, ingress information, and creation date:
    
        doctl apps update f81d4fae-7dec-11d0-a765-00a0c91e6bf6 --spec src/your-app.yaml --format ID,DefaultIngress,Created
    

How to Add a Domain to an App Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/apps/{id}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/apps_update).

### cURL[](#add-a-domain-to-an-app-curl)

Using cURL:

    curl -X PUT \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
    "https://api.digitalocean.com/v2/apps/{id}" \
    -d '{"alerts":[{"rule":"DEPLOYMENT_FAILED"},{"rule":"DOMAIN_FAILED"}],"domains":[{"domain":"example.com","type":"PRIMARY","zone":"example.com"}],"envs":[{"key":"API_KEY","scope":"RUN_AND_BUILD_TIME","type":"SECRET","value":"EV[1:zqiRIeaaYK/NqctZDYzy6t0pTrtRDez8:wqGpZRrsKN5nPhWQrS479cfBiXT0WQ==]"}],"features":["buildpack-stack=ubuntu-22"],"ingress":{},"name":"example-app","region":"nyc","services":[{"autoscaling":{"max_instance_count":4,"metrics":{"cpu":{"percent":70}},"min_instance_count":2},"git":{"branch":"main","repo_clone_url":"https://github.com/digitalocean/sample-nodejs.git"},"internal_ports":[8080],"log_destinations":[{"name":"your_log_consumer_name","open_search":{"endpoint":"logs.example.com:12345","basic_auth":{"user":"doadmin","password":"1234567890abcdef"},"index_name":"example-index","cluster_name":"example-cluster"}}],"name":"sample-nodejs","run_command":"yarn start","source_dir":"/"}]}'

### Python[](#add-a-domain-to-an-app-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    req = {
    "spec": {
        "name": "web-app-01",
        "region": "nyc",
        "domains": [
            {
                "domain": "app.example.com",
                "type": "DEFAULT",
                "wildcard": True,
                "zone": "example.com",
                "minimum_tls_version": "1.3",
            }
        ],
        "services": [],
        "static_sites": [
            {
                "cors": {
                    "allow_origins": [
                        {"exact": "https://www.example.com"},
                        {"regex": "^.*example.com"},
                    ],
                    "allow_methods": [
                        "GET",
                        "OPTIONS",
                        "POST",
                        "PUT",
                        "PATCH",
                        "DELETE",
                    ],
                    "allow_headers": ["Content-Type", "X-Custom-Header"],
                    "expose_headers": ["Content-Encoding", "X-Custom-Header"],
                    "max_age": "5h30m",
                    "allow_credentials": False,
                },
                "routes": [{"path": "/api", "preserve_path_prefix": True}],
            }
        ],
        "jobs": [
            {
                "name": "api",
                "gitlab": {
                    "branch": "main",
                    "deploy_on_push": True,
                    "repo": "digitalocean/sample-golang",
                },
                "image": {
                    "registry": "registry.hub.docker.com",
                    "registry_type": "DOCR",
                    "repository": "origin/master",
                    "tag": "latest",
                },
                "dockerfile_path": "path/to/Dockerfile",
                "build_command": "npm run build",
                "run_command": "bin/api",
                "source_dir": "path/to/dir",
                "envs": [
                    {
                        "key": "BASE_URL",
                        "scope": "BUILD_TIME",
                        "type": "GENERAL",
                        "value": "http://example.com",
                    }
                ],
                "environment_slug": "node-js",
                "log_destinations": {
                    "name": "my_log_destination",
                    "papertrail": {
                        "endpoint": "https://mypapertrailendpoint.com"
                    },
                    "datadog": {
                        "endpoint": "https://mydatadogendpoint.com",
                        "api_key": "abcdefghijklmnopqrstuvwxyz0123456789",
                    },
                    "logtail": {
                        "token": "abcdefghijklmnopqrstuvwxyz0123456789"
                    },
                   "open_search": {
                        "endpoint": "https://myopensearchendpoint.com:9300"
                        "index_name": "logs"
                        "basic_auth": {
                            "user": "doadmin",
                            "password": "password"
                        }
                    },
                },
                "instance_count": 2,
                "instance_size_slug": "apps-s-1vcpu-0.5gb",
                "kind": "PRE_DEPLOY",
            }
        ],
        "workers": [
            {
                "name": "api",
                "gitlab": {
                    "branch": "main",
                    "deploy_on_push": True,
                    "repo": "digitalocean/sample-golang",
                },
                "image": {
                    "registry": "registry.hub.docker.com",
                    "registry_type": "DOCR",
                    "repository": "origin/master",
                    "tag": "latest",
                },
                "dockerfile_path": "path/to/Dockerfile",
                "build_command": "npm run build",
                "run_command": "bin/api",
                "source_dir": "path/to/dir",
                "envs": [
                    {
                        "key": "BASE_URL",
                        "scope": "BUILD_TIME",
                        "type": "GENERAL",
                        "value": "http://example.com",
                    }
                ],
                "environment_slug": "node-js",
                "log_destinations": {
                    "name": "my_log_destination",
                    "papertrail": {
                        "endpoint": "https://mypapertrailendpoint.com"
                    },
                    "datadog": {
                        "endpoint": "https://mydatadogendpoint.com",
                        "api_key": "abcdefghijklmnopqrstuvwxyz0123456789",
                    },
                    "logtail": {
                        "token": "abcdefghijklmnopqrstuvwxyz0123456789"
                    },
                   "open_search": {
                        "endpoint": "https://myopensearchendpoint.com:9300"
                        "index_name": "logs"
                        "basic_auth": {
                            "user": "doadmin",
                            "password": "password"
                        }
                    },
                },
                "instance_count": 2,
                "instance_size_slug": "apps-s-1vcpu-0.5gb",
            }
        ],
        "functions": [
            {
                "cors": {
                    "allow_origins": [
                        {"exact": "https://www.example.com"},
                        {"regex": "^.*example.com"},
                    ],
                    "allow_methods": [
                        "GET",
                        "OPTIONS",
                        "POST",
                        "PUT",
                        "PATCH",
                        "DELETE",
                    ],
                    "allow_headers": ["Content-Type", "X-Custom-Header"],
                    "expose_headers": ["Content-Encoding", "X-Custom-Header"],
                    "max_age": "5h30m",
                    "allow_credentials": False,
                },
                "routes": [{"path": "/api", "preserve_path_prefix": True}],
                "name": "api",
                "source_dir": "path/to/dir",
                "alerts": [
                    {
                        "rule": "CPU_UTILIZATION",
                        "disabled": False,
                        "operator": "GREATER_THAN",
                        "value": 2.32,
                        "window": "FIVE_MINUTES",
                    }
                ],
                "envs": [
                    {
                        "key": "BASE_URL",
                        "scope": "BUILD_TIME",
                        "type": "GENERAL",
                        "value": "http://example.com",
                    }
                ],
                "gitlab": {
                    "branch": "main",
                    "deploy_on_push": True,
                    "repo": "digitalocean/sample-golang",
                },
                "log_destinations": {
                    "name": "my_log_destination",
                    "papertrail": {
                        "endpoint": "https://mypapertrailendpoint.com"
                    },
                    "datadog": {
                        "endpoint": "https://mydatadogendpoint.com",
                        "api_key": "abcdefghijklmnopqrstuvwxyz0123456789",
                    },
                    "logtail": {
                        "token": "abcdefghijklmnopqrstuvwxyz0123456789"
                    },
                   "open_search": {
                        "endpoint": "https://myopensearchendpoint.com:9300"
                        "index_name": "logs"
                        "basic_auth": {
                            "user": "doadmin",
                            "password": "password"
                        }
                    },
                },
            }
        ],
        "databases": [
            {
                "cluster_name": "cluster_name",
                "db_name": "my_db",
                "db_user": "superuser",
                "engine": "PG",
                "name": "prod-db",
                "production": True,
                "version": "12",
            }
        ],
        “vpc”: {
            “id”: “c22d8f48-4bc4-49f5-8ca0-58e7164427ac”,
        }
    }
    update_resp = client.apps.update(id="bb245ba", body=req)

## Add a Custom Domain Using the Control Panel[](#custom-domain)

Go to [https://cloud.digitalocean.com/apps](https://cloud.digitalocean.com/apps), click your app, and click the **Settings** tab. Then, click the **Edit** link to the right of **Domains**, and the **Add Domain** button.

On the **Add Domain** form, enter your custom domain name at the top of the form in the text area under **Domain or Subdomain Name**, then click to proceed.

You are given a choice to delegate your DNS management to DigitalOcean or to point to your app by adding a CNAME record to your domain configuration.

## Option 1: Using DigitalOcean’s Name Servers[](#option-1-using-digitaloceans-name-servers)

![Domain add screen with Delegate to DigitalOcean selected](https://docs.digitalocean.com/screenshots/app-platform/add-domain.4c32f319cbf9f9d312116155bf7e2c7e6152f6e5b86edc4e5f012ad5d6dd95d5.png)

If you decide to use DigitalOcean’s name servers, copy and paste DigitalOcean’s name servers (`ns1.digitalocean.com`, `ns2.digitalocean.com`, `ns3.digitalocean.com`) to your domain’s registrar name server records. See our [Community tutorial](https://www.digitalocean.com/community/tutorials/how-to-point-to-digitalocean-nameservers-from-common-domain-registrars) on how to delegate your domain to DigitalOcean’s name servers from popular registrars.

DNS changes can take up to 72 hours to propagate across the internet. You can check the progress of the transfer in App Platform’s dashboard.

## Option 2: Using a CNAME Pointer[](#option-2)

![Domain add screen with Point to DigitalOcean selected](https://docs.digitalocean.com/screenshots/app-platform/add-domain-cname.3199395d628e21a4db9cd860a62622b0aeb1bfbcd550814c6892b12acb5a9fdd.png)

You can also [add a CNAME record](/products/networking/dns/how-to/manage-records/) to your domain. If your DNS provider is not DigitalOcean, reference your DNS provider’s documentation to see how to do this.

Use the “copy” button to copy the `ondigitalocean.app` alias, and paste it into the CNAME record on your DNS provider so that it points your custom domain to your App Platform app. When this is complete on your DNS provider, click the **Add Domain** button.

You can also add apex wildcard domains. App Platform validates the wildcard domain and issues certificates using TXT records.

![TXT validation instructions](https://docs.digitalocean.com/screenshots/app-platform/app-cname-txt-validation-required.1cf8d6a778675ffc559ebbb8ae2fd178982889cdb0670311269f9c246915a9b1.png)

To validate, click **Instructions** and copy the **TXT Name** and **TXT Value**.

![TXT validation instructions](https://docs.digitalocean.com/screenshots/app-platform/app-cname-txt-validation-instructions.8de9ded87bb16c78a0214e1b42f713980f4b6554eed4a9060cc89f80e382e1e9.png)

Add the values to your DNS provider to validate the wildcard domain.

You will receive a control panel and an email notification 30 days prior to the token expiration. To re-validate the domain, copy the new **TXT Name** and **TXT Value** and add them to your DNS provider.

DNS changes can take up to 72 hours to propagate across the internet. You can check the progress of the transfer in App Platform’s dashboard.

## Change Domain Management Option[](#change-domain-management-option)

You can change your app’s domain management option by [updating the app’s spec](/products/app-platform/how-to/update-app-spec/).

If you originally set up your domain with a CNAME pointer and want to DigitalOcean to manage your app’s domain instead, add the `zone` field to the spec and use your domain’s name as the value. For example, the following spec adds the domain `example.com` to the app.

`example-app-spec.yaml`

    alerts:
      - rule: DEPLOYMENT_FAILED
    domains:
      - domain: example-app.com
        type: PRIMARY
        zone: example.com
    features:
      - enable-kata-build
    name: example-app-name
    region: nyc
    ...

This means that DigitalOcean will manage the domain’s name servers and DNS records going forward.

If DigitalOcean is already managing your app’s domain and you want to self-manage it instead, remove the `zone` field, and follow the [instructions to add a CNAME record to your domain](#option-2).

## Use Subdomain Routing[](#use-subdomain-routing)

You can use subdomain routing and edit an app’s default subdomain by [updating the app’s spec](/products/app-platform/how-to/update-app-spec/).

A component can use multiple domains and support multi-tenancy with optional prefix-based routing. To add multiple subdomains, create a separate component block for each one. You can’t use wildcard domains in the subdomain routing block. For example, see the following app spec.

`example-app-spec.yaml`

    # Custom domain is *.example.com
    domains:
    - domain: example.com
      type: PRIMARY
      wildcard: true
      zone: example.com
    ingress:
      rules:
      # Traffic to https://api.example.com/v1 goes to the legacy API component
      - component:
          name: api-legacy
        match:
          authority:
            exact: api.example.com
          path:
            prefix: /v1
      # Traffic to https://api.example.com/v2 goes to the new API component
      - component:
          name: api
        match:
          authority:
            exact: api.example.com
          path:
            prefix: /v2
      # All other traffic goes to the frontend component
      - component:
          name: frontend
        match:
          path:
            prefix: /
      # Traffic to starter domain is redirected to app's custom domain
      - redirect:
          authority: example.com
        match:
          authority:
            # The static placeholder ${STARTER_DOMAIN} matches on the app's starter domain
            exact: ${STARTER_DOMAIN}

## Create a Wildcard Record for Domain[](#create-a-wildcard-record-for-domain)

Wildcard DNS records direct requests for non-existent subdomains to a specified resource or IP address. For example, a wildcard record for `*.example.com` would mean that a DNS query for a non-existent domain like `support.example.com` would redirect to the domain’s homepage.

Warning

App Platform does not support wildcard DNS records for any of the top-level domains (TLDs) listed on this [DigiCert reference page](https://knowledge.digicert.com/solution/Embargoed-Countries-and-Regions.html#:~:text=List%20of%20restricted%20Russia%20and%20Belarus%20TLDs%3A).

In App Platform, you can add a wildcard record to your app’s domain to redirect queries for non-existent subdomains to the domain’s root.

Before you can add a wildcard domain, you must add the root domain to your app first.

To add a wildcard record to your app, go to your app’s **Overview** page and then select the **Settings** tab. In the **Domains** section, click **Edit** and then click **Add Domain**.

In the **Domain or Subdomain Name** field, enter an asterisk followed by a dot and then your domain. For example, `*.example.com`. The asterisk denotes that this is a wildcard record. Once you’ve entered the wildcard domain, click **Add Domain**.

![Wildcard domain entered into field](https://docs.digitalocean.com/screenshots/app-platform/app-wildcard-domain.37fdcd9d876b1e5c120673f74664690cda417b1d289dac0dbb127e5949f1d23b.png)

DNS queries for non-existent subdomains now redirect to the root domain of your app.

## View DNS Provider Instructions[](#view-dns-provider-instructions)

Go to [https://cloud.digitalocean.com/apps](https://cloud.digitalocean.com/apps), click your app, and click the **Settings** tab. Then click the **Edit** link to the right of **Domains**.

Click the triple-dot (**…**) menu item next to the custom domain name, and click **View Instructions** to view the instructions to register your domain with your DNS provider.

![Remove domain](https://docs.digitalocean.com/screenshots/app-platform/settings-remove-domain.42e65760a9e35722d1535e9f3ada05f99b0afa5adb95c52db495349ee9ab7c68.png)

## Add a Domain that Uses CAA Records[](#add-a-domain-that-uses-caa-records)

App Platform supports [LetsEncrypt](https://letsencrypt.org/docs/caa/) and [Google Trust](https://pki.goog/faq) as Certificate Authorities (CAs).

If you want to add a domain to App Platform that uses Certification Authority Authorization (CAA), you must add both `letsencrypt.org` and `pki.goog` to your domain’s CAA DNS record. If you do not specify both CAs, the custom domain configuration may fail.

Once you have specified both CAs in the domain’s CAA record, add the domain in App Platform following the [custom domain instructions](#custom-domain). App Platform validates the CAA record and issues certificates from one of the CAs.

## Remove a Custom Domain[](#remove-a-custom-domain)

Before deleting an app, you should remove all custom domains from it. If you do not remove a domain from an app before deleting it, the domain may still point to the deleted app for up to 24 hours after deleting it. This can cause your domain to be unavailable to a new app until the DNS updates.

To remove a custom domain from an app using the [control panel](https://cloud.digitalocean.com/apps), click your app, and then click the **Settings** tab. From there, click the **Edit** link to the right of **Domains**.

Click the triple-dot (**…**) menu item, and click **Remove Domain** to remove a domain that is associated with your app.