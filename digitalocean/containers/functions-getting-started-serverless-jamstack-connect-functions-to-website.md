---
source: https://docs.digitalocean.com/products/functions/getting-started/serverless-jamstack/connect-functions-to-website/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/getting-started/serverless-jamstack/connect-functions-to-website/
domain: docs.digitalocean.com
---
                Serverless Jamstack, Part 3: Connect Serverless Functions to Website | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/functions.b0bb037d0e06c09d659cd32aeb2b48c4195d6e824680f25a98d7ed1c24010331.svg)Functions](/products/functions/)
*   [Getting Started](/products/functions/getting-started/)
    *   [Quickstart](/products/functions/getting-started/quickstart/)
    *   [Sample Functions](/products/functions/getting-started/sample-functions/)
    *   [Serverless Jamstack Site](/products/functions/getting-started/serverless-jamstack/)
        *   [Deploy MongoDB](/products/functions/getting-started/serverless-jamstack/deploy-mongodb/)
        *   [Add Functions to App](/products/functions/getting-started/serverless-jamstack/add-functions/)
        *   [Connect Functions to Site](/products/functions/getting-started/serverless-jamstack/connect-functions-to-website/)
*   [How-Tos](/products/functions/how-to/)
    *   [Create Functions](/products/functions/how-to/create-functions/)
    *   [Develop Functions](/products/functions/how-to/develop-functions/)
    *   [Configure Functions](/products/functions/how-to/configure-functions/)
    *   [Schedule Functionsprivate](/products/functions/how-to/schedule-functions/)
    *   [Call Async Functions](/products/functions/how-to/async-functions/)
    *   [Destroy Functions](/products/functions/how-to/destroy/)
    *   [Include Static Files](/products/functions/how-to/include-files/)
    *   [Set CORS Headers](/products/functions/how-to/set-custom-cors-headers/)
    *   [Create Namespaces](/products/functions/how-to/create-namespaces/)
    *   [Destroy Namespaces](/products/functions/how-to/destroy-namespaces/)
    *   [Structure Projects](/products/functions/how-to/structure-projects/)
    *   [Forward Logs](/products/functions/how-to/forward-logs/)
    *   [Deploy to App Platform](/products/functions/how-to/deploy-to-app-platform/)
*   [Reference](/products/functions/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Functions)
    *   [CLI Reference](/reference/doctl/reference/serverless/)
    *   [Activation Records](/products/functions/reference/activation-records/)
    *   [HTTP Headers](/products/functions/reference/http-headers/)
    *   [Parameters and Responses](/products/functions/reference/parameters-responses/)
    *   [Project Configuration](/products/functions/reference/project-configuration/)
    *   [Supported Runtimes](/products/functions/reference/runtimes/)
        *   [Go](/products/functions/reference/runtimes/go/)
        *   [Node.js](/products/functions/reference/runtimes/node-js/)
        *   [PHP](/products/functions/reference/runtimes/php/)
        *   [Python](/products/functions/reference/runtimes/python/)
    *   [Build Process](/products/functions/reference/build-process/)
*   [Concepts](/products/functions/concepts/)
    *   [Glossary](/glossary/functions/)
*   [Details](/products/functions/details/)
    *   [Features](/products/functions/details/features/)
    *   [Pricing](/products/functions/details/pricing/)
    *   [Availability](/products/functions/details/availability/)
    *   [Limits](/products/functions/details/limits/)

*   [Getting Started](/products/functions/getting-started/) 
*   [Serverless Jamstack Site](/products/functions/getting-started/serverless-jamstack/) 
*   Connect Functions to Site

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Serverless Jamstack, Part 3: Connect Serverless Functions to Website

Validated on 19 May 2022 • Last edited on 17 Apr 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

Now that you have deployed the app’s functions, you can connect them to the static website and deploy the entire application to App Platform.

In this part of the tutorial series, you:

1.  Retrieve the URLs of each function and test them in the static website’s JavaScript code.
2.  Test the site’s functionality using `live-server`.
3.  Redeploy the entire application to App Platform.

## Prerequisites[](#prerequisites)

To complete this part of the tutorial, you need:

