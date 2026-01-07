---
source: https://docs.digitalocean.com/products/functions/reference/build-process/
scraped: 2025-01-07
tags: [digitalocean, containers, registry, functions, monitoring, api-docs]
---

tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/reference/build-process/
domain: docs.digitalocean.com
---
                Build Process | DigitalOcean Documentation

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
*   Build Process

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Build Process

Validated on 31 Mar 2023 • Last edited on 14 Aug 2024

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

The Functions service performs a build process to transform your project’s source code into executable functions. Though much of the build runs in your own build scripts, there are other details about the Functions build process that are useful to understand and configure.

This reference covers the Functions build sequence, rules for build scripts, and details about adding and removing build artifacts from the function installation process.

## Project Files Used for Builds[](#project-files-used-for-builds)

A Functions project (or a Function component for [App Platform](/products/app-platform/)) has the following general structure:

    ├── lib/
    ├── packages/
    ├── project.yml
    └── <other-directories-and-files>

The build and deploy process uses only `project.yml`, the `packages` directory, and the `lib` directory. All other files and directories are ignored.

The `packages` directory contains subdirectories for each package, which subsequently have directories for each function:

    ├── packages/
    │   └── <package-name>/
    │       ├── <function-name-1>/
    │       └── <function-name-2>/

The contents of the `lib` folder and the contents of each function’s directory affect what is included in each deployed function and how that function is built.

Note

There are two special cases related to the project file structure. We don’t recommend extensive use of either of these special cases, as they can cause confusion and unintended build behavior:

1.  It is possible to use the special package name of `default` in this structure. The `default` package is not a real package and only indicates that the functions within it are not contained in any package. This won’t affect building, which works the same as it would in a real package.
2.  It is possible to place files (as opposed to directories) directly under a `<package-name>` folder. In this scenario, each file must contain all the source necessary for a function. The function’s name is derived from the file name. This affects building by placing that single source file entirely outside the build process.

## Local and Remote Builds[](#local-and-remote-builds)

When you run `doctl serverless deploy` without the `--remote-build` flag, `doctl` performs a local build. The build runs on your local machine and uses the toolchains installed there.

When you deploy using App Platform or when you run `doctl serverless deploy` with the `--remote-build` flag, the Functions service performs a remote build. The remote build uses the toolchains present in the runtime container for the chosen language.

Note

There are two situations where builds are _always_ performed remotely:

1.  All `go` runtimes are always built remotely. Only the remote runtime container knows how to wrap `go` functions in the special way required by `go` runtimes.
2.  On Linux, if `doctl` is installed as a snap rather than a release download, builds are always remote. A snap is run in a confined environment that is incapable of invoking arbitrary build tools.

The behavior of local and remote builds can differ, not only because of differences in the environment and available toolchains, but because certain erroneous behavior might be tolerated in local builds but not in remote builds.

## The Build Sequence[](#the-build-sequence)

The build sequence is the same regardless of whether it is driven by App Platform or by `doctl serverless deploy`.

First, the build process performs a library build. Libraries are built if there is one of the following files in the project:

*   `lib/build.sh` _(macOS and Linux builds only)_
*   `lib/build.cmd` _(local Windows builds only)_
*   `lib/package.json`

Library builds run with the `lib/` folder as the current working directory. Next, a specific function build runs in each `<function-name>` folder. Functions are built if there is one of the following files in the project:

*   `packages/<package-name>/<function-name>/build.sh`
*   `packages/<package-name>/<function-name>/build.cmd` _(local build only)_
*   `packages/<package-name>/<function-name>/package.json`

Function builds run with the `packages/<package-name>/<function-name>` folder as the current working directory.

Libraries and functions are built as follows:

1.  If the build is local, the hosting system is Windows, and `build.cmd` is present, `build.cmd` is executed.
2.  Otherwise, if `build.sh` is present, `build.sh` is executed.
3.  Otherwise, if `package.json` is present and contains a `build` script, then `npm install` is executed followed by `npm run build`.
4.  Otherwise, if `package.json` is present but does not contain a `build` script, `npm install --production` is executed.

Note

All `build.sh` scripts must be set as executable. Otherwise, the build fails with an `Unexpected token › in JSON at position 0` error. Update your file permissions with `git`:

    git add --chmod=+x -- build.sh

This adds execute permissions (`+x`) to the file `build.sh`. After updating permissions on all build scripts, commit the changes and try your build again.

In a remote build, when `npm` is invoked, the `npm` binary is guaranteed to be present and in the `PATH`. For local builds, it is up to you to have `npm` installed and in your `PATH`.

## Rules for Build Scripts[](#rules-for-build-scripts)

Build scripts need to adhere to the following rules regarding file and directory paths. These rules apply to `build.sh` and `build.cmd` scripts and for any scripts incorporated into `package.json`. They also apply to any other scripts that are indirectly invoked by the primary scripts.

