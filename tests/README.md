# Agent Rule Tests

本目录记录规则包的验证用例。

这些用例不是为了模拟模型完整思考过程，而是验证规则包是否具备可触发、可路由、可沉淀、可暂停的契约。

运行方式：

```bash
./scripts/verify-agent-rules.sh
```

验证目标：

- 全局 Agent、父级工作区 Agent、项目级模板结构完整。
- 项目集和独立项目两类父级目录都能说明正式新项目初始化规则。
- 项目级主 `AGENTS.md` 能路由到 `docs/agent/` 分支规则。
- 主动沉淀规则能说明哪些内容进入项目 `AGENTS.md`、`.learnings/` 或 `docs/decision-log.md`。
- “暂停沉淀 / 只列候选 / 不写入文件”的用户指令有明确约束。
- 新项目模板复制后能形成完整项目级 Agent 骨架。
