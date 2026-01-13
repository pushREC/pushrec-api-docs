# Bulk Actions - Trigger.dev Documentation

## Overview

Bulk actions allow you to perform replaying and canceling on multiple runs simultaneously. This feature is particularly useful when you need to retry a batch of failed runs with updated code or cancel several in-progress runs.

## How to Create a New Bulk Action

Follow these steps to execute bulk actions:

1. **Open the panel**: Access the bulk action panel from the top right of the runs page
2. **Filter runs**: Display the specific runs you want to target by applying filters to the runs table
3. **Select runs**: Alternatively, you can manually select individual runs instead of filtering
4. **Choose runs**: Select which runs should be included in the bulk action
5. **Name (optional)**: Provide a name for your bulk action for reference
6. **Select action**: Choose between replay or cancel operations
7. **Confirm**: Click "Replay" or "Cancel" and confirm in the dialog that appears
8. **Monitor**: View the bulk action's progress on the dedicated bulk action page
9. **Review results**: Replay or view the runs directly from this page

## Important Limitation

"You can only cancel runs that are in states that allow cancellation (like QUEUED or EXECUTING)." Runs already completed, failed, or in final states cannot be canceled once the bulk action process reaches them.
