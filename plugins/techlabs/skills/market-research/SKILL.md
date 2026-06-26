# market-research

Conduct market research to understand market size, trends, and opportunities.

## When to Use
- New project kickoff
- Market analysis needed
- Investment decision
- Strategy planning

## Agents to Dispatch
- business-analyst: Market analysis
- product-manager: Market fit
- financial-analyst: Market size

## Enforcement

```
⚠️ MANDATORY: Market research required for new projects

MARKET RESEARCH ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

MUST INCLUDE:
1. Market Size (TAM/SAM/SOM)
2. Market Trends
3. Growth Projections
4. Customer Segments
5. Buying Behavior
6. Distribution Channels
7. Pricing Models
8. Regulatory Environment

TOOL CALLS:
- Search industry reports
- Search market data
- Search competitor analysis
- Search customer data
```

## Execution

### Step 1: Define Market Scope
```
ASK USER:

1. MARKET DEFINITION
   - What market are we entering?
   - What's the product category?
   - What's the target geography?
   - What's the target industry?

2. CUSTOMER SEGMENTS
   - B2B or B2C?
   - What company size?
   - What industry?
   - What budget?

3. COMPETITIVE LANDSCAPE
   - Who are the competitors?
   - What's the market share?
   - What's the pricing?
   - What's the differentiation?
```

### Step 2: Conduct Research
```
TOOL CALLS:

1. MARKET SIZE
   - Search: "{market} market size 2024"
   - Search: "{market} TAM SAM SOM"
   - Search: "{market} market forecast"

2. MARKET TRENDS
   - Search: "{market} trends 2024"
   - Search: "{market} growth drivers"
   - Search: "{market} challenges"

3. COMPETITORS
   - Search: "{market} competitors"
   - Search: "{market} market share"
   - Search: "{competitor} revenue"

4. CUSTOMERS
   - Search: "{market} customer segments"
   - Search: "{market} buying behavior"
   - Search: "{market} pain points"

5. PRICING
   - Search: "{market} pricing models"
   - Search: "{market} pricing strategy"
   - Search: "{competitor} pricing"
```

### Step 3: Analyze Data
```javascript
async function analyzeMarketData(researchData) {
  const analysis = {
    marketSize: {
      tam: calculateTAM(researchData),
      sam: calculateSAM(researchData),
      som: calculateSOM(researchData)
    },
    trends: identifyTrends(researchData),
    growth: calculateGrowth(researchData),
    segments: identifySegments(researchData),
    competitors: analyzeCompetitors(researchData),
    opportunities: identifyOpportunities(researchData),
    threats: identifyThreats(researchData)
  };
  
  return analysis;
}

function calculateTAM(data) {
  // Total Addressable Market
  return {
    value: data.totalMarketSize,
    source: data.source,
    year: data.year
  };
}

function calculateSAM(data) {
  // Serviceable Addressable Market
  return {
    value: data.serviceableMarketSize,
    source: data.source,
    year: data.year
  };
}

function calculateSOM(data) {
  // Serviceable Obtainable Market
  return {
    value: data.obtainableMarketSize,
    source: data.source,
    year: data.year
  };
}
```

### Step 4: Create Market Research Document
```markdown
# Market Research Report

## Executive Summary
{brief summary of market opportunity}

## Market Size

### TAM (Total Addressable Market)
- Value: ${amount}
- Source: {source}
- Year: {year}

### SAM (Serviceable Addressable Market)
- Value: ${amount}
- Source: {source}
- Year: {year}

### SOM (Serviceable Obtainable Market)
- Value: ${amount}
- Source: {source}
- Year: {year}

## Market Trends

### Trend 1: {name}
- Description: {description}
- Impact: {High/Medium/Low}
- Timeline: {timeline}

### Trend 2: {name}
- Description: {description}
- Impact: {High/Medium/Low}
- Timeline: {timeline}

## Growth Projections

### Historical Growth
| Year | Market Size | Growth Rate |
|------|-------------|-------------|
| 2022 | ${amount} | {rate}% |
| 2023 | ${amount} | {rate}% |
| 2024 | ${amount} | {rate}% |

### Forecast
| Year | Projected Size | Growth Rate |
|------|----------------|-------------|
| 2025 | ${amount} | {rate}% |
| 2026 | ${amount} | {rate}% |
| 2027 | ${amount} | {rate}% |

## Customer Segments

### Segment 1: {name}
- Size: {number}
- Characteristics: {description}
- Needs: {needs}
- Willingness to Pay: ${amount}

### Segment 2: {name}
- Size: {number}
- Characteristics: {description}
- Needs: {needs}
- Willingness to Pay: ${amount}

## Competitive Landscape

### Competitor 1: {name}
- Market Share: {percentage}
- Strengths: {strengths}
- Weaknesses: {weaknesses}
- Pricing: ${amount}

### Competitor 2: {name}
- Market Share: {percentage}
- Strengths: {strengths}
- Weaknesses: {weaknesses}
- Pricing: ${amount}

## Opportunities

### Opportunity 1: {name}
- Description: {description}
- Impact: {High/Medium/Low}
- Probability: {High/Medium/Low}
- Timeline: {timeline}

### Opportunity 2: {name}
- Description: {description}
- Impact: {High/Medium/Low}
- Probability: {High/Medium/Low}
- Timeline: {timeline}

## Threats

### Threat 1: {name}
- Description: {description}
- Impact: {High/Medium/Low}
- Probability: {High/Medium/Low}
- Mitigation: {mitigation}

### Threat 2: {name}
- Description: {description}
- Impact: {High/Medium/Low}
- Probability: {High/Medium/Low}
- Mitigation: {mitigation}

## Pricing Models

### Model 1: {name}
- Description: {description}
- Pros: {pros}
- Cons: {cons}
- Recommendation: {yes/no}

### Model 2: {name}
- Description: {description}
- Pros: {pros}
- Cons: {cons}
- Recommendation: {yes/no}

## Recommendations

### Recommendation 1: {name}
- Action: {action}
- Rationale: {rationale}
- Timeline: {timeline}

### Recommendation 2: {name}
- Action: {action}
- Rationale: {rationale}
- Timeline: {timeline}
```

### Step 5: Multi-Agent Review
```
REVIEW WITH:

BUSINESS-ANALYST:
- "Market size is accurate"
- "Trends are identified"
- "Segments are defined"

PRODUCT-MANAGER:
- "Market fit is clear"
- "Opportunities are valid"
- "Threats are mitigated"

FINANCIAL-ANALYST:
- "Projections are realistic"
- "Pricing is optimal"
- "ROI is achievable"

ALL MUST AGREE
```

### Step 6: Save & Validate
```
SAVE TO:
- docs/market-research.md

VALIDATE:
- Market size defined?
- Trends identified?
- Competitors analyzed?
- Opportunities clear?
- Threats mitigated?

IF VALID:
- Mark as APPROVED
- Proceed to project planning
```

## Output
- Market research completed
- Market size calculated
- Trends identified
- Competitors analyzed
- Opportunities validated
- Ready for business planning