1.  Scripts running in a `<package-name>/<function-name>` folder may refer to anything (directly or indirectly) under the `lib/` folder or within the same `<package-name>/<function-name>` folder.
2.  Scripts running in the `lib/` folder may refer to anything (directly or indirectly) under the `lib/` folder. They may also refer to `<package-name>/<function-name>` folders, with some stipulations covered in the [next section](#lib-references).
3.  References to any other files or directories are not allowed.

Because of these rules, the use of absolute paths should be avoided.

Note

If you violate these rules, you may perform a successful local build, only to have the build fail when done remotely. Since App Platform deployment always uses remote building, you should frequently check that `--remote-build` works during development if your intention is to eventually deploy with App Platform, as these rules can not be checked or explicitly enforced during deployment. Not doing so could result in undefined behavior and hard-to-diagnose bugs.

### Precautions for Library Builds that Reference Functions[](#lib-references)

It is possible for scripts running in the `lib/` folder to refer to files and directories in `<package-name>/<function-name>` directories, but precautions are necessary if you also need to run remote builds.

For remote builds you should always check for the existence of a `<package-name>/<function-name>` folder before using it. Because each function in a remote build is built separately in its own container, the `lib/` folder is always available, but only one `<package-name>/<function-name>` folder is present.

If you don’t intend to build your project remotely, you can reference files in your function directories from `lib/` without restriction. Be aware, however, that this means you can not use the `go` runtime or deploy to App Platform.

### Library Builds Run Once Per Function[](#library-builds-run-once-per-function)

Because each function build runs in its own container, libraries are built multiple times for a project with multiple functions. These builds do not interfere with each other via the file system (since the builds are containerized), but side-effects visible outside the container (such as placing something in an object storage bucket or external database) may happen more than once.

## Control Which Build Artifacts are Installed[](#control-which-build-artifacts-are-installed)

At the end of the build phase, all the successfully built functions are installed into the deployment. Software builds often produce many artifacts, and not all of these need to be part of the installed function. You can use `.ignore` and `.include` files to control what is installed.

The default installation behavior is:

1.  Everything under `<package-name>/<function-name>/` is gathered into a single zip file.
2.  The zip file is what is installed as the function.
3.  When the function is invoked, the contents of the zip file are unzipped into the runtime container.

Note

If there is only one file present in the function directory (including through the use of `.include` and `.ignore` files) then the zipping is skipped. For example, the single file could be a `bundle.js` file, or a custom-made zip file created by your build script.

The final file needs to be within the 48 MB size limit and conform to the file layout (when unzipped, if applicable) expected by the runtime. These details are language-specific.

To control the actual contents of the installation, you can use either a `.ignore` file to exclude some artifacts, or a `.include` file to specify exactly what to include. The latter offers more control in that it is also capable of including files from the `lib/` directory.

### Remove Build Artifacts from Installation with `.ignore`[](#remove-build-artifacts-from-installation-with-ignore)

Every `<package-name>/<function-name>/` folder may contain a `.ignore` file. This file uses the same format as [`.gitignore`](https://git-scm.com/docs/gitignore). It specifies artifacts that should not be a part of the deployed function.

If there is exactly one file left after the excluded files, then no zip file is generated and that file becomes the contents of the installed function.

The `.ignore` file is only consulted after the build has run, making it possible for the build to generate this file itself.

If you use `.ignore`, then you cannot use a `.include` file.

### Select Build Artifacts for Installation with `.include`[](#select-build-artifacts-for-installation-with-include)

Every `<package-name>/<function-name>/` folder may contain a special `.include` file. Each line of this file is a relative path to a file or folder.

If you use `.include`, any file or folder not listed in the `.include` file are ignored.

If the path is a folder, it and all of its contents, recursively, are included.

If the path references a `<package-name>/<function-name>/` folder, all of the included files have the same path name within the generated zip file and preserve that path when the zip file is unzipped into the runtime container.

If the path starts with `../../../lib/`, then only the filename part of the path is preserved in the zip file and in the runtime container. For example, the path `../../../lib/node_modules` are included as `node_modules`. The path can still denote a folder and its entire contents.

Absolute paths and paths that begin with `../` (other than the `../../../lib` folder) are prohibited.

Unlike the `.ignore` directive, this approach allows you to incorporate shared material into a function in addition to controlling its exact contents.

Like the `.ignore` directive, it is possible for the build to dynamically generate `.include` file.

As with `.ignore`, if `.include` has only one line, and that line is a file rather than a folder, no zip file is generated and the single file comprises the entire contents of the function.

If you use `.include`, then you cannot use a `.ignore` file.

### Use `.include` Without a Function Build[](#use-include-without-a-function-build)

A `<package-name>/<function-name>/` directory may have an `.include` file even if no build is performed there.

This capability is especially useful in conjunction with a library build. For example, if a library build is used to generate `lib/node_modules/` in a project, then every function in the project may incorporate the result using `../../../lib/node_modules` in an `.include` file.

In this article...

*   [Project Files Used for Builds](#project-files-used-for-builds)
*   [Local and Remote Builds](#local-and-remote-builds)
*   [The Build Sequence](#the-build-sequence)
*   [Rules for Build Scripts](#rules-for-build-scripts)
    *   [Precautions for Library Builds that Reference Functions](#lib-references)
    *   [Library Builds Run Once Per Function](#library-builds-run-once-per-function)
*   [Control Which Build Artifacts are Installed](#control-which-build-artifacts-are-installed)
    *   [Remove Build Artifacts from Installation with `.ignore`](#remove-build-artifacts-from-installation-with-ignore)
    *   [Select Build Artifacts for Installation with `.include`](#select-build-artifacts-for-installation-with-include)
    *   [Use `.include` Without a Function Build](#use-include-without-a-function-build)

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

### We can't find any results f