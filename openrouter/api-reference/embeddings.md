---
source: https://openrouter.ai/docs/api/reference/embeddings
scraped: 2026-01-08
---

# Embeddings

OpenRouter's embeddings API converts text into numerical vector representations that capture semantic meaning. Embeddings transform text into high-dimensional vectors where semantically similar texts are positioned closer together.

## Use Cases

| Use Case | Description |
|----------|-------------|
| **RAG Systems** | Retrieve contextual documents before generating responses |
| **Semantic Search** | Find relevant content by understanding meaning rather than keywords |
| **Recommendation Systems** | Identify similar items based on embedding vectors |
| **Clustering & Classification** | Group documents by topic similarity |
| **Duplicate Detection** | Identify paraphrased or reworded content |
| **Anomaly Detection** | Flag unusual patterns in datasets |

## API Endpoint

```
POST https://openrouter.ai/api/v1/embeddings
```

## Request Format

```json
{
  "model": "openai/text-embedding-3-small",
  "input": ["Your text here", "Another text to embed"]
}
```

## Implementation Examples

### TypeScript

```typescript
const response = await fetch('https://openrouter.ai/api/v1/embeddings', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${OPENROUTER_API_KEY}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'openai/text-embedding-3-small',
    input: ['Hello world', 'How are you?'],
  }),
});

const data = await response.json();
console.log(data.data[0].embedding); // Vector array
```

### Python

```python
import requests

response = requests.post(
    'https://openrouter.ai/api/v1/embeddings',
    headers={
        'Authorization': f'Bearer {OPENROUTER_API_KEY}',
        'Content-Type': 'application/json',
    },
    json={
        'model': 'openai/text-embedding-3-small',
        'input': ['Hello world', 'How are you?'],
    },
)

data = response.json()
print(data['data'][0]['embedding'])  # Vector array
```

### cURL

```bash
curl https://openrouter.ai/api/v1/embeddings \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "openai/text-embedding-3-small",
    "input": ["Hello world", "How are you?"]
  }'
```

## Response Format

```json
{
  "object": "list",
  "data": [
    {
      "object": "embedding",
      "embedding": [0.0023064255, -0.009327292, ...],
      "index": 0
    },
    {
      "object": "embedding",
      "embedding": [-0.0028842222, 0.0045683384, ...],
      "index": 1
    }
  ],
  "model": "openai/text-embedding-3-small",
  "usage": {
    "prompt_tokens": 8,
    "total_tokens": 8
  }
}
```

## Best Practices

1. **Model Selection**: Choose appropriate models based on speed/quality tradeoffs
2. **Batching**: Process multiple texts in one request rather than making multiple calls
3. **Caching**: Cache embedding results to avoid regeneration costs
4. **Similarity Calculation**: Use cosine similarity for vector comparisons
5. **Token Limits**: Check token limits and split long documents accordingly
6. **Chunking Strategy**: Split long documents into meaningful chunks rather than arbitrary segments

## Limitations

- **No Streaming**: Embedding responses do not support streaming
- **Token Limits**: Each model has maximum token length restrictions
- **Deterministic Output**: Embeddings are deterministic with no randomization options

## Cosine Similarity Example

```python
import numpy as np

def cosine_similarity(a, b):
    return np.dot(a, b) / (np.linalg.norm(a) * np.linalg.norm(b))

# Compare two embeddings
similarity = cosine_similarity(embedding1, embedding2)
print(f"Similarity: {similarity}")  # 0.0 to 1.0
```
