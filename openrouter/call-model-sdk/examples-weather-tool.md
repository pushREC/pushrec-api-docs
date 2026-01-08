---
source: https://openrouter.ai/docs/sdks/call-model/examples/weather-tool
scraped: 2026-01-08
---

# Weather Tool Example

## Overview

This guide demonstrates building a weather application integrating external APIs, implementing Zod validation, error handling, and environment configuration with OpenRouter's SDK.

## Setup Requirements

### Installation

```bash
pnpm add @openrouter/sdk zod
```

### Environment Variables

Configure two environment variables:

| Variable | Description | Source |
|----------|-------------|--------|
| `WEATHER_API_KEY` | WeatherAPI authentication | [WeatherAPI free tier](https://www.weatherapi.com/) |
| `OPENROUTER_API_KEY` | OpenRouter authentication | [OpenRouter](https://openrouter.ai/) |

```bash
export WEATHER_API_KEY=your_weather_api_key
export OPENROUTER_API_KEY=your_openrouter_api_key
```

## Basic Weather Tool

The basic weather tool accepts a city name and optional temperature units, then queries WeatherAPI to return comprehensive meteorological data.

```typescript
import { OpenRouter, tool } from '@openrouter/sdk';
import { z } from 'zod';

const openrouter = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
});

const weatherTool = tool({
  name: 'get_weather',
  description: 'Get the current weather for a city',
  inputSchema: z.object({
    city: z.string().describe('The city name to get weather for'),
    units: z.enum(['celsius', 'fahrenheit'])
      .optional()
      .default('celsius')
      .describe('Temperature units'),
  }),
  outputSchema: z.object({
    temperature: z.number().describe('Current temperature'),
    condition: z.string().describe('Weather condition (e.g., sunny, cloudy)'),
    humidity: z.number().describe('Humidity percentage'),
    wind_speed: z.number().describe('Wind speed in km/h'),
    wind_direction: z.string().describe('Wind direction'),
    feels_like: z.number().describe('Feels like temperature'),
  }),
  execute: async ({ params }) => {
    const { city, units } = params;

    const response = await fetch(
      `https://api.weatherapi.com/v1/current.json?key=${process.env.WEATHER_API_KEY}&q=${encodeURIComponent(city)}`
    );

    if (!response.ok) {
      if (response.status === 400) {
        throw new Error(`City not found: ${city}`);
      }
      throw new Error(`Weather API error: ${response.status}`);
    }

    const data = await response.json();
    const current = data.current;

    return {
      temperature: units === 'fahrenheit' ? current.temp_f : current.temp_c,
      condition: current.condition.text,
      humidity: current.humidity,
      wind_speed: current.wind_kph,
      wind_direction: current.wind_dir,
      feels_like: units === 'fahrenheit' ? current.feelslike_f : current.feelslike_c,
    };
  },
});

// Usage
async function main() {
  const result = openrouter.callModel({
    model: 'openai/gpt-4o',
    input: 'What is the weather like in Paris right now?',
    tools: [weatherTool],
  });

  const text = await result.getText();
  console.log(text);
}

