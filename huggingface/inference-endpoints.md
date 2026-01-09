---
source: https://huggingface.co/docs/inference-endpoints
scraped: 2026-01-09
method: bright_data
duration_ms: 1319
---

                    Inference Endpoints  

 [![Hugging Face's logo](/front/assets/huggingface_logo-noborder.svg) Hugging Face](/)

*   [Models](/models)
*   [Datasets](/datasets)
*   [Spaces](/spaces)
*   Community
    
*   [Docs](/docs)
*   [Enterprise](/enterprise)
*   [Pricing](/pricing)

*   * * *
    
*   [Log In](/login)
*   [Sign Up](/join)

Inference Endpoints (dedicated) documentation

Inference Endpoints

# Inference Endpoints (dedicated)

🏡 View all docsAWS Trainium & InferentiaAccelerateArgillaAutoTrainBitsandbytesChat UIDataset viewerDatasetsDeploying on AWSDiffusersDistilabelEvaluateGoogle CloudGoogle TPUsGradioHubHub Python LibraryHuggingface.jsInference Endpoints (dedicated)Inference ProvidersKernelsLeRobotLeaderboardsLightevalMicrosoft AzureOptimumPEFTSafetensorsSentence TransformersTRLTasksText Embeddings InferenceText Generation InferenceTokenizersTrackioTransformersTransformers.jssmolagentstimm

Search documentation

main EN

[](https://github.com/huggingface/hf-endpoints-documentation)

Overview

[Inference Endpoints](/docs/inference-endpoints/index) [Quick Start](/docs/inference-endpoints/quick_start) [About Inference Endpoints](/docs/inference-endpoints/about) [API Reference](/docs/inference-endpoints/api_reference)

Tutorials

[Deploy your own chat application](/docs/inference-endpoints/tutorials/chat_bot) [Build an embedding pipeline](/docs/inference-endpoints/tutorials/embedding) [Create your own transcription app](/docs/inference-endpoints/tutorials/transcription)

Support

[Pricing](/docs/inference-endpoints/support/pricing) [FAQ](/docs/inference-endpoints/support/faq)

Guides

[Foundations](/docs/inference-endpoints/guides/foundations) [Configuration](/docs/inference-endpoints/guides/configuration) [Auto Scaling](/docs/inference-endpoints/guides/autoscaling) [Logs](/docs/inference-endpoints/guides/logs) [Analytics](/docs/inference-endpoints/guides/analytics) [Security & Compliance](/docs/inference-endpoints/guides/security) [AWS PrivateLink](/docs/inference-endpoints/guides/private_link)

Inference Engines

[vLLM](/docs/inference-endpoints/engines/vllm) [Text Generation Inference (TGI)](/docs/inference-endpoints/engines/tgi) [SGLang](/docs/inference-endpoints/engines/sglang) [Text Embeddings Inference (TEI)](/docs/inference-endpoints/engines/tei) [llama.cpp](/docs/inference-endpoints/engines/llama_cpp) [Inference Toolkit](/docs/inference-endpoints/engines/toolkit) [Custom Container Images](/docs/inference-endpoints/engines/custom_container)

![Hugging Face's logo](/front/assets/huggingface_logo-noborder.svg)

Join the Hugging Face community

and get access to the augmented documentation experience

Collaborate on models, datasets and Spaces

Faster examples with accelerated inference

Switch between documentation themes

[Sign Up](/join)

to get started

            

Copy page

# [](#inference-endpoints)Inference Endpoints

![](https://huggingface.co/datasets/huggingface/documentation-images/resolve/main/hf-endpoints/inference-endpoint-doc-thumbnail-light.png) ![](https://huggingface.co/datasets/huggingface/documentation-images/resolve/main/hf-endpoints/inference-endpoint-doc-thumbnail-dark.png)

Inference Endpoints is a managed service to deploy your AI model to production. Here you’ll find quickstarts, guides, tutorials, use cases and a lot more.

[

### 🔥 Quickstart

Deploy a production ready AI model in minutes.

](./quick_start)[

### 🔍 How Inference Endpoints Works

Understand the main components and benefits of Inference Endpoints.

](./about)[

### 📖 Guides

Explore our guides to learn how to configure or enable specific features on the platform.

](./guides/foundations)[

### 🧑‍💻 Tutorials

Step-by-step guides on common developer scenarios.

](./tutorials/chat_bot)

## [](#why-use-inference-endpoints)Why use Inference Endpoints

Inference Endpoints makes deploying AI models to production a smooth experience. Instead of spending weeks configuring infrastructure, managing servers, and debugging deployment issues, you can focus on what matters most: your model and your users.

Our platform eliminates the complexity of AI infrastructure while providing enterprise-grade features that scale with your business needs. Whether you’re a startup launching your first AI product or an enterprise team managing hundreds of models, Inference Endpoints provides the reliability, performance, and cost-efficiency you need.

**Key benefits include:**

*   ⬇️ **Reduce operational overhead**: Eliminate the need for dedicated DevOps teams and infrastructure management, letting you focus on innovation.
*   🚀 **Scale with confidence**: Handle traffic spikes automatically without worrying about capacity planning or performance degradation.
*   ⬇️ **Lower total cost of ownership**: Avoid the hidden costs of self-managed infrastructure including maintenance, monitoring, and security compliance.
*   💻 **Future-proof your AI stack**: Stay current with the latest frameworks and optimizations without managing complex upgrades.
*   🔥 **Focus on what matters**: Spend your time improving your models and building great user experiences, not managing servers.

## [](#key-features)Key Features

*   📦 **Fully managed infrastructure**: you don’t need to worry about things like kubernetes, CUDA versions and configuring VPNs. Inference Endpoints deals with this under the hood so you can focus on deploying your model and serving customers as fast as possible.
*   ↕️ **Autoscaling**: as there’s more traffic to your model you’ll need more firepower as well. Your Inference Endpoint scales up as traffic increases and down as it decreases to save you on unnecessary compute cost.
*   👀 **Observability**: understand and debug what’s going on in your model through logs & metrics.
*   🔥 **Integrated support for open-source Inference Engines**: Whether you want to deploy your model with vLLM, TGI or a custom container, we got you!
*   🤗 **Seamless integration with the Hugging Face Hub**: Downloading model weights fast and with the correct security policies is paramount when bringing an AI model to production. With Inference Endpoints, it’s easy and safe.

## [](#further-reading)Further Reading

If you’re considering using Inference Endpoints in production, read these two case studies:

*   [Why we’re switching to Hugging Face Inference Endpoints, and maybe you should too](https://huggingface.co/blog/mantis-case-study)
*   [Investing in Performance: Fine-tune small models with LLM insights - a CFM case study](https://huggingface.co/blog/cfm-case-study)

You might also find these blogs helpful:

*   [🤗 LLM suggestions in Argilla with HuggingFace Inference Endpoints](https://huggingface.co/blog/alvarobartt/argilla-suggestions-via-inference-endpoints)
*   [Programmatically manage Inference Endpoints](https://www.philschmid.de/inference-endpoints-iac)
*   [TGI Multi-LoRA: Deploy Once, Serve 30 models](https://huggingface.co/blog/multi-lora-serving)
*   [Llama 3.1 - 405B, 70B & 8B with multilinguality and long context](https://huggingface.co/blog/llama31#hugging-face-inference-endpoints)
*   [Deploy MusicGen in no time with Inference Endpoints](https://huggingface.co/blog/run-musicgen-as-an-api)

Or try out the [Quick Start](./quick_start)!

[Update on GitHub](https://github.com/huggingface/hf-endpoints-documentation/blob/main/docs/source/index.md)

[Quick Start→](/docs/inference-endpoints/quick_start)

[Inference Endpoints](#inference-endpoints) [Why use Inference Endpoints](#why-use-inference-endpoints) [Ke
