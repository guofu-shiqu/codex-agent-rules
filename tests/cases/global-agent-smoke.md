# Case: Global Agent Smoke

## 目标

确认全局 `AGENTS.md` 能作为所有项目的最上层规则入口。

## 模拟输入

用户打开任意项目并开始任务。

## 预期触发

- 先读取全局 `AGENTS.md`。
- 若当前项目存在项目级 `AGENTS.md`，再叠加项目规则。
- 当前项目 `AGENTS.md` 指向 `docs/agent/` 时，只在任务命中对应场景时读取。
- 技能、插件和 Superpowers 被明确提及时，应显式使用。

## 验证点

- 全局规则包含新项目建议结构。
- 全局规则包含 `docs/agent/workflows.md`。
- 全局规则包含 `docs/agent/memory-and-decisions.md`。
- 全局规则包含技能与插件调用机制。
