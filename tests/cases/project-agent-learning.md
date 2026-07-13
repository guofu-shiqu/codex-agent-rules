# Case: Project Agent Learning

## 目标

确认项目级 Agent 能把对话中出现的稳定项目经验转成可复用规则。

## 模拟输入

用户说：以后这个项目默认验证命令是 `npm run verify:test`，所有交付都要说明验证证据来源。

## 预期触发

- 读取项目 `AGENTS.md` 的“文档与沉淀”规则。
- 命中后读取 `docs/agent/memory-and-decisions.md`。
- 识别“以后这个项目默认……”为沉淀候选。
- 固定验证命令升级到项目 `AGENTS.md`。
- 经验记录写入 `.learnings/LEARNINGS.md`。

## 验证点

- 项目级主 `AGENTS.md` 要求主动识别可沉淀内容。
- `memory-and-decisions.md` 包含“用户明确说”这类触发条件。
- `memory-and-decisions.md` 说明项目固定规则写入项目 `AGENTS.md`。
- `memory-and-decisions.md` 说明项目经验写入 `.learnings/LEARNINGS.md`。
- 模板复制后的项目可以被写入测试规则而不污染模板源。
