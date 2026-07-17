# Changelog

## 2026-07-18 Optional Parent Workspace Templates

### Updated

- Clarified that parent workspace templates are optional enhancements, not default installation files.
- Clarified that ordinary project-list directories should stay clean unless the user explicitly wants a parent `AGENTS.md`.
- Updated README, installation guide and Wiki sources to recommend project-level `AGENTS.md` as the default path.
- Updated release-based install guidance to `v0.2.5`.

### Fixed

- Removed the implication that independent project parent rules should be installed by default.

## 2026-07-17 Independent Project Parent Template

### Added

- Added `Project and Agent/Parent Independent Projects/AGENTS.md` for long-lived independent project workspaces.
- Added `Project and Agent/README.md` to document the maintenance boundary between parent workspace templates and child project templates.
- Added `tests/cases/independent-project-new-project.md` to cover empty formal projects under independent project directories.

### Updated

- Updated README, installation guide and Wiki sources to document parent workspace templates.
- Updated release-based install guidance to `v0.2.4`.
- Extended `scripts/verify-agent-rules.sh` so project set and independent project parent templates are both validated.

### Fixed

- Clarified that a directory being registered as a Codex trusted project does not mean project-level Agent initialization is complete.

## 2026-07-16 README Visual Storytelling

### Updated

- Added five GPT-image-2 generated README visuals:
  - rules chaos;
  - experience capture;
  - three-layer Agent architecture;
  - GPT-5.6 adaptation;
  - Skill boundary and release loop.
- Reworked the README layout into a visual narrative before the installation steps.
- Updated release-based install guidance to `v0.2.3`.

## 2026-07-16 README GPT-5.6 and Superpowers Clarity

### Updated

- Added a README summary that states the package is adapted for GPT-5.6 prompting behavior.
- Added a README summary of Superpowers / Skill trigger boundary optimization.
- Updated release-based install guidance to `v0.2.2`.

## 2026-07-16 Release and Wiki Documentation

### Updated

- Created GitHub Release `v0.2.0` for the GPT-5.6 Agent rule refinement.
- Added Wiki source pages under `docs/wiki/`:
  - `Home.md`
  - `Installation-Guide.md`
  - `Agent-Rule-Architecture.md`
  - `Version-History.md`
  - `Project-Workflow.md`
  - `Update-and-Verification.md`
- Updated `README.md` with Release-based installation guidance and Wiki source location.

### Note

- GitHub reports Wiki as enabled, but the `.wiki.git` remote is not yet available for CLI push. Until the first GitHub Wiki page is initialized through the GitHub web UI, `docs/wiki/` is the maintained source for the Wiki content.

## 2026-07-16 Superpowers Skill Boundary Review

### Updated

- Added global Skill/Superpowers boundary rules:
  - implicit skill invocation should be direct and useful, not triggered by weak associations;
  - process skills can guide implementation skills, but equivalent workflows should not repeat;
  - skills apply to the current task only and should not be carried across tasks by inertia;
  - Skill and Superpowers do not expand user authorization or bypass sandbox, approval, external-write, destructive-action, deployment, push, or PR boundaries;
  - skill conflicts must be stated and resolved by higher-priority rules and the smallest safe path.
- Added `tests/cases/superpowers-skill-boundaries.md`.
- Extended `scripts/verify-agent-rules.sh` with Skill/Superpowers boundary assertions.

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
