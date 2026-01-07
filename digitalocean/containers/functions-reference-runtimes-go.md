---
source: https://docs.digitalocean.com/products/functions/reference/runtimes/go/
scraped: 2025-01-07
tags: [digitalocean, containers, registry, functions, monitoring, api-docs]
---

tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/reference/runtimes/go/
domain: docs.digitalocean.com
---
                Functions Go Runtime | DigitalOcean Documentation

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
*   Go

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Functions Go Runtime

Validated on 31 Mar 2023 • Last edited on 23 Apr 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

Functions supports Go 1.17 (`go:1.17`) and Go 1.20 (`go:1.20`). Specify the desired runtime and version with the [`runtime` key in your `project.yml` file](/products/functions/reference/project-configuration/#runtime), or by using the **Runtime** drop-down when creating a function through the control panel.

The Functions Go runtime passes [two parameters](#parameters) to your handler function, and expects either no return value or a [properly formatted response](#returns) type.

## A Go Hello World Function[](#a-go-hello-world-function)

Here is a Go function that responds with a greeting and some information about the function version:

    package main
    
    import (
    	"context"
    )
    
    type Event struct {
    	Name string `json:"name"`
    }
    
    type Response struct {
    	Body string `json:"body"`
    }
    
    func Main(ctx context.Context, event Event) Response {
    	if event.Name == "" {
    		event.Name = "stranger"
    	}
    	version := ctx.Value("function_version").(string)
    	return Response {
    		Body: "Hello " + event.Name + "! This is function version " + version,
    	}
    }

The runtime expects a function called `Main` to act as the _entry point_ or the _handler_. This handler function is the only function where the runtime passes in data and receive responses.

You can set a different function name as the handler using the [`main` key in `project.yml`](/products/functions/reference/project-configuration/#main).

The `Main` function above takes two parameters: a `ctx` of the built-in type `context.Context`, and `event` with a custom `Event` type. It returns a response where the `Body` is a greeting to the user-provided `Name` (if any) in the event, and the function version provided in then context.

After [adding this function to your namespace](/products/functions/how-to/create-functions/), you can call this function by pasting its URL into your browser and adding a `name` field in a query string at the end:

    https://<your-function-url>?name=Sammy

Note

You can get the URL for your function from the control panel interface, or by running the following command on the command line:

    doctl serverless function get <function-name> --url

Or use `curl` to send the input as form data in the body of the request:

    curl -d 'name=Sammy' <your-function-url>

Either way, the function returns the response body:

    Hello Sammy! This is function version 0.0.2

## Parameters[](#parameters)

The handler function is passed two parameters. The first represents the function’s execution context, and the second is the event, often representing an HTTP request.

Note

Information about function parameters that is not language-specific can be found in the [Parameters and Responses](/products/functions/reference/parameters-responses/) reference documentation.

The first parameter, [`context`](#context-parameter), is data about the function’s execution environment, such as memory allocations and the time remaining before a timeout.

The second parameter, [`event`](#event-parameter), is the input event that initiated the function. When this is an HTTP event, it’s called a _web event_.

Both parameters are optional and you may ignore them if your function doesn’t require the information they provide. The parameter list for your handler function should look like one of the following:

*   `(context.Context, yourEventType)`: Accesses both parameters, where `yourEventType` is any type that can be unmarshalled using the `encoding/json` package.
*   `(context.Context)`: Accesses only the context.
*   `(yourEventType)`: Accesses only the event, where `yourEventType` is any type that can be unmarshalled using the `encoding/json` package.
*   `()`: Accesses neither.

### Event Parameter[](#event-parameter)

The event parameter is unmarshalled from a JSON object. It is structured like the following example JSON:

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

This example event has had a `shark: hammerhead` input passed to it. This has been parsed and added as a top-level key to the dictionary.

More details on the information contained in the `event` parameter is available under the [Event Parameter section](/products/functions/reference/parameters-responses/#event-parameter) of the Parameters and Responses reference documentation.

### Context Parameter[](#context-parameter)

The context parameter is [the `context.Context` type built into Go](https://pkg.go.dev/context#Context). The context has deadline and typed values that can be retrieved using the `Value` method.

See [the official `context.Context` docs](https://pkg.go.dev/context#Context) for more information on using this type.

The context parameter contains additional values. Here they are represented as keys of a JSON object with sample values. All of the context values are strings:

    {
      "activation_id": "5f56b7e9fbd84b2f96b7e9fbd83b2f2e",
      "api_host": "https://faas-nyc1-2ef2e6cc.doserverless.co",
      "api_key": "",
      "function_name": "/fn-52ad03a2-8660-4f7c-55a5-81aa8bbe73b1/example",
      "function_version": "0.0.10",
      "namespace": "fn-52ad03a2-8660-4f7c-55a5-81aa8bbe73b1",
      "request_id": "452164dfeced0a7ad91ee675609024e7"
    }

The context data doesn’t contain the deadline value. This is because Go contexts already have a concept of deadlines, so the runtime uses that. To get the deadline of the context, use the `Deadline` method:

    deadline, _ := ctx.Deadline()

To retrieve values from the context parameter, use the `Value` method:

    id := ctx.Value("activation_id").(string)

More details on the information contained in the `context` parameter is available under the [Context Parameter section](/products/functions/reference/parameters-responses/#context-parameter) of the Parameters and Responses reference documentation.

## Returns[](#returns)

To send a response, your function must return a properly formatted response dictionary. The following return types can be used in Go functions:

*   Use `yourEventType` to return a strongly typed result, where `yourEventType` is any type that can be unmarshalled using the `encoding/json` package. Make sure your struct has a field that can be rendered as a JSON `body` property to return data to the client.
*   Use `map[string]interface` to return any key-value pairs you want. Make sure that one of the keys is `body` to return data to the client.
*   Return no value if you do not need to return data to the client.

More details on the response can be found in the [Returns section](/products/functions/reference/parameters-responses/#returns) of the Parameters and Responses reference documentation.

## Example Functions[](#example-functions)

### Return JSON[](#return-json)

If the `body` is a type that can be serializable as JSON by the `encoding/json` package, it is automatically serialized as JSON and returned with a `Content-Type: application/json` header.

    package main
    
    type Shark struct {
    	Type string `json:"type"`
    }
    
    type Response struct {
    	Body []Shark `json:"body"`
    }
    
    func Main() Response {
    	return Response{
    		Body: []Shark{
    			{
    				Type: "hammerhead",
    			},
    			{
    				Type: "mako",
    			},
    		},
    	}
    }

### Return an Image[](#return-an-image)

To return an image or other media type, set the correct `Content-Type` header and return a base64-encoded `body`:

    package main
    
    type ResponseHeaders struct {
    	ContentType string `json:"Content-Type"`
    }
    
    type Response struct {
    	Body       string          `json:"body"`
    	StatusCode string          `json:"statusCode"`
    	Headers    ResponseHeaders `json:"headers"`
    }
    
    func Main() Response {
    	// example 1x1 GIF
    	gif := "R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs="
    	return Response{
    		Body:       gif,
    		StatusCode: "200",
    		Headers: ResponseHeaders{
    			ContentType: "image/gif",
    		},
    	}
    }

### Return an HTTP Redirect[](#return-an-http-redirect)

A `302` status code and `location` header redirects an HTTP client to a new URL:

    package main
    
    type ResponseHeaders struct {
    	Location string `json:"location"`
    }
    
    type Response struct {
    	StatusCode string          `json:"statusCode"`
    	Headers    ResponseHeaders `json:"headers"`
    }
    
    func Main() Response {
    	return Response{
    		StatusCode: "302",
    		Headers: ResponseHeaders{
    			Location: "https://example.com",
    		},
    	}
    }

### Return HTML and Set a Cookie[](#return-html-and-set-a-cookie)

Set cookies with the `Set-Cookie` header, and use the `Content-Type: 'text/html'` header to return HTML content:

    package main
    
    type ResponseHeaders struct {
    	SetCookie   string `json:"Set-Cookie"`
    	ContentType string `json:"Content-Type"`
    }
    
    type Response struct {
    	Body       string          `json:"body"`
    	StatusCode string          `json:"statusCode"`
    	Headers    ResponseHeaders `json:"headers"`
    }
    
    func Main() Response {
    	return Response{
    		Body:       "<html><h1>Hello, World!</h1></html>",
    		StatusCode: "200",
    		Headers: ResponseHeaders{
    			SetCookie:   "UserID=Sammy; Max-Age=3600; Version=",
    			ContentType: "text/html",
    		},
    	}
    }

### More Example Functions[](#more-example-functions)

Some more in-depth example Go functions are available on GitHub:

[](https://github.com/digitalocean/sample-functions-golang-helloworld)

![](https://docs.digitalocean.com/images/icons/default.svg)

Go Hello World

github.com

[](https://github.com/digitalocean/sample-functions-golang-random)

![](https://docs.digitalocean.com/images/icons/default.svg)

Go Random Number

github.com

[](https://github.com/digitalocean/sample-functions-golang-presigned-url)

![](https://docs.digitalocean.com/images/icons/default.svg)

Go Presigned URL

github.com

[](https://github.com/digitalocean/sample-functions-mysql)

![](https://docs.digitalocean.com/images/icons/default.svg)

Go MySQL

github.com

[](https://github.com/digitalocean/sample-functions-golang-slackbot)

![](https://docs.digitalocean.com/images/icons/default.svg)

Go Slack Bot

github.com

## Log to the Console[](#log-to-the-console)

Any text output to `stdout` and `stderr` is logged and can be accessed through [the `doctl` command line tool](/reference/doctl/).

Log to `stdout` by using `fmt.Print`, `fmt.Println`, or other similar methods. Make sure to include a newline at the end of the message:

    fmt.Print("this text is logged\n")

Use `doctl serverless activations logs --follow` to follow logs for all functions in the current namespace, or specify a single function with the `--function` flag.

See the [`doctl serverless activations logs` reference](/reference/doctl/reference/serverless/activations/logs/) for more information, or add the `--help` flag to the command for help output.

## Use Modules and Dependencies[](#use-modules-and-dependencies)

To use third-party Go modules, add a `go.mod` and `go.sum` file to the remote build process (Go functions are always built remotely during deploys).

First, navigate to the directory containing your function code.

Initialize your Go module if necessary (if you already have a `go.mod` file, skip this):

    go mod init example

Add your third-party module, in this case the `gosimple/slug` module:

    go get github.com/gosimple/slug

This creates the entries needed in `go.mod` and `go.sum`. The build process uses these files to download your third-party modules and build your function.

If you require different build steps you should create a `build.sh` file in the function directory. Read the [Build Process reference](/products/functions/reference/build-process/) for more details on the build process and build scripts.

## Include Files in Built Function[](#include-files-in-built-function)

To include arbitrary files with your deployed function (for example, config files and templates), you must use Go’s [embed package](https://pkg.go.dev/embed). The files to be embedded must be placed in the same directory as the function source code files.

Here is an example function that embeds text content from a file:

Directory structure:

    .
    ├── packages
    │   └── <package-name>
    │       └── <function-name>
    │           ├── main.go
    │           └── to_be_included.txt
    └── project.yml

`main.go`

    package main
    
    import (
    	_ "embed"
    	"fmt"
    )
    
    //go:embed to_be_included.txt
    var s string
    
    type Response struct {
    	Body string `json:"body"`
    }
    
    func Main() Response {
    	return Response{
    		Body: fmt.Sprintf("File contents: %q\n", s),
    	}
    }

`to_be_included.txt`

    Hello, World!

When invoked, the response is:

    File contents: "Hello, World!"

In this article...

*   [A Go Hello World Function](#a-go-hello-world-function)
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

T