main();
```

## Error Handling

The implementation includes proper error handling with specific status code management:

```typescript
const weatherToolWithErrors = tool({
  name: 'get_weather',
  description: 'Get the current weather for a city',
  inputSchema: z.object({
    city: z.string(),
  }),
  outputSchema: z.object({
    temperature: z.number().optional(),
    condition: z.string().optional(),
    error: z.string().optional(),
  }),
  execute: async ({ params }) => {
    try {
      const response = await fetch(
        `https://api.weatherapi.com/v1/current.json?key=${process.env.WEATHER_API_KEY}&q=${encodeURIComponent(params.city)}`
      );

      if (response.status === 400) {
        return { error: `City "${params.city}" not found. Please check the spelling.` };
      }

      if (!response.ok) {
        return { error: `Weather service unavailable (${response.status})` };
      }

      const data = await response.json();
      return {
        temperature: data.current.temp_c,
        condition: data.current.condition.text,
      };
    } catch (error) {
      return { error: `Failed to fetch weather: ${error.message}` };
    }
  },
});
```

## Multi-City Comparisons

The model automatically invokes the tool multiple times for different locations:

```typescript
async function compareWeather() {
  const result = openrouter.callModel({
    model: 'openai/gpt-4o',
    input: 'Compare the weather in Paris, London, and Tokyo. Which city is warmest?',
    tools: [weatherTool],
  });

  // The model will call the weather tool 3 times
  for await (const toolCall of result.getToolCallsStream()) {
    console.log(`Weather for ${toolCall.arguments.city}:`, toolCall.result);
  }

  const text = await result.getText();
  console.log('\nComparison:', text);
}
```

## Forecast Extension

A separate tool retrieves multi-day predictions:

```typescript
const forecastTool = tool({
  name: 'get_forecast',
  description: 'Get weather forecast for upcoming days',
  inputSchema: z.object({
    city: z.string().describe('City name'),
    days: z.number()
      .min(1)
      .max(7)
      .default(3)
      .describe('Number of days to forecast (1-7)'),
  }),
  outputSchema: z.object({
    location: z.string(),
    forecasts: z.array(z.object({
      date: z.string(),
      max_temp: z.number(),
      min_temp: z.number(),
      condition: z.string(),
      precipitation_chance: z.number(),
    })),
  }),
  execute: async ({ params }) => {
    const { city, days } = params;

    const response = await fetch(
      `https://api.weatherapi.com/v1/forecast.json?key=${process.env.WEATHER_API_KEY}&q=${encodeURIComponent(city)}&days=${days}`
    );

    if (!response.ok) {
      throw new Error(`Forecast API error: ${response.status}`);
    }

    const data = await response.json();

    return {
      location: data.location.name,
      forecasts: data.forecast.forecastday.map((day: any) => ({
        date: day.date,
        max_temp: day.day.maxtemp_c,
        min_temp: day.day.mintemp_c,
        condition: day.day.condition.text,
        precipitation_chance: day.day.daily_chance_of_rain,
      })),
    };
  },
});

// Usage
async function getForecast() {
  const result = openrouter.callModel({
    model: 'openai/gpt-4o',
    input: 'What will the weather be like in New York for the next 5 days?',
    tools: [forecastTool],
  });

  const text = await result.getText();
  console.log(text);
}
```

## Retry Logic with Exponential Backoff

Enhanced error handling with retry logic for rate-limited requests (HTTP 429):

```typescript
async function fetchWithRetry(
  url: string,
  maxRetries: number = 3,
  baseDelay: number = 1000
): Promise<Response> {
  let lastError: Error;

  for (let attempt = 0; attempt < maxRetries; attempt++) {
    try {
      const response = await fetch(url);

      if (response.status === 429) {
        const delay = baseDelay * Math.pow(2, attempt);
        console.log(`Rate limited, retrying in ${delay}ms...`);
        await new Promise(resolve => setTimeout(resolve, delay));
        continue;
      }

      return response;
    } catch (error) {
      lastError = error as Error;
      const delay = baseDelay * Math.pow(2, attempt);
      await new Promise(resolve => setTimeout(resolve, delay));
    }
  }

  throw lastError!;
}

const robustWeatherTool = tool({
  name: 'get_weather',
  description: 'Get weather with automatic retry on rate limits',
  inputSchema: z.object({
    city: z.string(),
  }),
  outputSchema: z.object({
    temperature: z.number(),
    condition: z.string(),
  }),
  execute: async ({ params }) => {
    const response = await fetchWithRetry(
      `https://api.weatherapi.com/v1/current.json?key=${process.env.WEATHER_API_KEY}&q=${encodeURIComponent(params.city)}`
    );

    if (!response.ok) {
      throw new Error(`Weather API error: ${response.status}`);
    }

    const data = await response.json();
    return {
      temperature: data.current.temp_c,
      condition: data.current.condition.text,
    };
  },
});
```

## Testing

Test examples using Bun's testing framework with mocked fetch responses:

```typescript
import { describe, it, expect, mock } from 'bun:test';

