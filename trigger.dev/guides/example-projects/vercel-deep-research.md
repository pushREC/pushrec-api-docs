# Deep Research Agent Using Vercel's AI SDK - Documentation Summary

## Overview

This full-stack project implements an intelligent deep research agent that autonomously conducts multi-layered web research, generating comprehensive PDF reports. The system converts findings to PDF and uploads them to cloud storage.

## Tech Stack

- **Next.js**: Web application framework
- **Vercel's AI SDK**: AI model integration and structured generation
- **Trigger.dev**: Task orchestration, execution, and real-time progress updates
- **OpenAI GPT-4o**: Query generation, content analysis, and report creation
- **Exa API**: Semantic web search with live crawling
- **LibreOffice**: PDF generation from HTML
- **Cloudflare R2**: Report storage

## Key Features

1. **Recursive Research**: AI generates search queries, evaluates relevance, asks follow-up questions, and searches deeper based on findings
2. **Real-Time Progress**: Frontend receives live updates via Trigger.dev Realtime as research progresses
3. **Source Evaluation**: AI assesses search result relevance before processing
4. **HTML Report Generation**: Completed research converts to structured HTML using detailed system prompts
5. **PDF Creation & Upload**: Reports convert to PDF via LibreOffice and upload to Cloudflare R2

## Architecture

### Three Connected Trigger.dev Tasks

1. **deepResearchOrchestrator**: Coordinates the entire research workflow
2. **generateReport**: Processes research data into structured HTML using GPT-4o
3. **generatePdfAndUpload**: Converts HTML to PDF and uploads to R2

Tasks use `triggerAndWait()` to create dependency chains ensuring proper sequencing with error handling isolation.

## Recursive Research Logic

The core implementation uses depth-first search with configurable parameters:
- **depth**: Controls recursion levels (default: 2)
- **breadth**: Number of queries per level (default: 2, halved each recursion)

### Research Process Flow

1. Query generation via GPT-4o from input
2. Web search using Exa API with live crawling
3. Relevance evaluation by GPT-4o
4. Learning extraction for insights and follow-up questions
5. Recursive deepening with follow-ups becoming new queries
6. Accumulation of learnings, sources, and queries across recursion levels

## Real-Time Implementation

The `useRealtimeTaskTrigger` React hook triggers the deep-research task and subscribes to updates. Tasks set metadata during execution:

```
metadata.set("status", {
  progress: 25,
  label: `Searching the web for: "${query}"`,
});
```

Frontend components parse and display this status information in real-time.

## Relevant Code Locations

- **Deep research task**: Core recursive logic in deepResearch.ts (customizable model, depth, breadth)
- **Report generation**: generateReport.ts (structured HTML creation with system prompts)
- **PDF generation**: generatePdfAndUpload.ts (HTML-to-PDF conversion example)
- **Research UI**: DeepResearchAgent.tsx (form submission and progress display)
- **Progress component**: progress-section.tsx (live research progress visualization)

## Learning Resources

- Trigger.dev Realtime documentation for subscribing to runs
- Realtime streaming for task data
- Batch triggering capabilities
- React hooks for Trigger.dev API interaction
