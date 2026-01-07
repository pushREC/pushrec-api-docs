---
source: https://docs.digitalocean.com/products/functions/reference/runtimes/php/
scraped: 2025-01-07
tags: [digitalocean, containers, registry, functions, monitoring, api-docs]
---

tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/reference/runtimes/php/
domain: docs.digitalocean.com
---
                Functions PHP Runtime | DigitalOcean Documentation

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

*   [Reference](/products/functions/reference/) 
*   [Supported Runtimes](/products/functions/reference/runtimes/) 
*   PHP

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Functions PHP Runtime

Validated on 31 Mar 2023 • Last edited on 17 Apr 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

Functions supports PHP 8.0 (`php:8.0`) and PHP 8.2 (`php:8.2`). Specify the desired runtime and version with the [`runtime` key in your `project.yml` file](/products/functions/reference/project-configuration/#runtime), or by using the **Runtime** drop-down when creating a function through the control panel.

The Functions PHP runtime passes [two parameters](#parameters) to your handler function, and expects either no return value or a properly formatted response array.

The entrypoint must be a file named `index.php`.

## A PHP Echo Function[](#a-php-echo-function)

Here is a PHP function that responds with all the event and context information available to it:

    <?php
    function main(array $event, object $context) : array
    {
        return ["body" => ["event" => $event, "context" => $context]];
    }

This can be useful for getting started with the Functions platform or for debugging.

The runtime expects a function called `main` in the `index.php` file to act as the _entry point_ or the _handler_. This handler function is the only function where the runtime passes in data and receive responses.

You can set a different function name as the handler using the [`main` key in `project.yml`](/products/functions/reference/project-configuration/#main).

The `main` function above takes two parameters, an `$event` array and a `$context` object. It returns them as the `body` of the response array. This data structure is automatically converted to JSON and returned.

## Parameters[](#parameters)

The handler function is always passed two parameters, `$event` and `$context`.

Note

Information about function parameters that is not language-specific can be found in the [Parameters and Responses](/products/functions/reference/parameters-responses/) reference documentation.

The first parameter, [`event`](#event-parameter), is the input event that initiated the function. When this is an HTTP event it’s called a _web event_.

The second parameter, [`$context`](#context-parameter), is data about the function’s execution environment such as memory allocations and time remaining before a timeout.

Both parameters are optional and you may ignore them if your function doesn’t require the information they provide. The parameter list for your handler function should look like one of the following:

*   `(array $event, object $context)`: Accesses both parameters.
*   `(array $event)`: Accesses only the event parameter.
*   `(array $_, object $context)`: Accesses only the context parameter (`$_` is a common convention for unused parameters, though you may need to mark it as unused to satisfy your linter or IDE).
*   `()`: Accesses neither.

Here is a function that uses both parameters to return a personalized `Hello world` and the function’s version number:

    <?php
    function main(array $event, object $context) : array
    {
        $name = $event["name"] ?? "stranger";
        $version = $context->{"functionVersion"};
    
        return ["body" => "Hello $name! This is version $version."];
    }

If you add this example function to your namespace, you can call the function by pasting its URL in your browser and adding a `name` field in a query string at the end:

Note

You can get the URL for your function from the control panel interface, or by running the following command on the command line:

    doctl serverless function get <function-name> --url

    https://<your-function-url>?name=Sammy

Or use `curl` to send the input as form data in the body of the request:

    curl -d 'name=Sammy' <your-function-url>

Either way, the function returns the response body:

    Hello Sammy! This is function version 0.0.2.

### Event Parameter[](#event-parameter)

The `$event` parameter is an array. It is structured like the following example:

    [
      'http' => [
        'headers' => [
          'accept' => '*/*',
          'accept-encoding' => 'gzip',
          'user-agent' => 'curl/7.85.0',
          'x-forwarded-for' => '203.0.113.11',
          'x-forwarded-proto' => 'https',
          'x-request-id' => '5df6f6b0d00b58217439c8376fcae23a',
        ],
        'method' => 'POST',
        'path' => '',
      ],
      'shark' => 'hammerhead',
    ]

This example event has had a `shark: hammerhead` input passed to it. This has been parsed and added as a top-level key to the array.

More details on the information contained in the `event` parameter is available under the [Event Parameter section](/products/functions/reference/parameters-responses/#event-parameter) of the Parameters and Responses reference documentation.

### Context Parameter[](#context-parameter)

The `$context` parameter is an object. It has the following properties:

    {
        string $activationId;
        string $apiHost;
        string $apiKey;
        int    $deadline;
        string $functionName;
        string $functionVersion;
        string $namespace;
        string $requestId;
    }

Additionally, it has one method, `getRemainingTimeInMillis()`, which returns the number of milliseconds remaining before the function times out. It typically returns a `float` value. It returns an `int` in the rare case where the deadline is reached the precise moment this method is called (so that the remaining number of milliseconds is less than or equal to 0).

More details on the information contained in the `context` parameter is available under the [Context Parameter section](/products/functions/reference/parameters-responses/#context-parameter) of the Parameters and Responses reference documentation.

## Returns[](#returns)

To send a response, your function must return a properly formatted response array. More details on the response format can be found in the [Returns section](/products/functions/reference/parameters-responses/#returns) of the Parameters and Responses reference documentation.

If your function does not need to send a response, you may return an empty array nothing at all, or omit the `return` statement entirely.

Here is a response array that returns a string as the response body:

    ["body" => "Hello world"]

If the `body` is an array or object, it is automatically serialized as JSON and returned with a `Content-Type: application/json` header. This function returns the `event` and `context` parameters as JSON:

    <?php
    function main(array $event, object $context) : array
    {
        return ["body" => ["event" => $event, "context" => $context]];
    }

You may also specify the response’s status code and headers. The status code can be a number or a string:

    <?php
    function main() : array
    {
        return [
            "body" => "Hello world",
            "statusCode" => 200,
            "headers" => [
                "Content-Type" => "text/plain"
            ]
    
        ];
    }

## Example Functions[](#example-functions)

### Return JSON[](#return-json)

If the `body` is an array or object, it is automatically serialized as JSON and returned with a `Content-Type: application/json` header.

    <?php
    function main() : array
    {
        return ["body" => [["type" => "hammerhead"], ["type" => "mako"]]];
    }

### Return an Image[](#return-an-image)

To return an image or other media type, set the correct `Content-Type` header and return a base64-encoded `body`:

    <?php
    function main() : array
    {
        // example 1x1 GIF
        $gif = "R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=";
        return [
            "statusCode" => "200",
            "headers" => [
                "Content-Type" => "image/gif"
            ],
            "body" => $gif
        ];
    }

### Return an HTTP Redirect[](#return-an-http-redirect)

A `302` status code and `location` header redirects an HTTP client to a new URL:

    <?php
    function main() : array
    {
        return [
            "statusCode" => "302",
            "headers" => [
                "location" => "https://example.com"
            ]
        ];
    }

### Return HTML and Set a Cookie[](#return-html-and-set-a-cookie)

Set cookies with the `Set-Cookie` header, and use the `Content-Type: 'text/html'` header to return HTML content:

    <?php
    function main() : array
    {
        return [
            "statusCode" => "200",
            "headers" => [
                "Set-Cookie" => "UserID=Sammy; Max-Age=3600; Version=",
                "Content-Type" => "text/html"
            ],
            "body" => "<html><body><h3>hello</h3></body></html>"
        ];
    }

### More Example Functions[](#more-example-functions)

Some more complex example PHP functions are available on GitHub:

[](https://github.com/digitalocean/sample-functions-php-numberstowords)

![](https://docs.digitalocean.com/images/icons/default.svg)

PHP Numbers to Words

github.com

[](https://github.com/digitalocean/sample-functions-php-helloworld)

![](https://docs.digitalocean.com/images/icons/default.svg)

PHP Hello World

github.com

## Log to the Console[](#log-to-the-console)

Any text output to `stdout` and `stderr` is logged and can be accessed through [the `doctl` command line tool](/reference/doctl/). Use `doctl serverless activations logs --follow` to follow logs for all functions in the current namespace, or specify a single function with `--function`.

See the [`doctl serverless activations logs` reference](/reference/doctl/reference/serverless/activations/logs/) for more information or add the `--help` flag to the command for help output.

## Use Modules and Dependencies[](#use-modules-and-dependencies)

PHP dependencies can be managed with [Composer](https://getcomposer.org/). To deploy a PHP function with package dependencies you need a `composer.json` file and a `build.sh` build script to run `composer install`.

Here is an example PHP function that uses a `cowsay` package:

    <?php
    use Cowsayphp\Farm;
    
    function main(array $event): array
    {
        $name = $event["name"] ?? "stranger";
        $cow = Farm::create(\Cowsayphp\Farm\Cow::class);
        return [
            "body" => $cow->say("Hello $name from PHP!")
        ];
    }

The `composer.json` file for this function:

    {
        "require": {
            "alrik11es/cowsayphp": "^1.2"
        }
    }

A `build.sh` script is also required to install the packages:

    #!/bin/bash
    set -e
    composer install

Make sure the above files are in a [properly formatted project directory](/products/functions/how-to/structure-projects/) with an `index.php` file containing the `main()` entrypoint, then deploy with `doctl serverless deploy <your-project-directory>`. You may use the `--remote-build` flag to run the build remotely.

The runtime automatically takes care of requiring the `vendor/autoload.php` file, so you do not need to include this in your function.

## Include Files in Built Function[](#include-files-in-built-function)

To include arbitrary files with your deployed function (for example, config files and templates), place the files in your function directory. By default, all files in the function directory is included in the deployed function. This can be customized using `.ignore` and `.include` files. See the [Build Process reference](/products/functions/reference/build-process/) for details.

Here is an example function that reads text content from a file:

Directory structure:

    .
    ├── packages
    │   └── <package-name>
    │       └── <function-name>
    │           ├── index.php
    │           └── to_be_included.txt
    └── project.yml

The `index.php` file:

`index.php`

    <?php
    function main() : array
    {
        $fileContents = file_get_contents('to_be_included.txt');
        return ["body" => "File contents: \"$fileContents\""];
    }

The file to include, `to_be_included.txt`:

`to_be_included.txt`

    Hello, World!

When invoked, the response is:

    File contents: "Hello, World!"

In this article...

*   [A PHP Echo Function](#a-php-echo-function)
*   [Parameters](#parameters)
    *   [Event Parameter](#event-parameter)
    *   [Context Parameter](#context-parameter)
*   [Returns](#returns)
*   [Example Functions](#example-functions)
    *   [Return JSON](#return-json)
    *   [Return an Image](#return-an-image)
    *   [Return an HTTP Redirect](#return-an-http-redirect)
    *   [Return HTML and Set a Cookie](#return-html-and-set-a-cookie)
    *   [More Example Functions](#more-example-functions)
*   [Log to the Console](#log-to-the-console)
*   [Use Modules and Dependencies](#use-modules-and-dependencies)
*   [Include Files in Built Function](#include-files-in-built-function)

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

Try