describe('Weather Tool', () => {
  it('should return weather data for valid city', async () => {
    const mockResponse = {
      current: {
        temp_c: 20,
        condition: { text: 'Sunny' },
        humidity: 45,
        wind_kph: 15,
        wind_dir: 'NW',
        feelslike_c: 19,
      },
    };

    global.fetch = mock(() =>
      Promise.resolve({
        ok: true,
        json: () => Promise.resolve(mockResponse),
      } as Response)
    );

    const result = await weatherTool.execute({
      params: { city: 'Paris', units: 'celsius' },
      context: {} as any,
    });

    expect(result.temperature).toBe(20);
    expect(result.condition).toBe('Sunny');
  });

  it('should handle invalid city', async () => {
    global.fetch = mock(() =>
      Promise.resolve({
        ok: false,
        status: 400,
      } as Response)
    );

    await expect(
      weatherTool.execute({
        params: { city: 'InvalidCityXYZ', units: 'celsius' },
        context: {} as any,
      })
    ).rejects.toThrow('City not found');
  });
});
```

## Complete Example

```typescript
import { OpenRouter, tool, stepCountIs } from '@openrouter/sdk';
import { z } from 'zod';

const openrouter = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
});

const weatherTool = tool({
  name: 'get_weather',
  description: 'Get current weather for a city',
  inputSchema: z.object({
    city: z.string().describe('City name'),
    units: z.enum(['celsius', 'fahrenheit']).optional().default('celsius'),
  }),
  outputSchema: z.object({
    temperature: z.number(),
    condition: z.string(),
    humidity: z.number(),
  }),
  execute: async ({ params }) => {
    const response = await fetch(
      `https://api.weatherapi.com/v1/current.json?key=${process.env.WEATHER_API_KEY}&q=${encodeURIComponent(params.city)}`
    );

    if (!response.ok) {
      throw new Error(`Weather API error: ${response.status}`);
    }

    const data = await response.json();
    return {
      temperature: params.units === 'fahrenheit'
        ? data.current.temp_f
        : data.current.temp_c,
      condition: data.current.condition.text,
      humidity: data.current.humidity,
    };
  },
});

const forecastTool = tool({
  name: 'get_forecast',
  description: 'Get multi-day weather forecast',
  inputSchema: z.object({
    city: z.string(),
    days: z.number().min(1).max(7).default(3),
  }),
  outputSchema: z.object({
    forecasts: z.array(z.object({
      date: z.string(),
      max_temp: z.number(),
      min_temp: z.number(),
      condition: z.string(),
    })),
  }),
  execute: async ({ params }) => {
    const response = await fetch(
      `https://api.weatherapi.com/v1/forecast.json?key=${process.env.WEATHER_API_KEY}&q=${encodeURIComponent(params.city)}&days=${params.days}`
    );

    if (!response.ok) {
      throw new Error(`Forecast API error: ${response.status}`);
    }

    const data = await response.json();
    return {
      forecasts: data.forecast.forecastday.map((day: any) => ({
        date: day.date,
        max_temp: day.day.maxtemp_c,
        min_temp: day.day.mintemp_c,
        condition: day.day.condition.text,
      })),
    };
  },
});

async function main() {
  const result = openrouter.callModel({
    model: 'openai/gpt-4o',
    input: 'I am planning a trip to Barcelona next week. What is the current weather and the 5-day forecast?',
    tools: [weatherTool, forecastTool],
    stopWhen: stepCountIs(5),
  });

  for await (const toolCall of result.getToolCallsStream()) {
    console.log(`[${toolCall.name}]`, JSON.stringify(toolCall.result, null, 2));
  }

  const text = await result.getText();
  console.log('\n', text);
}

main();
```

## Related Resources

- [Tools Guide](./tools.md) - Complete tools documentation
- [API Reference](./api-reference.md) - Full API documentation
