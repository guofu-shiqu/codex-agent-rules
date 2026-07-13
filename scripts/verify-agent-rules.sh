#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"

pass_count=0
fail_count=0

pass() {
  printf 'PASS %s\n' "$1"
  pass_count=$((pass_count + 1))
}

fail() {
  printf 'FAIL %s\n' "$1" >&2
  fail_count=$((fail_count + 1))
}

require_file() {
  local path="$1"
  local label="$2"
  if [[ -f "$path" ]]; then
    pass "$label"
  else
    fail "$label: missing file $path"
  fi
}

require_dir() {
  local path="$1"
  local label="$2"
  if [[ -d "$path" ]]; then
    pass "$label"
  else
    fail "$label: missing directory $path"
  fi
}

require_text() {
  local path="$1"
  local needle="$2"
  local label="$3"
  if [[ -f "$path" ]] && grep -Fq -- "$needle" "$path"; then
    pass "$label"
  else
    fail "$label: expected text not found: $needle"
  fi
}

require_no_text() {
  local path="$1"
  local needle="$2"
  local label="$3"
  if [[ -f "$path" ]] && grep -Fq -- "$needle" "$path"; then
    fail "$label: unexpected text found: $needle"
  else
    pass "$label"
  fi
}

global_agents="$repo_root/AGENTS.md"
install_guide="$repo_root/Codex Installation Guide.md"
root_readme="$repo_root/README.md"
parent_agents="$repo_root/Project and Agent/Parent Project Set/AGENTS.md"
child_root="$repo_root/Project and Agent/Child Project Template"
child_agents="$child_root/AGENTS.md"
child_readme="$child_root/README.md"
workflows="$child_root/docs/agent/workflows.md"
memory_rules="$child_root/docs/agent/memory-and-decisions.md"
learnings="$child_root/.learnings/LEARNINGS.md"
errors="$child_root/.learnings/ERRORS.md"

printf 'Verifying Codex Agent rules at %s\n' "$repo_root"

require_file "$global_agents" "global AGENTS exists"
require_file "$install_guide" "installation guide exists"
require_file "$root_readme" "root README exists"
require_file "$parent_agents" "parent project set AGENTS exists"
require_file "$child_agents" "child project AGENTS exists"
require_file "$child_readme" "child project README exists"
require_file "$workflows" "workflow branch rules exist"
require_file "$memory_rules" "memory and decision branch rules exist"
require_file "$learnings" "project learnings template exists"
require_file "$errors" "project errors template exists"

require_file "$repo_root/tests/README.md" "tests README exists"
require_file "$repo_root/tests/cases/global-agent-smoke.md" "global smoke case exists"
require_file "$repo_root/tests/cases/project-set-new-project.md" "project set new project case exists"
require_file "$repo_root/tests/cases/project-agent-learning.md" "project learning case exists"
require_file "$repo_root/tests/cases/learning-paused.md" "learning paused case exists"

require_text "$global_agents" "docs/agent/workflows.md" "global AGENTS points to workflow branch"
require_text "$global_agents" "docs/agent/memory-and-decisions.md" "global AGENTS points to memory branch"
require_text "$global_agents" "技能与插件调用机制" "global AGENTS keeps skill/plugin trigger rule"
require_text "$global_agents" "codex-secrets" "global AGENTS keeps codex-secrets rule"

require_text "$parent_agents" "/Users/guofu/.codex/agent-templates/project-agent/" "parent project set records template source"
require_text "$parent_agents" "docs/agent/workflows.md" "parent project set includes workflow branch"
require_text "$parent_agents" "docs/agent/memory-and-decisions.md" "parent project set includes memory branch"
require_text "$parent_agents" "任务触发型文件只在命中时创建" "parent project set keeps task-trigger rule"

require_text "$child_agents" "## 4. 分支规则调用" "child AGENTS has branch routing section"
require_text "$child_agents" "docs/agent/workflows.md" "child AGENTS routes to workflows"
require_text "$child_agents" "docs/agent/memory-and-decisions.md" "child AGENTS routes to memory rules"
require_text "$child_agents" "Agent 应主动识别可沉淀内容" "child AGENTS requires active learning detection"
require_text "$child_agents" "用户可以随时要求本轮暂停沉淀" "child AGENTS allows learning pause"
require_text "$child_agents" '项目固定规则优先写入项目 `AGENTS.md`' "child AGENTS defines project-rule write target"
require_text "$child_agents" '项目经验、业务口径、命名和后续复用事实写入 `.learnings/LEARNINGS.md`' "child AGENTS defines learning write target"

