# SOLEINVICTVS — Operator Guide

Reference document for running the four-agent waterfall fleet.
You are the operator. You are the CEO. The fleet executes. You decide.

---

## How the Fleet Works

```
You → Elena → Colombo → Vitalik → Athena → You (review + merge)
```

Each agent has one job. They take structured input from the previous agent and produce structured output for the next. You are the conveyor belt — you pass outputs between agents and make the final call.

---

## The Four Agents

| Agent | Job | Input | Output |
|-------|-----|-------|--------|
| **Elena** | Translates your request into a task plan | Your words (any format) | JSON task plan |
| **Colombo** | Designs the technical solution | Elena's JSON | JSON blueprint |
| **Vitalik** | Writes the actual code | Colombo's JSON | JSON build report + full code |
| **Athena** | Tests and verifies the build | Vitalik's JSON | JSON verdict (PASS / FAIL / CONDITIONAL PASS) |

---

## Session Workflow (Antigravity / IDX)

### Starting a Session
Ask the AI to read the four soul files from the project:
```
Read the four agent soul files in the agents/ folder:
ELENA.md, COLOMBO.md, VITALIK.md, ATHENA.md
Confirm you have read all four and state the current site state,
next Plan ID, next Blueprint ID, and the E-007 backlog.
```

### Activating Each Agent
Explicitly tell the AI which agent it is at each stage. Never assume it switched roles automatically.
```
You are now ELENA.
You are now COLOMBO.
You are now VITALIK.
You are now ATHENA.
```

### Closing a Session (after PASS verdict)
```
The build is approved. Update all four MD files in agents/ with
this cycle's changes, and save the JSON outputs to
agents/blueprints/[PLAN-ID].json and agents/blueprints/[BLUEPRINT-ID].json.
```

---

## Key Rules

**1. No freelancing.** Each agent does only their job. Elena doesn't code. Vitalik doesn't redesign. Athena doesn't rewrite code.

**2. Acceptance criteria flow downstream.** Elena defines what "done" looks like. Colombo carries it forward. Vitalik builds to it. Athena tests against it. The chain must not break.

**3. Full code only (Vitalik).** No pseudocode, no placeholders, no "TODO: implement later". Complete, runnable files.

**4. Real tests only (Athena).** Runnable test code and valid GitHub Actions YAML. Not descriptions.

**5. Ask don't assume.** Every agent has a clarification_request schema. If something is unclear, it asks before proceeding.

**6. Update the MD files after every PASS.** This is how the fleet remembers what was built. Skip this and the next session starts blind.

---

## Handling Failures

If Athena returns **FAIL**, read the `failure_detail` carefully. Decide where the problem lives:

- **Code-level issue** → Send failure JSON back to Vitalik to fix
- **Design-level issue** → Send back to Colombo with Athena's recommendations
- **Requirements-level issue** → Go back to Elena and redefine the task

---

## Elena's Decorator System

Before Elena outputs her JSON plan, she may prepend decorator blocks. Pay attention to them:

| Decorator | What it means | What you do |
|-----------|---------------|-------------|
| `[QUESTION]` | Something is ambiguous — Elena needs an answer before she can plan | Answer the question. She waits. |
| `[ASSUMPTION]` | Elena made a judgment call | Check it. Correct her if wrong. |
| `[ENHANCEMENT]` | Elena sees a better version of what you asked | Accept or override. |
| `[CHALLENGE]` | Elena thinks your request is risky or will create debt | Read it. Decide consciously. |
| `[BLOCKER]` | Something must be resolved before this plan can run | Resolve the blocker first. |
| `[CONTEXT]` | Relevant project state you may not be aware of | Just read it. |

---

## Prompts Reference

### Verify the model understood the fleet (use at session start if unsure)

> "Walk me back through the waterfall flow."

> "If I give you Elena's prompt and a vague request, what do you do?"

> "If you are Vitalik and Colombo's spec is missing a file path, what do you do?"

> "What do you never do as Elena? As Vitalik? As Athena?"

### Mid-session role switch

> "Elena has completed her output above. You are now Colombo. Receive her task plan and produce your blueprint."

### Handling a FAIL

> "Athena gave a FAIL verdict. Here is the failure detail. You are now Vitalik. Fix the issues listed and output a new build report."

### Scope change mid-chain

> "I want to change the acceptance criteria. Here is the updated requirement: [X]. Carry this forward from here."

---

## Tips

- **The cleaner your input to Elena, the cleaner the entire chain.** If you give Elena garbage, every downstream agent gets degraded input.
- **Answer clarification requests fully.** Half-answers cascade into half-built code.
- **Start small on a new session** — one feature end-to-end before batching multiple tasks.
- **If outputs drift from JSON format**, re-state the agent's role and remind it of the output schema.
- **If Vitalik truncates code**, ask him to continue from where he stopped rather than regenerating from scratch.

---

## ID Traceability

Every output traces back through the chain. Preserve it:

```
Elena:   plan_id    E-007        task_id     E-007-01
Colombo: blueprint  C-016        spec_id     C-016-A     source_task:  E-007-01
Vitalik: build_id   V-011        source_spec C-016-A
Athena:  test_id    A-005        source_build V-011
```

Blueprints are saved to `agents/blueprints/` after every PASS.

---

## Current IDs (update after each cycle)

| Counter | Current value |
|---------|--------------|
| Next Plan ID | **E-007** |
| Next Blueprint ID | **C-016** |
| Next Athena ID | **A-005** |
