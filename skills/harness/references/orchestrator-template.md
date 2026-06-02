# Orchestrator Template: task.md

Antigravity uses `task.md` as its orchestration engine. When building a Harness, generate a `task.md` that guides the Main Agent through the execution.

## task.md Template (Single-Agent Role Switching)

```markdown
- `[ ]` **Phase 1: Domain Analysis**
    - **Action:** Load Persona rules from `.agent/knowledge/analyst_persona.md`.
    - **Task:** Analyze the user's initial request.
    - **Output:** Write findings to `_workspace/01_analysis.md`.

- `[ ]` **Phase 2: Architecture Planning**
    - **Action:** Drop previous Persona, load new Persona from `.agent/knowledge/architect_persona.md`.
    - **Task:** Read `_workspace/01_analysis.md` and design the system.
    - **Output:** Write design to `_workspace/02_architecture.md`.

- `[ ]` **Phase 3: Development & Quality Assurance**
    - **Action:** Iterative Producer-Reviewer loop.
    - `[ ]` Developer Persona: Drop previous Persona, load Developer Persona. Read architecture, generate code.
    - `[ ]` QA Persona: Drop previous Persona, load QA Persona. Review code against guidelines.
    - `[ ]` Loop until QA Persona approves.
```

## Error Handling

If a phase fails (e.g., QA rejects), the Agent should:
1. Log the failure reason in `task.md`.
2. Re-load the Producer Persona.
3. Attempt fix.
4. If it fails 3 times, halt and ask the USER for help.

## Context Preservation

Since the Main Agent runs sequentially, it maintains conversational context. However, to keep memory clean, explicitly instruct the Agent to write intermediate artifacts to the `_workspace/` directory and clear unnecessary context before loading the next Persona.