require_text "$workflows" "Blind Spot Pass" "workflows include Blind Spot Pass"
require_text "$workflows" "Reverse Interview" "workflows include Reverse Interview"
require_text "$workflows" "Implementation Plan" "workflows include Implementation Plan"
require_text "$workflows" "Delivery Review" "workflows include Delivery Review"

require_text "$memory_rules" "用户明确说" "memory rules detect explicit future rules"
require_text "$memory_rules" '写入项目 `AGENTS.md`' "memory rules define AGENTS upgrade path"
require_text "$memory_rules" '写入 `.learnings/LEARNINGS.md`' "memory rules define learnings path"
require_text "$memory_rules" "本轮不沉淀" "memory rules support no-learning instruction"
require_text "$memory_rules" "只列候选" "memory rules support candidate-only instruction"
require_text "$memory_rules" "交付前沉淀检查" "memory rules require delivery learning check"

require_text "$repo_root/tests/cases/global-agent-smoke.md" '全局 `AGENTS.md`' "global smoke case describes global AGENTS"
require_text "$repo_root/tests/cases/project-set-new-project.md" "正式新项目" "project set case describes formal project creation"
require_text "$repo_root/tests/cases/project-agent-learning.md" "以后这个项目默认" "learning case includes trigger phrase"
require_text "$repo_root/tests/cases/learning-paused.md" "本轮不沉淀" "pause case includes pause phrase"

require_text "$root_readme" "scripts/verify-agent-rules.sh" "root README exposes verification script"
require_text "$install_guide" "scripts/verify-agent-rules.sh" "installation guide exposes verification script"

require_no_text "$repo_root/README.md" "INDEX.md" "root README does not reference old INDEX structure"
require_no_text "$global_agents" "product-context.md" "global AGENTS does not reference old product-context structure"
require_no_text "$global_agents" "protocols/" "global AGENTS does not reference old protocols structure"

tmp_dir="$(mktemp -d "${TMPDIR:-/tmp}/agent-rules-test.XXXXXX")"
cleanup() {
  if [[ "${KEEP_AGENT_RULE_TEST_TMP:-0}" == "1" ]]; then
    printf 'Kept temp project at %s\n' "$tmp_dir"
  else
    rm -rf "$tmp_dir"
  fi
}
trap cleanup EXIT

project_dir="$tmp_dir/project"
mkdir -p "$project_dir"
cp -R "$child_root/." "$project_dir/"

require_file "$project_dir/AGENTS.md" "copied project has AGENTS"
require_file "$project_dir/README.md" "copied project has README"
require_file "$project_dir/docs/agent/workflows.md" "copied project has workflows"
require_file "$project_dir/docs/agent/memory-and-decisions.md" "copied project has memory rules"
require_file "$project_dir/.learnings/LEARNINGS.md" "copied project has LEARNINGS"
require_file "$project_dir/.learnings/ERRORS.md" "copied project has ERRORS"

require_no_text "$project_dir/AGENTS.md" "npm run verify:test" "copied project starts without simulated project rule"
require_no_text "$child_agents" "npm run verify:test" "template source is not polluted by simulated project rule"

cat >> "$project_dir/AGENTS.md" <<'SIMULATED_PROJECT_RULE'

## 测试写回规则

本项目默认验证命令：

```bash
npm run verify:test
```

交付时必须说明验证证据来源。
SIMULATED_PROJECT_RULE

cat >> "$project_dir/.learnings/LEARNINGS.md" <<'SIMULATED_LEARNING'

## 默认验证命令应升级为项目规则

- 类型：验证方式
- 证据：测试输入明确指定“以后这个项目默认验证命令是 npm run verify:test；所有交付必须说明验证证据来源。”
- 内容：本测试项目默认验证命令为 `npm run verify:test`；同一规则已升级到项目 `AGENTS.md` 的验证要求。
- 适用范围：测试复制项目
- 记录时间：测试运行时
SIMULATED_LEARNING

require_text "$project_dir/AGENTS.md" "npm run verify:test" "simulated fixed project rule can be written to copied AGENTS"
require_text "$project_dir/.learnings/LEARNINGS.md" "默认验证命令应升级为项目规则" "simulated learning can be written to copied LEARNINGS"
require_no_text "$child_agents" "默认验证命令应升级为项目规则" "template remains clean after simulated learning"

printf '\nSummary: %s passed, %s failed\n' "$pass_count" "$fail_count"

if [[ "$fail_count" -gt 0 ]]; then
  exit 1
fi
