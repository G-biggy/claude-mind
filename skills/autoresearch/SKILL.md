---
name: autoresearch
description: Self-improvement loop that autonomously optimizes Claude Code skills using binary evals and git-based keep/revert cycles. Inspired by Karpathy's autoresearch pattern. Triggers on "autoresearch [skill]", "self-improve [skill]", "run improvement loop on [skill]", "/autoresearch", "optimize my skill", "loop on [skill]".
---

# Autoresearch — Autonomous Skill Self-Improvement

This skill runs an autonomous optimization loop on any Claude Code skill, using binary assertions as the objective metric and git as the safety net.

**Core principle from Karpathy:** If you have (1) a thing to optimize, (2) a way to measure it objectively, and (3) an automated way to apply changes — you can run an improvement loop indefinitely. That's this skill.

## When This Skill Activates

- "autoresearch [skill-name]"
- "self-improve [skill-name]"
- "run improvement loop on [skill-name]"
- "optimize my skill"
- "loop on [skill]"
- "/autoresearch"

## Before You Start

1. Identify the **target skill** from the user's message
2. Locate it at `~/.claude/skills/[skill-name]/SKILL.md`
3. Locate its eval at `~/.claude/skills/[skill-name]/eval/eval.json`
4. If no eval exists, tell the user: "No eval.json found for [skill-name]. Create one at `~/.claude/skills/[skill-name]/eval/eval.json` using the template at `~/.claude/skills/autoresearch/eval/eval-template.json`."
5. Parse `max_iterations` from the user's message (default: 20)
6. Parse `runs_per_test` from the user's message (default: 5 — must run each prompt multiple times due to LLM output variability)

## The Loop

**CRITICAL: Once you start the loop, do not stop to ask the human anything. Do not pause. Do not ask "should I continue?". The human might be asleep. Run to completion.**

### Setup
```
baseline_score = run_full_eval(skill_path, eval_path, runs_per_test)
log_to_tsv(iteration=0, score=baseline_score, change="baseline", outcome="baseline")
best_score = baseline_score
iteration = 0
```

### Each Iteration
```
iteration += 1

if baseline_score == 1.0:
    log "Perfect score at baseline. Logging success. Done."
    STOP

1. Identify the lowest-scoring assertions from the last eval run
2. Make ONE atomic change to the target SKILL.md that addresses those failures
   - Change must be structural or instructional (not cosmetic)
   - Change must be explainable in one sentence
   - Examples: add a constraint, clarify an instruction, add/remove an example, reorder sections, tighten a rule
3. git add -A && git commit -m "autoresearch iter {iteration}: {one sentence description of change}"
4. new_score = run_full_eval(skill_path, eval_path, runs_per_test)
5. if new_score >= best_score:
     log_to_tsv(iteration, new_score, change_description, "kept")
     best_score = new_score
     if new_score == 1.0: log "Perfect score. Done." and STOP
   else:
     git revert HEAD --no-edit
     log_to_tsv(iteration, new_score, change_description, "reverted")

6. if iteration >= max_iterations:
    log "Max iterations reached. Final score: {best_score}" and STOP
```

## How to Run an Eval

For each test case in eval.json:
1. Read the `prompt` field
2. Invoke the skill's workflow with that prompt (treat it as if the user said it)
3. Capture the output
4. Evaluate each assertion in the `assertions` array as true (1) or false (0)
5. Repeat `runs_per_test` times
6. For each assertion: pass = (sum of passes) / runs_per_test ≥ 0.6 (majority pass threshold)
7. Overall score = (assertions that passed) / (total assertions)

### Assertion Types

| type | how to evaluate |
|------|----------------|
| `contains` | Check if output contains the `value` string (case-insensitive) |
| `not_contains` | Check if output does NOT contain the `value` string |
| `regex` | Check if output matches the `pattern` |
| `word_count_max` | Count words in output; pass if ≤ `value` |
| `word_count_min` | Count words in output; pass if ≥ `value` |
| `line_check` | Evaluate the first or last line: check `line` ("first"/"last") against `check` description |
| `custom` | Evaluate `description` as a binary true/false judgment about the output |

For `custom` assertions: use your best judgment. If the description is "output ends with a call-to-action sentence" — check if it does. True or false. No partial credit.

## TSV Log Format

Write to `~/.claude/skills/[skill-name]/autoresearch-results.tsv`:

```
iteration	timestamp	pass_rate	change_description	outcome
0	2026-03-15T10:00:00Z	0.72	baseline	baseline
1	2026-03-15T10:03:00Z	0.76	added constraint: always include a numbered list	kept
2	2026-03-15T10:06:00Z	0.72	removed word count guidance	reverted
```

Create the file if it doesn't exist. Append if it does.

## What Changes To Make

Good changes (structural, testable, atomic):
- Add a hard constraint: "Never use em-dashes (—)"
- Clarify an instruction: "The first sentence must be standalone, not part of a paragraph"
- Add a required element: "Always include a specific number or statistic"
- Remove an ambiguous instruction that's causing inconsistency
- Reorder sections to change emphasis
- Add a forbidden pattern: "Never start a section with 'In conclusion'"
- Tighten word count guidance: "Keep under 250 words total"
- Add an example of the correct format

Bad changes (avoid):
- Cosmetic rewording with no behavioral effect
- Changes to things that aren't failing in the eval
- Multiple changes bundled together
- Adding subjective guidance ("be more engaging")

## Output Format

After each iteration, print:
```
[Iter 1] Score: 72% → 76% | Change: "added constraint: always include numbered list" | KEPT
[Iter 2] Score: 76% → 72% | Change: "removed word count guidance" | REVERTED
```

Final summary:
```
=== AUTORESEARCH COMPLETE ===
Skill: [skill-name]
Iterations: 20
Baseline score: 72%
Final score: 84%
Best score: 84%
Commits kept: 3
Commits reverted: 17
Log: ~/.claude/skills/[skill-name]/autoresearch-results.tsv
```

## Important Constraints

1. **Binary assertions ONLY** — no 1-5 scales. An assertion either passes or fails.
2. **ONE change per iteration** — atomic so you know exactly what helped or hurt.
3. **Commit before re-testing** — so revert is always clean.
4. **Never stop to ask** — run to max_iterations or perfect score.
5. **Don't over-optimize** — if the eval has fewer than 15 assertions, warn: "Eval is small. Risk of overfitting to test cases. Consider adding more assertions before running."
6. **Log everything** — TSV is the audit trail. Never skip a row.
