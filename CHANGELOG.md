# Changelog

## 2026-07-16 GPT-5.6 Agent Rule Refinement

### Updated

- Refined global `AGENTS.md` around GPT-5.6 prompting principles:
  - centralized execution authorization;
  - added evidence boundaries;
  - added completion and stop conditions;
  - changed skill routing to the minimum required skill set;
  - changed product and business judgment from unconditional output to conditional output.
- Refined the project-level template `AGENTS.md` into six project-specific sections:
  - project result;
  - project authority sources;
  - project constraints;
  - tool and workflow routing;
  - verification and completion standard;
  - output and learning.
- Moved recommended project structure and template-maintenance guidance into the project template `README.md`.
- Updated `docs/agent/memory-and-decisions.md` so active learning detection does not imply automatic file writes; writes now require task authorization.

### Removed

- Removed automatic rule self-repair after missed skill triggers.
- Removed unconditional product/business analysis requirements.
- Removed the fixed complex-task output template from the global rule.
- Removed the default project-set closing phrase from the base project template.

### Verification

- Added `tests/cases/gpt56-agent-refinement.md`.
- Extended `scripts/verify-agent-rules.sh` with GPT-5.6 refinement assertions.
- Verification result: `84 passed, 0 failed`.
