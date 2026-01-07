---
source: https://docs.digitalocean.com/products/functions/getting-started/serverless-jamstack/add-functions/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/getting-started/serverless-jamstack/add-functions/
domain: docs.digitalocean.com
---
                Serverless Jamstack, Part 2: Add Serverless Functions to App | DigitalOcean Documentation

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
*   Add Functions to App

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Serverless Jamstack, Part 2: Add Serverless Functions to App

Validated on 19 May 2022 • Last edited on 17 Apr 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

To replicate the same level of functionality as a full stack application, Jamstack websites rely on a combination third-party APIs and serverless functions to handle CRUD functionality.

In this part of the tutorial series, you:

1.  Configure the app’s environment variables.
2.  Add Node.js functions to the app that connect to the MongoDB database.
3.  Deploy and test the functions using the `doctl` CLI.

## Prerequisites[](#prerequisites)

To complete this part of the tutorial, you need:

*   To [fork the sample `serverless-jamstack`](https://github.com/digitalocean/serverless-jamstack) repo into your GitHub account and then clone it to your local machine.
*   To install the [latest version of `doctl`](/reference/doctl/how-to/install/), the official DigitalOcean CLI.
*   To install the [latest version of the `npm`](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) package manager.

## Step 1: Configure Environment Variables[](#step-1-configure-environment-variables)

In the [previous part](/products/functions/getting-started/serverless-jamstack/deploy-mongodb/) of this tutorial, you copied the database’s connection string. In this step you use these elements to configure the app’s environment variables that it requires to access the MongoDB database.

Similar to most application structures, you can set up a `.env` file in the root directory of your project to contain your app’s environment variables. When you deploy your functions, the DigitalOcean Functions service automatically copies the values in the `.env` file and makes them available to your functions in the cloud.

To set up the environment variables, create a `.env` file in the root directory of the [prerequisite repo](https://github.com/digitalocean/serverless-jamstack) using the `nano` text editor or your preferred text editor:

    nano .env

In the file, paste the following variable into it, replacing the placeholder values with your database’s connection string.

    DATABASE_URL=your_databases_connection_string

The resulting file should look something like this:

`.env`

    DATABASE_URL=mongodb+srv://doadmin:<your-password>@serverless-jamstack-61a61ac5.mongo.ondigitalocean.com/admin?authSource=admin&replicaSet=do-coffee

Once you’ve defined the variable, save the file and close it.

## Step 2: Add Functions to App[](#step-2-add-functions-to-app)

Next, you need to add Node.js functions to the app that connect to the MongoDB database cluster and retrieve and post data to the database.

To add functions to your app, you need to create [a special directory called `packages`](/products/functions/how-to/structure-projects/) in the app’s root directory. The `packages` directory is where you add and organize your functions, and it requires a specific structure to ensure that your functions deploy correctly.

    serverless-jamstack/
    ├── packages
    │   └── cloud
    │       ├── getCoffee
    │       │   ├── index.js
    |       |   ├── package-lock.json
    │       │   └── package.json
    │       │
    │       └── postEmail
    │           ├── index.js
    |           ├── package-lock.json
    │           └── package.json
    │── project.yml
    └── .env

Each child directory in the `packages` directory represents a single package, and each child directory of a package represents a single function. `packages` can contain an arbitrary number of packages, and each package can contain an arbitrary number of functions.

In this tutorial, the app contains a package directory called `cloud` which contains two functions: `getCoffee` and `postEmail`. Use the following set of `mkdir` commands to create a `packages` directory with the following child directories required for the sample functions:

    mkdir -p packages/cloud/getCoffee; mkdir packages/cloud/postEmail

The `-p` flag allows you to create the parent directories, `packages` and `cloud`, in tandem with the `getCoffee` and `postEmail` child directories.

After you’ve set up the package directory, navigate to the `getCoffee` directory to add your first function.

You can think of each function as its own self-contained Node.js project. This means that the `package.json` file your function relies on should be in the same directory as your function.

To initialize the `getCoffee` directory for a Node.js project, run:

    npm init -y

This creates the `package.json` file that Node.js uses to track the project’s dependencies and attributes. The `-y` flag shortens the initialization process by skipping several user input prompts that are not required to complete this tutorial.

The functions in this tutorial require the `mongodb` module, [MongoDB’s official Node.js client](https://mongodb.github.io/node-mongodb-native/). This allows your functions to connect, retrieve, and post data to the database.

Because functions can be deployed and tested from the cloud, you do not need to install the modules locally. Instead, you can use `--package-lock-only` flag to update the `package.json` file with the function’s required dependencies without installing them. To update the `package.json` file with this function’s dependencies, run:

    npm install --package-lock-only mongodb

After updating the function’s dependencies, create a file called `index.js` in the `getCoffee` directory. This file contains your function’s code.

    nano index.js

In the text editor, paste the following code into the `index.js` file:

`packages/cloud/getCoffee/index.js`

    // The function's dependencies.
    const MongoClient = require('mongodb').MongoClient;
    
    // Function starts here.
    async function main() {
    
        // MongoDB client configuration.
        const uri = process.env['DATABASE_URL'];
        let client = new MongoClient(uri);
    
        // Instantiates a connection to the database and retrieves data from the `available-coffee` collection
        try {
            await client.connect();
            const inventory = await client.db("do-coffee").collection("available-coffees").find().toArray();
            console.log(inventory);
            return {
                "body": inventory
            };
        } catch (e) {
            console.error(e);
            return {
                "body": { "error": "There was a problem retrieving data." },
                "statusCode": 400
            };
        } finally {
            await client.close();
        }
    }
    
    // IMPORTANT: Makes the function available as a module in the project.
    // This is required for any functions that require external dependencies.
    module.exports.main = main;

This function configures the MongoDB client with the database’s credentials, sends a request to the database, and then returns the response.

The function’s comments outline its functionality in detail but there are two important pieces to note:

*   The last line (`module.exports.main = main`) exports the function as a Node.js module. If a function relies on any external dependencies, you must export the function as a module for it run to correctly on the DigitalOcean Functions service.
    
*   If your function is returning something, the return value must be included in a response body like this:
    

    return {
        "body": your_data
    }

After pasting the code into the file, save the file and close it.

Now repeat the same steps for the `packages/cloud/postEmail` directory using the same set of dependencies and the following code for the `index.js` file:

`packages/cloud/postEmail/index.js`

    const MongoClient = require('mongodb').MongoClient;
    
    async function main(args) {
        const uri = process.env['DATABASE_URL'];
        let client = new MongoClient(uri);
    
        let newEmail = args.email;
        try {
            await client.connect();
            await client.db("do-coffee").collection("email-list").insertOne({subscriber: newEmail});
            console.log(`added ${newEmail} to database.`);
            return { ok: true };
        } catch (e) {
            console.error(e);
            return {
                "body": { "error": "There was a problem adding the email address to the database." },
                "statusCode": 400
            };
        } finally {
            await client.close();
        }
    }
    
    module.exports.main = main;

## Step 3: Set Up Project Specification[](#step-3-set-up-project-specification)

DigitalOcean Functions requires [a YAML specification file named `project.yml`](/products/functions/reference/project-configuration/) in the root folder of the app. The `project.yml` file is a manifest that lists each function in the app’s `packages` directory and makes the service aware of any environment variables.

Create a `project.yml` file in the root folder:

    nano project.yml

Paste the following code into the `project.yml` file:

`project.yml`

    packages:
      - name: cloud
        actions:
          - name: getCoffee
            limits: 
              timeout: 5000
              memory: 256
          - name: postEmail
            limits: 
              timeout: 5000
              memory: 256
    environment:
      DATABASE_URL: ${DATABASE_URL}

This `project.yml` file declares a package named `cloud` with two functions (`actions`) in it: `getCoffee` and `postEmail`. The `environment` stanza declares one environment variable in the global scope of the `packages` directory.

Once you’ve added the code to the file, save the file and close it.

## Step 4: Deploy and Test the Functions[](#step-4-deploy-and-test-the-functions)

Once you have added the functions to their respective directories, updated their `package.json` files with their dependencies, and configured the `project.yml` file, you can deploy the functions to DigitalOcean and test them from the command line using `doctl`.

To deploy the functions, start by connecting to the development namespace:

    doctl serverless connect

The development namespace is where you can test functions in the cloud before deploying them to App Platform.

Once connected, deploy the function by running the following command from the app’s root directory:

    doctl serverless deploy .

A successful deploy returns output that looks like this:

    Deployed functions ('doctl sbx fn get <funcName> --url' for URL):
      - cloud/getCoffee
      - cloud/postEmail

Finally, you can test a function by running the `functions invoke` command:

    doctl serverless functions invoke cloud/getCoffee

The command returns the sample JSON data from the `do-coffee` database.

To retrieve the function’s URL, use the `serverless functions get` command with the `--url` flag:

    doctl serverless functions get cloud/getCoffee --url

You can copy and paste the returned URL into your local browser and see how the function returns the JSON data similar to how a traditional API endpoint would.

## Summary[](#summary)

In this part of the tutorial series, you:

*   Set up the app’s environment variables using a `.env` file.
*   Set up a `packages` directory to house the functions.
*   Added functions to the app.
*   Configured the app’s `project.yml` file.
*   Deployed and tested the functions using `doctl`.

## Next Step[](#next-step)

In the next part of this tutorial series, you use each function’s URL to connect the static HTML website to the functions, which allows the website to connect to the database.

[](/products/functions/getting-started/serverless-jamstack/connect-functions-to-website/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Serverless Jamstack, Part 3: Connect Serverless Functions to Website

Connect the serverless functions to the static website, test the site’s functionality and redeploy the app.

In this article...

*   [Prerequisites](#prerequisites)
*   [Step 1: Configure Environment Variables](#step-1-configure-environment-variables)
*   [Step 2: Add Functions to App](#step-2-add-functions-to-app)
*   [Step 3: Set Up Project Specification](#step-3-set-up-project-specification)
*   [Step 4: Deploy and Test the Functions](#step-4-deploy-and-test-the-functions)
*   [Summary](#summary)
*   [Next Step](#next-step)

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

[](https://x.com/digitalocean)[](https://www.instagram.com/thedigitalocean)[](https://www.facebook.com/DigitalOceanCloudHosting)[](https://discord.gg/digitalocean)[](https://www.youtube.com/DigitalOcean)[](https://www.linkedin.com/company/digitalocean)