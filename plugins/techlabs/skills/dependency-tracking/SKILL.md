# dependency-tracking

Track cross-story dependencies during sprint.

## When to Use
- Story has dependencies
- Cross-team coordination needed
- Blocked by other stories
- Complex sprint planning

## Agents to Dispatch
- lead-engineer: Dependency management
- All agents: Report dependencies

## Enforcement

```
⚠️ MANDATORY: Dependencies must be tracked

DEPENDENCY TRACKING ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

MUST IDENTIFY:
1. Story dependencies
2. Team dependencies
3. External dependencies
4. Technical dependencies

MUST TRACK:
1. Dependency status
2. Dependency impact
3. Dependency resolution
4. Dependency blockers

MUST RESOLVE:
1. Blocked dependencies
2. Circular dependencies
3. Missing dependencies
4. Conflicting dependencies
```

## Execution

### Step 1: Identify Dependencies
```
FOR EACH STORY IN SPRINT:

1. CHECK IF STORY HAS DEPENDENCIES
   - Depends on other stories?
   - Depends on other teams?
   - Depends on external systems?
   - Depends on technical components?

2. DOCUMENT DEPENDENCIES
   - Dependency type
   - Dependency description
   - Dependency status
   - Dependency impact

3. CREATE DEPENDENCY GRAPH
   - Visualize dependencies
   - Identify critical path
   - Identify bottlenecks
```

### Step 2: Create Dependency Map
```javascript
async function createDependencyMap(stories) {
  const dependencies = {};
  
  for (const story of stories) {
    dependencies[story.id] = {
      story: story,
      dependencies: [],
      dependents: [],
      status: 'pending'
    };
  }
  
  // Map dependencies
  for (const story of stories) {
    if (story.dependencies) {
      for (const depId of story.dependencies) {
        dependencies[story.id].dependencies.push(depId);
        dependencies[depId].dependents.push(story.id);
      }
    }
  }
  
  // Identify critical path
  const criticalPath = findCriticalPath(dependencies);
  
  // Identify bottlenecks
  const bottlenecks = findBottlenecks(dependencies);
  
  return { dependencies, criticalPath, bottlenecks };
}

function findCriticalPath(dependencies) {
  // Find longest path through dependency graph
  const paths = [];
  
  for (const id of Object.keys(dependencies)) {
    const path = tracePath(id, dependencies);
    if (path.length > 0) {
      paths.push(path);
    }
  }
  
  return paths.reduce((a, b) => a.length > b.length ? a : b, []);
}

function findBottlenecks(dependencies) {
  // Find nodes with most dependents
  const bottlenecks = [];
  
  for (const id of Object.keys(dependencies)) {
    if (dependencies[id].dependents.length > 2) {
      bottlenecks.push({
        id,
        dependents: dependencies[id].dependents.length
      });
    }
  }
  
  return bottlenecks.sort((a, b) => b.dependents - a.dependents);
}
```

### Step 3: Create Dependency Report
```markdown
# Dependency Report

## Sprint
{sprint_name}

## Date
{date}

## Dependency Summary
- Total Dependencies: {count}
- Resolved: {count}
- Pending: {count}
- Blocked: {count}

## Dependency Graph

```
{story_a} → {story_b} → {story_c}
     ↓
{story_d} → {story_e}
```

## Dependencies

### Story 1: {title}
**Depends On:**
- {story_x} (status: {status})
- {story_y} (status: {status})

**Depended By:**
- {story_z}

**Status:** {pending/resolved/blocked}

### Story 2: {title}
**Depends On:**
- {story_x} (status: {status})

**Depended By:**
- None

**Status:** {pending/resolved/blocked}

## Critical Path
1. {story_1} →
2. {story_2} →
3. {story_3} →
4. {story_4}

## Bottlenecks

### Bottleneck 1: {story}
- Dependents: {count}
- Impact: {High/Medium/Low}
- Action: {what to do}

## Risks

### Risk 1: {description}
- Likelihood: {High/Medium/Low}
- Impact: {High/Medium/Low}
- Mitigation: {what to do}

## Action Items

| Action | Owner | Due | Status |
|--------|-------|-----|--------|
| {action 1} | {owner} | {date} | {status} |
| {action 2} | {owner} | {date} | {status} |
```

### Step 4: Update Sprint State
```
UPDATE:
- production/sprint/{sprint-id}/state.json
  - dependencies: {dependency map}
  - criticalPath: {critical path}
  - bottlenecks: {bottlenecks}

SAVE TO:
- production/sprint/{sprint-id}/dependencies.md
```

### Step 5: Resolve Dependencies
```
WHEN DEPENDENCY RESOLVED:

1. UPDATE STATUS
   - Mark dependency as resolved
   - Update dependent stories
   - Recalculate critical path

2. NOTIFY AFFECTED AGENTS
   - Notify agents with dependent stories
   - Update sprint plan
   - Resume blocked work

3. TRACK RESOLUTION
   - Log resolution time
   - Track resolution quality
   - Update metrics
```

### Step 6: Handle Blocked Dependencies
```
IF DEPENDENCY BLOCKED:

1. IDENTIFY BLOCKER
   - What's blocking?
   - Why is it blocked?
   - How to resolve?

2. ESCALATE IF NEEDED
   - Lead intervention
   - Resource reallocation
   - Scope adjustment

3. TRACK BLOCKER RESOLUTION
   - Daily check
   - Update status
   - Report to team
```

## Output
- Dependencies identified
- Dependency graph created
- Critical path identified
- Bottlenecks identified
- Dependencies tracked
