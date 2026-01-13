# Trigger.dev Subscribe Functions Documentation

## Overview

The page documents backend subscription functions for real-time run updates in Trigger.dev. The content covers three main subscription methods and includes type-safe implementations with metadata updates.

## Key Functions

**runs.subscribeToRun**
Subscribes to all changes for a specific run, returning an async iterator that yields run objects as they update. The iterator completes when the run finishes.

**runs.subscribeToRunsWithTag**
Subscribes to runs with a specific tag. As noted, "This iterator will never complete, so you must manually break out of the loop when you no longer want to receive updates."

**runs.subscribeToBatch**
Subscribes to all run changes within a batch. Similar to tag subscriptions, "you must manually `break` the loop when you want to stop listening for updates."

## Code Examples

The documentation provides TypeScript examples showing:
- Basic subscription loops using `for await`
- Type inference passing task types as generics
- Union types for multiple tasks with switch statements for type narrowing
- Metadata subscription patterns for progress tracking

## Metadata Updates

A significant feature allows tasks to push real-time metadata updates (progress, status, intermediate results) that subscribers automatically receive. The example demonstrates a progress task updating completion percentage as items are processed, with backend code monitoring these updates.

## Authentication

All functions support server-side (API key) and client-side (public access tokens) authentication for security-controlled access.
