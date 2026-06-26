# Workflow Enforcement Rules

MANDATORY RULES - MUST FOLLOW

## Critical Rule 1: Read Skill Before Execution

When user types /command (slash command):
1. READ the skill file FIRST (`skills/{command}/SKILL.md`)
2. Follow ALL steps in the skill
3. NEVER skip steps
4. NEVER proceed without user approval at gates

## Critical Rule 2: Mandatory Gates

Every skill has MANDATORY GATES. Gates MUST be completed:

```
GATE RULES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

GATE 1: QUESTION GATE
- All "ASK USER" questions MUST be asked
- Wait for user response
- NEVER assume or guess

GATE 2: DRAFT GATE
- Show draft/output to user
- Wait for approval
- NEVER write without approval

GATE 3: APPROVAL GATE
- If user says "no" or "change"
- MUST make changes
- Show again for approval
- NEVER ignore feedback

GATE 4: OUTPUT GATE
- Save output to correct location
- Confirm save
- Update session state
```

## Critical Rule 3: Workflow Sequence

Follow the exact workflow sequence:

```
WORKFLOW SEQUENCE:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

FOR NEW PROJECT:
1. /start (onboarding)
2. /brainstorm (ideation)
3. /create-prd (requirements)
4. /project-planning (team, infra, budget)
5. /choose-stack → /choose-frontend → /choose-messaging
6. /create-architecture → /api-design
7. /create-epics → /user-stories
8. /sprint-plan → /sprint-orchestrator

FOR EXISTING SPRINT:
1. /start-day (resume)
2. Check sprint status
3. Continue or replan

NEVER skip steps in the sequence.
```

## Critical Rule 4: Dispatch to Agents

When skill requires specialist:
1. Check dispatch matrix
2. Load agent definition
3. Follow agent code standards
4. NEVER implement without agent context

```
DISPATCH RULES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

IF skill has "## Agents to Dispatch":
  - Load agent from agents/{agent-name}.md
  - Follow agent's System Prompt
  - Follow agent's Code Standards
  - NEVER implement without agent context

IF skill has "## Quality Checklist":
  - Complete ALL checklist items
  - NEVER mark done without verification
```

## Critical Rule 5: State Management

After EVERY skill execution:
1. Update production/session-state/active.md
2. Update production/sprint/state.json (if sprint active)
3. Update story state (if story in progress)

```
STATE RULES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

AFTER EVERY ACTION:
  - Update session state
  - Save progress
  - Log decision

BEFORE NEXT ACTION:
  - Load current state
  - Verify state is correct
  - Continue from last saved point
```

## Critical Rule 6: Error Handling

If something fails:
1. STOP immediately
2. Report error to user
3. Ask for guidance
4. NEVER proceed with errors

```
ERROR RULES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

IF test fails → STOP, report, ask for guidance
IF lint fails → STOP, fix, re-test
IF type fails → STOP, fix, re-test
IF review fails → STOP, fix, re-review
IF gate fails → STOP, fix, re-run gate

NEVER skip failing gates.
```

## Enforcement Checklist

Before responding to any slash command:

- [ ] Skill file read?
- [ ] All questions asked?
- [ ] Draft shown to user?
- [ ] User approval received?
- [ ] Agent dispatched (if needed)?
- [ ] Quality checklist completed?
- [ ] State updated?
- [ ] Output saved?

If ANY item is missing → STOP and complete it.