*   To install [Live Server](https://www.npmjs.com/package/live-server), or your preferred development server, to test and serve the website on your local machine.

## Step 1: Connect Functions to Static Website[](#step-1-connect-functions-to-static-website)

Each function you deploy to DigitalOcean receives a public URL that you can use to invoke the function. Similar to traditional API endpoints, you can append query parameters to the URL that your function can access and use as arguments.

For example, in the previous tutorial, you deployed a function named `cloud/postEmail` that adds email addresses to a database. This function takes the argument `args.email`. To pass that argument via the function’s URL, you would append a query parameter called `email` to the end of the function’s URL with an email address as its value. The resulting URL looks similar to this:

    https://APIHOST.doserverless.co/api/v1/web/fn-EXAMPLE-ID/cloud/post-email?email=[email protected]

In this tutorial, the static website takes user input from the email subscription field, concatenates the user’s email address to the `cloud/postEmail` function’s URL, and then invokes the function by sending an HTTP request to it.

The vanilla JavaScript provided in the HTML website contains all of the logic necessary to handle this process. To test the project, you need to provide the deployed function’s URL to the app’s code.

To do this, retrieve the URL for the `cloud/postEmail` function:

    doctl serverless functions get cloud/postEmail --url

Once you retrieve the function’s URL, navigate to the root folder in the `serverless-jamstack` repo on your local machine and open the `script.js` file.

On line 76 of the file, replace the `/api/cloud/postEmail` string value of the `emailUrl` variable with the URL of your `cloud/postEmail` function.

The resulting code looks similar to this:

`script.js`

    ...
      let emailUrl = "https://APIHOST.doserverless.co/api/v1/web/fn-EXAMPLE-ID/cloud/postEmail" + "?email=" + email;
      await axios.post(emailUrl);
    ...

After updating the `emailUrl` variable, retrieve the `cloud/getCoffee` function’s URL:

    doctl serverless functions get cloud/getCoffee --url

Then replace the `/api/cloud/getCoffee` argument of the Axios request on line 4 with the URL of the `cloud/getCoffee` function. The resulting code looks similar to this:

`script.js`

    const getInventory = async () => {
        let results = await axios.get('https://APIHOST.doserverless.co/api/v1/web/fn-EXAMPLE-ID/api/getCoffee');
    results.data.forEach(item => {
        let pic = item.pic;
    ...

Once you’ve updated the `results` variable, save the changes to the file but don’t close it.

## Step 2: Test Site Functionality[](#step-2-test-site-functionality)

After you update the JavaScript file, you can test the site’s functionality using Live Server. From the `public` directory of the local repo, start Live Server:

    live-server

`live-server` automatically detects the `index.html` file and serves it in your local browser. Upon loading, the site automatically populates with the sample coffee data from the database using the `cloud/getCoffee` function.

![Preview of completed site](https://docs.digitalocean.com/screenshots/functions/jamstack-tutorial_site-complete.bd4203b4901dbd9a7e1621919a11fac8f096a45a9381f82d368c8d96f370dce1.png)

Enter a sample email address into the email newsletter subscription box and then click **Subscribe**. Upon submission, the `cloud/postEmail` function adds the email address to the `email-list` collection in the database. You can verify this by opening MongoDB Compass, [connecting to the database](/products/functions/getting-started/serverless-jamstack/deploy-mongodb/#step-3-connect-to-the-database), and reviewing the contents of the collection.

## Step 3: Save Changes to the Repo[](#step-3-save-changes-to-the-repo)

Once you have verified that the entire app is working, revert the URLs back to their original endpoints in the `script.js` file: `/api/cloud/getCoffee` and `/api/cloud/postEmail`. App Platform makes these endpoints available to your app at its own URL upon deployment.

To deploy the site, stage and commit all of the changes made to the repo using `git`:

    git add -A; git commit -m "completed tutorial"

Once you’ve committed the changes, push them to the remote repo’s `main` branch:

    git push

After pushing the changes to the repo, you are ready to deploy the application.

## Step 4: Deploy Application to App Platform[](#step-4-deploy-application-to-app-platform)

In this step, you deploy the entire application to App Platform from GitHub. [DigitalOcean’s App Platform](/products/app-platform/) is a Platform-as-a-Service (PaaS) offering that gives developers the ability to publish entire applications directly to DigitalOcean’s servers.

To start deploying the static website from the [DigitalOcean Control Panel](https://cloud.digitalocean.com), click **Create** in the top left, and then click **Apps**.

![App creation screen in App Platform](https://docs.digitalocean.com/screenshots/functions/jamstack-tutorial_app-create.4241840b489b8b59ea11fe01d3c95b7b19af4abb78a58f8a0f964ccfacaa2af8.png)

On the **Choose Source** screen, select GitHub. In the **Repository** menu, select the `serverless-jamstack` repo that you forked into your GitHub account. If this is your first time using App Platform with GitHub, GitHub prompts you to provide DigitalOcean read access to the repository.

In the **Source Directory** field, leave the value as the repo’s root (`/`). This tells App Platform which directory contains the website.

Leave the **Branch** selection as **main** and make sure **Autodeploy code changes** is checked, then click **Next**.

App Platform auto-detects the type of application inside the GitHub repo and displays its components on the **Resources** page. The page displays the static HTML website and the two functions you created.

App Platform needs to know where to listen for HTTP requests for the functions. To set up an HTTP route to the functions, click the edit button beside the function component. Under **HTTP Request Routes**, enter `/api` into the **Routes** field.

![slash api entered into the Routes field](https://docs.digitalocean.com/screenshots/functions/jamstack-tutorial_app-resources-route.bcffc1a86b8282eaaa26af18893e1544c0e1837ec0d4d409c851cfbaa521d549.png)

Once you’ve added the HTTP route to the functions, click **Save** then **Back** to return to the **Resources** page. Review your resources then click **Next** to go the **Environment** page.

The **Environment** page lets you configure environment variables for your application. App Platform detects that the Jamstack app’s functions require two environment variables. Click **Edit** beside the functions component to configure them.

The key field contains the `DATABASE_URL` environment variable key you set up in the `project.yml` file. Enter the database’s connection string into the **Values** field, then click **Save**.

![Environment variables added to respective key fields](https://docs.digitalocean.com/screenshots/functions/jamstack_tutorial_app_environment_val.02a2200974de084e7d9ed4d2bf1bdc16abfef5116e45e59b3fa00f74a93595d7.png)

Once you have configured the environment variables, click **Next** to continue.

On the **Info** screen, you can edit the name of the app. Set the name to `serverless-jamstack` and then click **Next**.

![App creation review screen in App Platform](https://docs.digitalocean.com/screenshots/functions/jamstack-tutorial_app-review.bfc559bbc4bf31d099e548c4c148fb67345a1ef3c74caaf9010021941a05fd98.png)

On the **Review** screen, you can review your app, its components, and your selected plan before deploying it. Review the list of components and then click **Create Resources** to deploy the website to App Platform.

Once the site has been deployed, App Platform adds the app’s URL to the app’s **Overview** page. Click the URL to check that the deployment was successful.

![Deployed app with content](https://docs.digitalocean.com/screenshots/functions/jamstack-tutorial_site-complete.bd4203b4901dbd9a7e1621919a11fac8f096a45a9381f82d368c8d96f370dce1.png)

The site opens and populates with the data from the MongoDB database. When you enter an email address into the email newsletter field and click **Submit**, the email address is added to the database’s `email-list` collection.

## Summary[](#summary)

In this part of the tutorial series, you:

*   Added each function’s URL to the static website component of the app.
*   Tested the site’s functionality using `live-server`.
*   Deployed the app to App Platform with its new functionality.

## What’s Next?[](#whats-next)

Now that you’ve set up a functional Jamstack website using serverless functions, you can [learn more about DigitalOcean Functions](/products/functions/).

You can also deploy these sample functions to learn more about how functions work.

[](/products/functions/getting-started/sample-functions/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Sample Functions

Use our example repositories with sample projects and functions to get started quickly with DigitalOcean Functions.

In this article...

*   [Prerequisites](#prerequisites)
*   [Step 1: Connect Functions to Static Website](#step-1-connect-functions-to-static-website)
*   [Step 2: Test Site Functionality](#step-2-test-site-functionality)
*   [Step 3: Save Changes to the Repo](#step-3-save-changes-to-the-repo)
*   [Step 4: Deploy Application to App Platform](#step-4-deploy-application-to-app-platform)
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

### We can't find any results for your searc