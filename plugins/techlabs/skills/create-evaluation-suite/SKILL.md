# create-evaluation-suite

Build evaluation suite for LLM, ML models, or feature quality.

## When to Use
- LLM quality assessment
- ML model evaluation
- Feature regression testing

## Execution

### Step 1: Define Evaluation Criteria
```typescript
interface TestCase {
  id: string;
  input: string;
  expected: string;
  category: string;
  weight: number;
}

const evaluationSuite: TestCase[] = [
  {
    id: "fact-check-1",
    input: "What is the capital of France?",
    expected: "Paris",
    category: "factual",
    weight: 1.0,
  },
  {
    id: "reasoning-1",
    input: "If all cats are animals and all animals need food, do cats need food?",
    expected: "Yes, cats need food.",
    category: "reasoning",
    weight: 1.5,
  },
];
```

### Step 2: Run Evaluation
```typescript
async function evaluate(llm: LLM, testCases: TestCase[]) {
  const results = [];

  for (const test of testCases) {
    const response = await llm.chat(test.input);
    const score = calculateSimilarity(response, test.expected);
    results.push({ ...test, score, response });
  }

  return {
    overall: results.reduce((sum, r) => sum + r.score * r.weight, 0) /
             results.reduce((sum, r) => sum + r.weight, 0),
    byCategory: groupByCategory(results),
    failures: results.filter(r => r.score < 0.8),
  };
}
```

### Step 3: Generate Report
```
EVALUATION RESULTS

Overall Score: 87.5%

By Category:
- Factual: 92%
- Reasoning: 85%
- Creative: 78%

Failures (3):
1. Factual: Response mentioned incorrect date
2. Reasoning: Failed on multi-step logic
3. Creative: Response was too generic
```

## Output
- Test case definitions
- Evaluation framework
- Results report
- Improvement recommendations
