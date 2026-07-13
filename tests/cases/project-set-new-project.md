# Case: Project Set New Project

## 目标

确认项目集能在创建正式新项目时给出完整项目级 Agent 骨架。

## 模拟输入

用户说：创建一个会持续推进的正式新项目。

## 预期触发

- 从 `/Users/guofu/.codex/agent-templates/project-agent/` 复制模板。
- 新项目根目录获得 `AGENTS.md`、`README.md`、`docs/agent/` 和 `.learnings/`。
- 不创建任务触发型文件，例如 `docs/implementation-plan.md`、`docs/decision-log.md`、`docs/final-report.md`。

## 验证点

- 项目集规则包含模板源头。
- 项目集规则列出 `docs/agent/workflows.md`。
- 项目集规则列出 `docs/agent/memory-and-decisions.md`。
- 项目集规则说明任务触发型文件只在命中时创建。
