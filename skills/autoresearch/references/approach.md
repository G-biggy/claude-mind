# Autoresearch: The Karpathy-Inspired Approach

## The Core Insight

Andrej Karpathy's autoresearch pattern distills ML training to its essence and applies it to anything with an objective metric. The loop is:

```
measure → change → measure again → keep if better, revert if worse → repeat
```

When applied to Claude Code skills, the "thing to optimize" is the SKILL.md instruction file. The question becomes: can we apply gradient-like updates to natural language instructions?

Turns out: yes. With the right constraints.

---

## The 3 Ingredients

Every autoresearch run needs exactly these three things:

### 1. A Thing to Optimize
The SKILL.md file itself. It's a text file with instructions, constraints, examples, and formatting rules. Every word in it shapes what the model does. Changing the instructions = changing the model's behavior for that skill.

### 2. An Objective Metric
Binary assertions: each either passes (1) or fails (0). The overall score is `(assertions passed) / (total assertions)`. No partial credit, no Likert scales, no subjective rubrics.

Example: "Does not contain em-dashes" is a perfect assertion. "Tone is professional" is useless.

### 3. An Automated Measurement Tool
The autoresearch skill itself acts as the measurement tool. It invokes the target skill with a test prompt, captures the output, and evaluates each assertion programmatically or via judgment.

---

## Why Binary Assertions

### The variability problem
LLMs are stochastic. Run the same prompt twice and you get different outputs. If you use a 1-5 quality score, small changes in instruction might not move the needle — but the noise in output generation will. You can't tell signal from noise.

Binary assertions compound less variability. An assertion either fires or it doesn't. Run 5 times, take the majority vote (≥3/5 = pass). This is far more stable than averaging subjective scores.

### What works as binary
- Structural: "Contains a numbered list"
- Presence/absence: "Does not use the word 'utilize'"
- Measurable: "Under 300 words"
- Format: "Uses ## for section headings"
- Pattern: "First line is a complete sentence"

### What doesn't work as binary
- Quality: "Writing is engaging"
- Tone: "Professional but approachable"
- Judgment: "Provides good advice"
- Aesthetic: "Flows naturally"

If you can't write an unambiguous check for it, it's not a binary assertion.

---

## Why Multiple Runs Per Iteration

Each test prompt should be run 5 times minimum. Why?

LLM outputs are samples from a distribution. If an assertion passes 3/5 runs, it's a "sometimes works" instruction. If it passes 5/5, it's locked in.

Using single runs gives you a point estimate. Using 5 runs gives you a distribution. The improvement signal is much cleaner with distributions.

Practical rule: use a 60% threshold (3/5 runs = pass). An assertion that barely passes at 60% is a candidate for improvement. An assertion that passes 100% is solid.

---

## The Keep/Revert Git Workflow

Each iteration follows this exact sequence:

```
1. Read failing assertions
2. Make ONE change to SKILL.md
3. git commit (this is your checkpoint)
4. Run full eval
5a. Score improved or same → keep the commit
5b. Score dropped → git revert HEAD --no-edit
```

Why commit before testing? Because `git revert` only works cleanly on committed changes. If you test before committing, reverting is messy.

Why one change? Because if you change five things and the score drops, you don't know which of the five caused the regression. Atomic changes = attributable causality.

Why revert on same score? Because a change that doesn't improve is noise. You want only signal in your commit history. If the score is the same, the change probably won't hold up across more iterations.

---

## Overfitting Warning

This is the most important risk. The student who memorizes exam answers gets 100% on the test but can't solve novel problems.

Signs you're overfitting to evals:
- The skill now contains very specific language that maps directly to assertion checks
- The skill performs well on test prompts but feels mechanical on real use
- You've been running for 50+ iterations and score keeps improving — too good to be true
- Assertions are extremely narrow (checking for exact phrases, not structural properties)

Mitigations:
- Keep evals broad (5+ test cases covering different scenarios)
- Use mostly structural assertions, not content-specific ones
- Periodically do a human review alongside the metric score
- If something feels weird in the output even though assertions pass, it's probably overfitting

The goal is a skill that generalizes, not one that gaming the test cases.

---

## When to Use Autoresearch vs Human Review

### Use autoresearch for:
- Formatting rules (word count, structure, forbidden words)
- Consistency problems ("it sometimes uses em-dashes, sometimes doesn't")
- Structural patterns ("intro-body-conclusion never quite lands right")
- Measurable improvement on repetitive tasks

### Use human review for:
- Tone and voice ("does this sound like me?")
- Creative quality ("is this actually good writing?")
- Domain accuracy ("are the facts correct?")
- Novel use cases the eval doesn't cover

Autoresearch optimizes for what's measurable. Human review handles what isn't. Both are necessary. Neither replaces the other.

---

## The Log as Audit Trail

Every iteration writes to `autoresearch-results.tsv`:

```
iteration  timestamp           pass_rate  change_description                    outcome
0          2026-03-15T10:00Z   0.72       baseline                              baseline
1          2026-03-15T10:03Z   0.76       added constraint: no em-dashes        kept
2          2026-03-15T10:07Z   0.72       removed word count section            reverted
3          2026-03-15T10:11Z   0.80       added required: numbered list in body kept
```

This log answers: "what did we try, what worked, what didn't?" The git history answers: "what's the current state?" Together they give you full reproducibility.

Keep the TSV. Don't delete it between runs. Append to it. Over many runs it shows which types of changes tend to work for a given skill.

---

## References

- Karpathy's original repo: github.com/karpathy/autoresearch
- Udit Goenka's Claude Code adaptation: github.com/uditgoenka/autoresearch
- Key quote from Karpathy: "Never stop. The human might be asleep."
- Original program.md principle: continuous, unattended optimization
