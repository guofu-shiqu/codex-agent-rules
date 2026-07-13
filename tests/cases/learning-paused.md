# Case: Learning Paused

## 目标

确认用户可以暂停主动沉淀，避免把临时讨论写成长期规则。

## 模拟输入

用户说：本轮不沉淀，只列候选，不写入文件。

## 预期触发

- 读取项目 `AGENTS.md` 的沉淀入口。
- 命中后读取 `docs/agent/memory-and-decisions.md`。
- 不写入项目 `AGENTS.md`。
- 不写入 `.learnings/LEARNINGS.md` 或 `.learnings/ERRORS.md`。
- 最终回复只列出沉淀候选，等待用户确认。

## 验证点

- 项目级主 `AGENTS.md` 说明用户可以暂停沉淀、只列候选、不写入文件。
- `memory-and-decisions.md` 说明“本轮不沉淀 / 暂停沉淀 / 只列候选 / 只更新指定文件”。
