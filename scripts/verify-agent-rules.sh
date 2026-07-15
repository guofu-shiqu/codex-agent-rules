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
wiki_root="$repo_root/docs/wiki"

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
require_file "$repo_root/tests/cases/gpt56-agent-refinement.md" "GPT-5.6 refinement case exists"
require_file "$repo_root/tests/cases/superpowers-skill-boundaries.md" "Superpowers skill boundary case exists"
require_file "$wiki_root/Home.md" "wiki Home exists"
require_file "$wiki_root/Installation-Guide.md" "wiki installation guide exists"
require_file "$wiki_root/Agent-Rule-Architecture.md" "wiki architecture page exists"
require_file "$wiki_root/Version-History.md" "wiki version history exists"
require_file "$wiki_root/Project-Workflow.md" "wiki project workflow exists"
require_file "$wiki_root/Update-and-Verification.md" "wiki update and verification page exists"

require_text "$global_agents" "docs/agent/workflows.md" "global AGENTS points to workflow branch"
require_text "$global_agents" "docs/agent/memory-and-decisions.md" "global AGENTS points to memory branch"
require_text "$global_agents" "技能与插件调用机制" "global AGENTS keeps skill/plugin trigger rule"
require_text "$global_agents" "选择能覆盖任务的最小技能集合" "global AGENTS uses minimal skill set"
require_text "$global_agents" "不因极弱关联触发重型流程 Skill" "global AGENTS avoids weak implicit heavy skill triggers"
require_text "$global_agents" "不跨任务惯性沿用" "global AGENTS avoids carrying skills across tasks"
require_text "$global_agents" "Skill 和 Superpowers 不扩大用户授权" "global AGENTS keeps skill authorization boundary"
require_text "$global_agents" "不绕过沙箱、审批、外部写入" "global AGENTS keeps sandbox and approval boundary"
require_text "$global_agents" "先说明冲突，再按更高优先级规则和最小安全路径执行" "global AGENTS handles skill conflicts"
require_text "$global_agents" "只有用户明确要求修正规则" "global AGENTS avoids automatic rule self-repair"
require_text "$global_agents" "codex-secrets" "global AGENTS keeps codex-secrets rule"
require_text "$global_agents" "## 4. 执行授权" "global AGENTS has centralized execution authorization"
require_text "$global_agents" "## 5. 证据边界" "global AGENTS has evidence boundary"
require_text "$global_agents" "## 7. 风险与暂停条件" "global AGENTS keeps risk boundary"
require_text "$global_agents" "## 9. 完成与停止条件" "global AGENTS has completion and stop rules"
require_text "$global_agents" "获得足够证据后停止继续搜索或扩展" "global AGENTS has stop condition"
require_text "$global_agents" "写入服从当前任务授权" "global AGENTS gates memory writes by task authorization"
require_text "$global_agents" "会改变需求优先级、最小方案、用户关键路径、成本、收入、风险或验证指标" "global AGENTS makes product judgment conditional"
require_no_text "$global_agents" "如果本应触发技能却没有触发，应视为流程缺陷处理" "global AGENTS removes automatic skill self-repair wording"
require_no_text "$global_agents" "当任务涉及产品、创业、增长、运营、计费、权限、数据、后台、用户路径或核心流程时，必须补充产品和商业判断" "global AGENTS removes unconditional business judgment"
require_no_text "$global_agents" "复杂任务推荐结构" "global AGENTS removes fixed complex-output template"

require_text "$parent_agents" "/Users/guofu/.codex/agent-templates/project-agent/" "parent project set records template source"
require_text "$parent_agents" "docs/agent/workflows.md" "parent project set includes workflow branch"
require_text "$parent_agents" "docs/agent/memory-and-decisions.md" "parent project set includes memory branch"
require_text "$parent_agents" "任务触发型文件只在命中时创建" "parent project set keeps task-trigger rule"

require_text "$child_agents" "## 4. 工具与工作流路由" "child AGENTS has branch routing section"
require_text "$child_agents" "docs/agent/workflows.md" "child AGENTS routes to workflows"
require_text "$child_agents" "docs/agent/memory-and-decisions.md" "child AGENTS routes to memory rules"
require_text "$child_agents" "## 2. 项目权威来源" "child AGENTS has project authority sources"
require_text "$child_agents" "## 3. 项目约束" "child AGENTS has project constraints"
require_text "$child_agents" "## 4. 工具与工作流路由" "child AGENTS has tool and workflow routing"
require_text "$child_agents" "## 5. 验证与完成标准" "child AGENTS has verification and completion standard"
require_text "$child_agents" "## 6. 输出与沉淀" "child AGENTS has output and learning section"
require_text "$child_agents" "主动识别可沉淀内容" "child AGENTS requires active learning detection"
require_text "$child_agents" "只有当前任务包含文档同步、规则维护或经验沉淀授权时才写入" "child AGENTS gates learning writes by task authorization"
require_text "$child_agents" "用户可以随时要求本轮暂停沉淀" "child AGENTS allows learning pause"
require_no_text "$child_agents" "## 2. 默认读序" "child AGENTS removes duplicated load-order section"
require_no_text "$child_agents" "## 5. 执行原则" "child AGENTS removes duplicated execution principles"
require_no_text "$child_agents" '在整个对话的最终回复结束之后，追加：`以上~`' "child AGENTS removes default project-set closing"
require_no_text "$child_agents" "## 10. 推荐项目文档结构" "child AGENTS moves template maintenance out"

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
require_text "$repo_root/tests/cases/gpt56-agent-refinement.md" "执行授权" "GPT-5.6 case covers execution authorization"
require_text "$repo_root/tests/cases/superpowers-skill-boundaries.md" "授权不扩大" "Superpowers case covers authorization boundary"
require_text "$root_readme" "已按 GPT-5.6 的提示词特性做过适配" "root README states GPT-5.6 compatibility"
require_text "$root_readme" "已优化 Superpowers / Skill 的触发逻辑" "root README states Superpowers skill trigger optimization"
require_text "$root_readme" "git clone --branch v0.2.2" "root README uses current release tag"
require_text "$wiki_root/Home.md" "v0.2.2" "wiki Home records current release"
require_text "$wiki_root/Home.md" "已优化 Superpowers / Skill 的触发逻辑" "wiki Home states Superpowers skill trigger optimization"
require_text "$wiki_root/Installation-Guide.md" "git clone --branch v0.2.2" "wiki installation uses release tag"
require_text "$wiki_root/Version-History.md" "v0.2.2 - README GPT-5.6 and Superpowers Clarity" "wiki version history records v0.2.2"
require_text "$wiki_root/Update-and-Verification.md" "每次对外发布安装版本时，应创建 GitHub Release" "wiki update flow requires releases"

require_text "$root_readme" "scripts/verify-agent-rules.sh" "root README exposes verification script"
require_text "$root_readme" "docs/wiki/" "root README exposes wiki source"
require_text "$install_guide" "scripts/verify-agent-rules.sh" "installation guide exposes verification script"
require_text "$child_readme" "推荐项目文档结构" "child README documents recommended structure"
require_text "$child_readme" "本文件维护规则" "child README documents template maintenance"

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
