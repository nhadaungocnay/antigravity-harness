---
name: harness
description: "Builds a harness. A meta-skill that defines Personas (Knowledge Items) and generates the skills they will use. Use this when (1) requested to 'build a harness', (2) 'design an architecture', (3) building an automated system for a new domain/project, (4) expanding an existing harness, (5) requested to 'audit harness' or 'sync agents'."
---

# Harness — Architecture & Skill Generator

A meta-skill that configures a harness for a domain/project, defines the Persona roles (as Knowledge Items), and creates the skills those Personas will use.

**Core Principles:**
1. Generates Persona Knowledge Items (`.agent/knowledge/`) and Skills (`.agent/skills/`).
2. **Hybrid Execution Architecture is the default.** 
   - Uses **Single-Agent Role Switching** (sequentially adopting Personas) for sequential tasks.
   - Uses **Subagent Spawning** (acting as a Supervisor) only for highly parallel tasks.
3. **Registers pointers in `GEMINI.md` and coordinates via `task.md`.**
4. **The Harness is not static; it evolves.** — Reflect user feedback after execution by updating KIs, skills, and the `task.md`.

## Workflow

### Phase 0: State Audit

When the harness skill is triggered, first check the existing harness state.

1. Read `.agent/knowledge/`, `.agent/skills/`, and `task.md`/`GEMINI.md`.
2. Branch execution mode based on the state:
   - **New Setup**: No directories exist or they are empty → Run from Phase 1.
   - **Expansion**: Existing harness needs new Personas/skills → Selectively run phases to add without destroying existing context.
   - **Maintenance**: Audit or sync existing harness.

### Phase 1: Domain Analysis

1. Understand the domain/project from the user's request.
2. Identify core task types (generation, review, edit, analysis, etc.).
3. Analyze project codebase — tech stack, data models, core modules.
4. **Detect user proficiency** — Adjust communication tone based on context clues (e.g., don't use terms like "JSON schema" without explanation for beginners).

### Phase 2: Architecture Design (Hybrid Approach)

#### 2-1. Select Execution Mode

**Single-Agent Role Switching is the primary default.** 

| Mode | When to use | Characteristics |
|------|-------------|-----------------|
| **Single-Agent Role Switching** (Default) | Sequential dependent tasks (Pipeline, Producer-Reviewer). Context is shared inherently because it's the same agent switching Personas. | Generates a detailed `task.md` orchestrating when to load which `.agent/knowledge/` Persona. |
| **Explicit Subagents** (Alternative) | Parallel independent tasks (Fan-out/Fan-in) where subagents can run asynchronously without sharing intermediate state. | The Main Agent acts as a Supervisor and uses subagent tools to delegate. |

#### 2-2. Select Architecture Pattern

1. Decompose the task into specialized domains.
2. Choose a team structure:
   - **Pipeline**: Sequential dependent tasks (Role Switching).
   - **Fan-out/Fan-in**: Parallel independent tasks (Subagents).
   - **Expert Pool**: Context-dependent selective invocation (Role Switching).
   - **Producer-Reviewer**: Generation followed by quality review (Role Switching).
   - **Supervisor**: Central agent with dynamic task distribution (Subagents).
   - **Hierarchical Delegation**: Top-down recursive delegation.

### Phase 3: Persona Knowledge Generation

#### 3-0. Duplicate Check

Before creating a new Persona, check existing files in `.agent/knowledge/` to prevent overlap.

#### 3-1. Generate Persona Definitions

**Every Persona MUST be defined as a Knowledge Item in `.agent/knowledge/{name}_persona.md`.**
Do not hardcode roles directly into prompts.

Include essential sections in each Persona file:
- Core Role
- Working Principles
- Input/Output Protocols
- Error Handling
- Handoff instructions for the next Persona in the sequence.

### Phase 4: Skill Generation

Create custom skills in `.agent/skills/{name}/SKILL.md`.

#### 4-1. Skill Structure

```
skill-name/
├── SKILL.md (Required)
│   ├── YAML frontmatter (name, description)
│   └── Markdown body
└── Bundled Resources (Optional)
    ├── scripts/    - Deterministic executable scripts
    └── references/ - Conditionally loaded docs
```

#### 4-2. Description Writing — Be "Pushy"

The description is the sole trigger mechanism. Write it aggressively so it triggers when needed.

**Bad:** `"Skill for processing PDF docs"`
**Good:** `"Performs all PDF operations including reading, text extraction, merging, rotating, and OCR. If the user mentions a .pdf file or requests a PDF output, YOU MUST USE THIS SKILL."`

#### 4-3. Body Writing Principles

- **Explain Why:** Instead of just "ALWAYS/NEVER", explain the reasoning.
- **Keep it Lean:** Aim for <500 lines. Use `references/` for extra weight.
- **Generalize:** Don't overfit to specific examples.
- **Use Imperative Tone:** Use commands ("Do this", "Run that").

### Phase 5: Artifact Integration (task.md & GEMINI.md)

Unlike older systems, Antigravity orchestrates work via **Artifacts**. You must generate a `task.md` that serves as the state machine.

#### 5-1. Generate `task.md`

Create an `implementation_plan.md` first for approval, then a `task.md` outlining the exact sequence of steps.
If using **Single-Agent Role Switching**, the `task.md` should have explicit checkboxes instructing the agent:
```markdown
- [ ] Phase 1: Load `.agent/knowledge/analyst_persona.md` and perform domain analysis.
- [ ] Phase 2: Load `.agent/knowledge/builder_persona.md` and write the code based on Phase 1 output.
```

#### 5-2. Register Pointers in `GEMINI.md`

Update `GEMINI.md` (or the core KI) with a minimal pointer so the system knows this harness exists in future sessions.

```markdown
## Harness: {Domain Name}
**Goal:** {One line description}
**Trigger:** Use the `{orchestrator-skill-name}` when handling {Domain} tasks.
```

### Phase 6: Validation & Testing

Validate the generated harness.

1. **Structure Check**: Ensure all `.agent/knowledge/` and `.agent/skills/` files exist.
2. **Execution Mode Check**: Verify the `task.md` correctly outlines the Persona switching or subagent spawning.
3. **Dry-Run**: Review the `task.md` to ensure data passes logically from one phase to the next (e.g., files saved in `_workspace/` by the Producer are read by the Reviewer).

### Phase 7: Harness Evolution

After execution, always ask the user for feedback.
If the Reviewer Persona consistently finds the same flaws, update the Producer Persona's Knowledge Item to prevent them.
Log all changes in the `GEMINI.md` changelog.

## Deliverable Checklist

- [ ] `.agent/knowledge/` — Persona definition files created.
- [ ] `.agent/skills/` — Custom skills generated.
- [ ] `task.md` — The execution state machine is generated.
- [ ] Execution mode (Role Switching vs Subagents) is explicitly documented in `task.md`.
- [ ] Duplicates in knowledge and skills checked before generation.
- [ ] `GEMINI.md` updated with harness pointers and changelog.
