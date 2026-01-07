---
source: https://docs.digitalocean.com/products/functions/reference/runtimes/python/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/reference/runtimes/python/
domain: docs.digitalocean.com
---
                Functions Python Runtime | DigitalOcean Documentation

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
*   Python

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Functions Python Runtime

Validated on 31 Mar 2023 • Last edited on 2 Sep 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

Functions supports Python 3.9 (`python:3.9`) and Python 3.11 (`python:3.11`). Specify the desired runtime and version with the [`runtime` key in your `project.yml` file](/products/functions/reference/project-configuration/#runtime), or by using the **Runtime** drop-down when creating a function through the control panel.

The Functions Python runtime passes [two parameters](#parameters) to your handler function, and expects either no return value or a properly formatted response dictionary.

## A Python Echo Function[](#a-python-echo-function)

Here is a Python function that responds with all the event and context information available to it:

    def main(event, context):
        return {
            "body": {
                "event": event,
                "context": {
                    "activationId": context.activation_id,
                    "apiHost": context.api_host,
                    "apiKey": context.api_key,
                    "deadline": context.deadline,
                    "functionName": context.function_name,
                    "functionVersion": context.function_version,
                    "namespace": context.namespace,
                    "requestId": context.request_id,
                },
            },
        }

This can be useful for getting started with the Functions platform or for debugging.

The runtime expects a function called `main` to act as the _entry point_ or the _handler_. This handler function is the only function where the runtime passes in data and receive responses.

You can set a different function name as the handler using the [`main` key in `project.yml`](/products/functions/reference/project-configuration/#main).

The `main` function above takes two parameters, an `event` dictionary and a `context` object. It returns them as the `body` of the response array. This data structure is automatically converted to JSON and returned.

The Python runtime’s `context` object is not JSON serializable, so each key is manually referenced when creating the response.

## Parameters[](#parameters)

The handler function is always passed two parameters, `event` and `context`.

Note

Information about function parameters that is not language-specific can be found in the [Parameters and Responses](/products/functions/reference/parameters-responses/) reference documentation.

The first parameter, [`event`](#event-parameter), is the input event that initiated the function. When this is an HTTP event, it’s called a _web event_.

The second parameter, [`context`](#context-parameter), is data about the function’s execution environment, such as memory allocations and time remaining before a timeout.

Both parameters are optional and you may ignore them if your function doesn’t require the information they provide. The parameter list for your handler function should look like one of the following:

*   `(event, context)`: Accesses both parameters.
*   `(event)`: Accesses only the event parameter.
*   `(_, context)`: Accesses only the context parameter (`_` is a common convention for unused parameters, though you may need to mark it as unused to satisfy your linter or IDE).
*   `()` : Accesses neither.

Here is a function that uses both parameters to return a personalized `Hello world` and the function’s version number:

    def main(event, context):
        name = event.get("name", "stranger")
        version = context.function_version
        return {"body": f'Hello {name}! This is version {version}'}

If you add this function to your namespace, you can call it by pasting its URL in your browser and adding a `name` field in a query string at the end:

Note

You can get the URL for your function from the control panel interface, or by running the following command on the command line:

    doctl serverless function get <function-name> --url

    https://<your-function-url>?name=Sammy

Or use `curl` to send the input as form data in the body of the request:

    curl -d 'name=Sammy' <your-function-url>

Either way, the function returns the response body:

    Hello Sammy! This is function version 0.0.2.

### Event Parameter[](#event-parameter)

The `event` parameter is a dictionary. It is structured like the following example:

    {
    	"http": {
    		"headers": {
    			"accept": "*/*",
    			"accept-encoding": "gzip",
    			"user-agent": "curl/7.85.0",
    			"x-forwarded-for": "203.0.113.11",
    			"x-forwarded-proto": "https",
    			"x-request-id": "5df6f6b0d00b58217439c8376fcae23a"
    		},
    		"method": "POST",
    		"path": ""
    	},
    	"shark": "hammerhead"
    }

This example event has had a `shark: hammerhead` input passed to it. This has been parsed and added as a top-level key to the object.

More details on the information contained in the `event` parameter is available under the [Event Parameter section](/products/functions/reference/parameters-responses/#event-parameter) of the Parameters and Responses reference documentation.

### Context Parameter[](#context-parameter)

The `context` parameter is a class. It has the following properties, shown here with example data:

    {
    	"activation_id": "5f56b7e9fbd84b2f96b7e9fbd83b2f2e",
    	"api_host": "https://faas-nyc1-2ef2e6cc.doserverless.co",
    	"api_key": "",
    	"deadline": 1675959023728,
    	"function_name": "/fn-52ad03a2-8660-4f7c-55a5-81aa8bbe73b1/example",
    	"function_version": "0.0.10",
    	"namespace": "fn-52ad03a2-8660-4f7c-55a5-81aa8bbe73b1",
    	"request_id": "452164dfeced0a7ad91ee675609024e7"
    }

Additionally, it has one method, `get_remaining_time_in_millis()`, which returns an `int` of the milliseconds remaining before the function times out.

More details on the information contained in the `context` parameter is available under the [Context Parameter section](/products/functions/reference/parameters-responses/#context-parameter) of the Parameters and Responses reference documentation.

## Returns[](#returns)

To send a response, your function must return a properly formatted response dictionary. If your function does not need to send a response, you may return an empty dictionary, nothing at all, or omit the `return` statement entirely.

Here is a response dictionary that would return a string as the response body:

    { "body": "Hello world" }

If the `body` is a Python dictionary or list, it is automatically serialized as JSON and returned with a `Content-Type: application/json` header. This function returns the `event` parameter as JSON:

    def main(event, context):
    	return { "body": { "event": event } }

You may also specify the response’s status code and headers. The status code can be an integer or a string:

    def main(event, context):
    	return {
    		"body": "Hello world",
    		"statusCode": 200,
    		"headers": {
    			"Content-Type": "text/plain"
    		}
    	}

More details on the response can be found in the [Returns section](/products/functions/reference/parameters-responses/#returns) of the Parameters and Responses reference documentation.

## Example Functions[](#example-functions)

### Return JSON[](#return-json)

If the `body` is a dictionary or list, it is automatically serialized as JSON and returned with a `Content-Type: application/json` header.

    def main():
    	return {
    		"body": [{"type": "hammerhead"}, {"type": "mako"}]
    	}

### Return an Image[](#return-an-image)

To return an image or other media type, set the correct `Content-Type` header and return a base64-encoded `body`:

    def main():
    	gif = "R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs="
    	return {
    		"headers": { "Content-Type": "image/gif" },
    		"statusCode": 200,
    		"body": gif
      }

### Return an HTTP Redirect[](#return-an-http-redirect)

A `302` status code and `location` header redirects an HTTP client to a new URL:

    def main():
    	return {
    		"headers": { "location": "https://example.com" },
    		"statusCode": 302
      }

### Return HTML and Set a Cookie[](#return-html-and-set-a-cookie)

Set cookies with the `Set-Cookie` header, and use the `Content-Type: 'text/html'` header to return HTML content:

    def main():
    	return {
    		"headers": {
    			"Set-Cookie": "UserID=Sammy; Max-Age=3600; Version=",
    			"Content-Type": "text/html"
    		},
    		"statusCode": 200,
    		"body": "<html><body><h3>hello</h3></body></html>"
    	}

### More Example Functions[](#more-example-functions)

Some more complex example Python functions are available on GitHub:

[](https://github.com/digitalocean/sample-functions-python-sendgrid-email)

![](https://docs.digitalocean.com/images/icons/default.svg)

Python SendGrid Emails

github.com

[](https://github.com/digitalocean/sample-functions-python-twilio-sms)

![](https://docs.digitalocean.com/images/icons/default.svg)

Python Twilio SMS

github.com

[](https://github.com/digitalocean/sample-functions-python-jokes)

![](https://docs.digitalocean.com/images/icons/default.svg)

Python Joke API

github.com

## Log to the Console[](#log-to-the-console)

Any text output to `stdout` and `stderr` is logged and can be accessed through [the `doctl` command line tool](/reference/doctl/). Use `doctl serverless activations logs --follow` to follow logs for all functions in the current namespace, or specify a single function with `--function`.

See the [`doctl serverless activations logs` reference](/reference/doctl/reference/serverless/activations/logs/) for more information or add the `--help` flag to the command for help output.

## Use Python Packages and Dependencies[](#use-python-packages-and-dependencies)

Python functions can import external dependencies. Some common packages are included in the Python runtime (version 3.11 and higher), and others can be deployed using a `requirements.txt` file and a build script.

### Use Packages Provided by the Runtime[](#use-packages-provided-by-the-runtime)

Beginning with version 3.11, the Python runtime includes some common PyPI packages. You can `import` these packages in your functions without providing a `requirements.txt` and build script.

Each version of the Python runtime always provides the same major version of its included packages. Minor and patch version updates are applied throughout the lifetime of a runtime version.

To use these packages, import them in your Python code. Here is an example Python function that uses the `pandas` package:

    import pandas
    
    def main():
    	return { "body": str(pandas) }

#### Python 3.11 Runtime[](#python-311-runtime)

The following packages are provided by the Python 3.11 runtime:

Package

Major Version

[beautifulsoup4](https://pypi.org/project/beautifulsoup4/)

4

[boto3](https://pypi.org/project/boto3/)

1

[daft](https://pypi.org/project/daft/)

0

[duckdb](https://pypi.org/project/duckdb/)

1

[kafka\_python](https://pypi.org/project/kafka-python/)

2

[mysql-connector-python](https://pypi.org/project/mysql-connector-python/)

8

[numpy](https://pypi.org/project/numpy/)

1

[pandas](https://pypi.org/project/pandas/)

2

[polars](https://pypi.org/project/polars/)

1

[pydo](https://pypi.org/project/pydo/)

0

[pyiceberg](https://pypi.org/project/pyiceberg/)

0

[pymongo](https://pypi.org/project/pymongo/)

4

[pyspark](https://pypi.org/project/pyspark/)

4

[python-dateutil](https://pypi.org/project/python-dateutil/)

2

[redis](https://pypi.org/project/redis/)

4

[requests](https://pypi.org/project/requests/)

2

[scrapy](https://pypi.org/project/Scrapy/)

2

[simplejson](https://pypi.org/project/simplejson/)

3

[virtualenv](https://pypi.org/project/virtualenv/)

20

To use a package not provided by the runtime, follow the instructions in the next section to include it in a virtual environment with your deployed function code.

### Add Packages With a Virtual Environment[](#add-packages-with-a-virtual-environment)

Python functions with external dependencies not provided by the runtime can be deployed with a build script and a `requirements.txt` file.

First make sure that the file containing the handler function is named `__main__.py`. Here is an example Python function that uses the `cowsay` package:

    import cowsay
    
    def main(event):
    	name = event.get("name", "stranger")
    	greeting = cowsay.get_output_string('cow', f'Hello {name} from Python!')
    	return { "body": greeting }

The `requirements.txt` file for this function:

    cowsay==5.0

A `build.sh` script is required to create a `virtualenv` and install the packages:

    #!/bin/bash
    
    set -e
    
    virtualenv --without-pip virtualenv
    
    # Uncomment if you're using the Python 3.9 runtime
    # pip install -r requirements.txt --target virtualenv/lib/python3.9/site-packages
    
    # Uncomment if you're using the Python 3.11 runtime
    # pip install -r requirements.txt --target virtualenv/lib/python3.11/site-packages

The virtualenv must be created with the `virtualenv` command and be named `virtualenv`. This script uses the `--without-pip` flag to avoid installing `pip` into the `virtualenv`. This reduces the final size of the built function, freeing up space for other dependencies.

The build system’s built-in `pip` is used to install requirements directly to the appropriate path using the `--target` option. If you are building locally, your local machine is the build system and must have the runtime’s version of Python installed, as well as `pip` and `virtualenv`.

Make sure the above files are in a [properly formatted project directory](/products/functions/how-to/structure-projects/) then deploy with `doctl serverless deploy <your-project-directory>`. You may use the `--remote-build` flag to run the build remotely.

## Include Files in Built Function[](#include-files-in-built-function)

To include arbitrary files with your deployed function (for example, config files and templates), place the files in your function directory. By default, all files in the function directory are included in the deployed function. You can customize this using `.ignore` and `.include` files. See the [build process reference](/products/functions/reference/build-process/) for details.

Here is an example function that reads text content from a file:

Directory structure:

    .
    ├── packages
    │   └── <package-name>
    │       └── <function-name>
    │           ├── __main__.py
    │           └── to_be_included.txt
    └── project.yml

`__main__.py`

    def main():
      with open('to_be_included.txt', 'r') as file:
        file_contents = file.read()
        return {
          'body': f'File contents: "{file_contents}"'
        }

`to_be_included.txt`

    Hello, World!

When invoked, the response is:

    File contents: "Hello, World!"

In this article...

*   [A Python Echo Function](#a-python-echo-function)
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
*   [Use Python Packages and Dependencies](#use-python-packages-and-dependencies)
    *   [Use Packages Provided by the Runtime](#use-packages-provided-by-the-runtime)
        *   [Python 3.11 Runtime](#python-311-runtime)
    *   [Add Packages With a Virtual Environment](#add-packages-with-a-virtual-environment)
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

### We can't find any results for your search