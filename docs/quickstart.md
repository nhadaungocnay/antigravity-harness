# Quickstart — 5 Minutes to Your First Harness

> **Time budget: 5 minutes (strict).** If you are not at Step 4 within 5 minutes, stop and file an issue — that is a bug in this document, not a bug in you.

**What you will have at the end:** a working `.agent/knowledge/` directory with 3–5 domain-specialized agents, generated from a single-sentence prompt, ready to run on a sample task.

**Prerequisites (check before starting):**
- Antigravity installed on your system.
- A terminal or IDE where Antigravity is active.

---

## Step 1 — Install the Harness plugin (60 seconds)

```bash
agy install harness
```

**What this does:** Installs the `harness` meta-skill into your Antigravity environment.

---

## Step 2 — Generate a harness from one sentence (2 minutes)

```bash
/harness build a harness for a fintech risk-assessment team
```

**What this does:** Invokes the `/harness` meta-skill, which analyzes your domain sentence and scaffolds a team of specialized Personas (Agents) + their skills into `.agent/knowledge/` and `.agent/skills/` in the current directory.

**Try these alternate prompts** — any of them work:
- `/harness 하네스 구성해줘 — 핀테크 리스크 평가 팀` (Korean also works)
- `/harness build a harness for an e-commerce fraud-detection workflow`
- `/harness design an agent team for technical due diligence on open-source repos`

**Expected output:** A streaming plan, then confirmation that 3–5 agent `.md` files and their skills were written.

---

## Step 3 — Verify the generated files (30 seconds)

```bash
ls -la .agent/knowledge/
ls -la .agent/skills/
```

**What this does:** Confirms the meta-skill wrote files to the expected locations.

**Expected output:** 3–5 files per directory, with names reflecting your domain (e.g., `risk_analyst_persona.md`, `compliance_reviewer_persona.md` for the fintech example).

---

## Step 4 — Run a sample task against the new team (90 seconds)

Ask Antigravity to act on the new personas:

```text
Ticket FIN-427: A new corporate customer (mid-cap manufacturer, $80M revenue, South Korea) has applied for a $5M working-capital line. Produce a risk assessment covering (1) credit-history red flags, (2) sector concentration vs. our existing book, (3) regulatory exposure (KFTC, FSC). Output: a 1-page memo with a go/no-go recommendation.
```

**What this does:** Antigravity detects the new Personas in `.agent/knowledge/`, routes the task through the team patterns harness generated, and returns a structured memo.

---

## You're done

At this point you should have:

- [x] A `.agent/knowledge/` directory with domain-specialized agents
- [x] A `.agent/skills/` directory with their supporting skills
- [x] One successful sample-task execution

**If you hit something this guide didn't cover:** open an issue with the `quickstart-gap` label and include: (a) which step failed, (b) the exact error message. The SLA for quickstart-gap issues is **48 hours** to first response (see `CONTRIBUTING.md`).
