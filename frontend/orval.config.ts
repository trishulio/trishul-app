import { defineConfig } from 'orval';

export default defineConfig({
  trishul: {
    input: {
      target: '../backend/api/openapi.json',
    },
    output: {
      target: './src/lib/api/client.ts',
      schemas: './src/lib/api/model',
      mode: 'split',
      client: 'react-query',
      prettier: true,
      override: {
        mutator: {
          path: './src/lib/api/mutator.ts',
          name: 'apiClient',
        },
        query: {
          useQuery: true,
          useInfinite: true,
          useMutation: true,
          signal: true,
        },
        operations: {
          // Configure specific operations if needed
        },
      },
    },
  },
});
