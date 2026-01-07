---
source: https://docs.digitalocean.com/products/app-platform/how-to/add-deploy-do-button/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Add a "Deploy to DigitalOcean" Button to Your Repository

Validated on 12 Mar 2025 • Last edited on 17 Sep 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

The **Deploy to DigitalOcean** button lets users launch an app on App Platform with one click. To add it to your GitHub or GitLab repository’s `README`, create a [`deploy.template.yaml`](#add-the-yaml-file) file in a `.do` folder at the root of your repository, then [add the button](#add-the-button) to your `README`:

![Deploy to DigitalOcean](https://www.deploytodo.com/do-btn-blue.svg)

You can add the **Deploy to DigitalOcean** button with the following combinations:

*   One Service
*   One Service + Dev Database
*   One Static Site
*   One Static Site + Dev Database

The **Deploy to DigitalOcean** button only supports public repositories and Dev Databases. App Platform creates a Dev Databases during deploy, but it can’t connect to managed databases.

## Add the YAML File[](#add-the-yaml-file)

The `.do/deploy.template.yaml` file contains all of the configuration details required to launch your application on App Platform. The YAML file has the same structure as a [regular app spec](/products/app-platform/reference/app-spec/), but the spec information goes under a `spec:` key. If you leave out the `spec:` key, the button does not work.

When writing your app spec, reference \[Supported Buildpacks\] for your `environment_slug` and [App Platform pricing](/products/app-platform/details/pricing/#current-plans) for your `instance_size_slug`.

Here’s a sample `deploy.template.yaml` file for a [Golang service](https://github.com/digitalocean/sample-golang) with no database:

    spec:
     name: sample-golang
     services:
     - name: web
       git:
         branch: main
         repo_clone_url: https://github.com/digitalocean/sample-golang.git

Here’s an example of a minimal `deploy.template.yaml` file for a [Python-based service](https://github.com/digitalocean/sample-python) with a dev database:

    spec:
      name: sample-python
      services:
        - name: sample-python
          git:
            branch: main
            repo_clone_url: https://github.com/digitalocean/sample-python.git
        databases:
        - name: example-db

Here’s an example of a minimal [`deploy.template.yaml` for a static site](https://github.com/digitalocean/sample-html):

    spec:
     name: sample-html
     static_sites:
     - git:
         branch: main
         repo_clone_url: https://github.com/digitalocean/sample-html.git
       name: sample-html

You can also specify a `gitlab.com` URL in the `repo_clone_url` parameter of the YAML file.

## Configure Environment Variables[](#configure-environment-variables)

If your app requires an [environment variable](/products/app-platform/how-to/use-environment-variables/), you must list the variable in the `deploy.template.yaml` file with a placeholder value. App Platform prompts you to enter values for these environment variables when you create the app.

For example, in the `deploy.template.yaml` file below:

*   `DB_FOO_1` is a secret with a default value, `DB-password-testvalue`. App Platform lets you edit this environment variable at app creation time. This could be a database environment variable you need to set for the app to deploy.
*   `EMAIL` is available in plain text at runtime. App Platform prompts you to enter a value when you create the app.
*   `MESSAGE` is available in plain text at build and runtime, with a default value of `This is a greeting message`. App Platform lets you edit this value when you create the app.
*   `DATABASE_URL` is a [bindable variable](/products/app-platform/how-to/use-environment-variables/#using-bindable-variables-within-environment-variables) that points to the database connection string for `example-db`.

    spec:
      name: sample-golang
      services:
      - name: web
        git:
          branch: main
          repo_clone_url: https://github.com/digitalocean/sample-golang.git
        envs:
        - key: DB_FOO_1
          value: "DB-password-testvalue"
          type: SECRET
        - key: EMAIL
          scope: RUN_TIME
        - key: MESSAGE
          value: "This is a greeting message"
        - key: DATABASE_URL
          scope: RUN_TIME
          value: ${example-db.DATABASE_URL}
      databases:
      - name: example-db

## Add the Button[](#add-the-button)

To add the button to a repo’s `README` file, add the following Markdown to your repo’s `README` file:

    [![Deploy to DO](https://www.deploytodo.com/do-btn-blue.svg)](https://cloud.digitalocean.com/apps/new?repo=https://github.com/{REPO-OWNER}/{REPO-NAME}/tree/{BRANCH-NAME})

To add the button to a website or blog, embed the following HTML on your website:

    <a href="https://cloud.digitalocean.com/apps/new?repo=https://github.com/{repo-owner}/{repo-name}/tree/{branch-name}">
     <img src="https://www.deploytodo.com/do-btn-blue.svg" alt="Deploy to DO">
    </a>

Update the URL with your [repo’s path information](#update-url-path). For a GitLab repository, use `https://gitlab.com` instead of `https://github.com`.

### Update URL Path[](#update-url-path)

You must then replace the following variables in this code with the following values for the button to work:

*   `REPO-OWNER`: The base of your GitHub or GitLab URL. This is usually your user name or organization name.
*   `REPO-NAME`: The name given for this specific repo. This is the next path in the GitHub or GitLab URL.
*   `BRANCH-NAME`: Common defaults are `main` and `master` but this could be any branch in your repo.

The following code embeds this image in the `README` or website, making it viewable by users browsing your repository on GitHub.com, GitLab.com or your website. Your code edits make the image clickable so that users can deploy your app:

![Deploy to DO](https://www.deploytodo.com/do-btn-blue.svg)

## Customization[](#customization)

If you’d prefer a different color or style of button, you can swap out the image URL `https://www.deploytodo.com/do-btn-blue.svg`, with one of the following styles:

### Blue Ghost[](#blue-ghost)

[https://www.deploytodo.com/do-btn-blue-ghost.svg](https://www.deploytodo.com/do-btn-blue-ghost.svg)

![Deploy to DO](https://www.deploytodo.com/do-btn-blue-ghost.svg)

### White Ghost[](#white-ghost)

[https://www.deploytodo.com/do-btn-white-ghost.svg](https://www.deploytodo.com/do-btn-white-ghost.svg)

![Deploy to DO](https://www.deploytodo.com/do-btn-white-ghost.svg)

### White[](#white)

[https://www.deploytodo.com/do-btn-white.svg](https://www.deploytodo.com/do-btn-white.svg)

(Shown here on a black background)

![Deploy to DO](https://www.deploytodo.com/do-btn-white.svg)

## Verify the Button Works[](#verify-the-button-works)

Once you’ve added the button to your repo or website, click the **Deploy to DigitalOcean** button. If set up correctly, the button sends you to DigitalOcean’s Control Panel and prompts you to log in. Log in to the control panel.

Note

Your GitHub repo must contain some form of an app. If the repo is empty, App Platform returns the error `App detection failed - Missing app spec file` when you click the deploy button.

Once logged in, the control panel prompts you to enter any environmental variables your app may require. To update environmental variable values, click **Edit** and then enter values for any necessary environmental variables.

Once you have entered any necessary environmental variables, click **Deploy**. Your app should deploy within a few minutes.

If your app does not deploy, or the button does not correctly link to DigitalOcean’s Control Panel, or the control panel doesn’t display your environmental variables, check your configuration using the set up steps above.

## Get DigitalOcean Credits For Use of “Deploy to DigitalOcean” Button[](#get-digitalocean-credits-for-use-of-deploy-to-digitalocean-button)

If you refer someone to DigitalOcean using the **Deploy to DigitalOcean** button with a valid referral code, they get credits when they add a valid payment method. You also receive credit for the referral. You can find the payout amounts on the [official DigitalOcean Referral Program page](https://www.digitalocean.com/referral-program).

To enable this benefit for you and your users:

1.  Get your unique referral code by visiting [the **Referrals** tab on your **Settings** page](https://cloud.digitalocean.com/user_referrals) and note the 12 character code (for example, `a1b2c3d4e5f6`) at the end of your referral link (for example, `https://m.do.co/c/a1b2c3d4e5f6`).
    
2.  Add your referral code to the end of the URL as an additional query string beginning with `refcode=`.
    

For example, if your referral code is `a1b2c3d4e5f6` and your URL is:

    https://cloud.digitalocean.com/apps/new?repo=https://github.com/digitalocean/sample-nextjs/tree/main

After you add your referral code, the URL looks like this:

    https://cloud.digitalocean.com/apps/new?repo=https://github.com/digitalocean/sample-nextjs/tree/main&refcode=a1b2c3d4e5f6

Note

The `git` URL in `deploy.template.yaml` must be the same as that is specified in this spec.