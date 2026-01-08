---
source: https://openrouter.ai/docs/guides/guides/crypto-api
scraped: 2026-01-08
---

# Crypto API

OpenRouter enables cryptocurrency-based credit purchases through Coinbase integration across three EVM networks: Ethereum, Polygon, and Base (recommended).

## Key Process Steps

The purchase workflow involves three stages:

1. **Retrieve transaction data** via POST to `/api/v1/credits/coinbase`
2. **Execute on-chain transaction** using the returned calldata
3. **Monitor account balance** to trigger automatic top-ups

## API Request Details

To initiate a purchase, submit a request with:

- **amount**: USD value of credits (up to maximum limit)
- **sender**: Wallet address initiating the transaction
- **chain_id**: Network identifier (8453 for Base, 1 for Ethereum, 137 for Polygon)

The response provides transaction metadata including contract address, recipient details, signature data, and deadline timestamp.

## Transaction Execution

The documentation recommends using **viem** for EVM interactions. Key considerations include:

- Utilize the `swapAndTransferUniswapV3Native()` function for native token swaps
- Include excess ETH in transaction value as buffer (unconsumed funds return automatically)
- Simulate transactions before broadcasting to catch revert conditions
- Pool fee tier of 500 typically suffices for native tokens

## Credit Application Timeline

Credits appear immediately for purchases under $500. Larger transactions require approximately 15-minute confirmation delay to prevent chain reorganization issues.

## Balance Monitoring

Query `GET /api/v1/credits` endpoint periodically to track available balance. The cached response provides total credits purchased and cumulative usage—actual balance equals the difference between these values.
