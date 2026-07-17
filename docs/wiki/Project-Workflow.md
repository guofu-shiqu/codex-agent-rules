# Project Workflow

本页说明正式项目如何使用项目级 Agent 模板。

## 1. 临时对话不需要项目级模板

临时咨询、一次性问答、快速验证，不需要创建项目级 `AGENTS.md`。

## 2. 正式项目需要项目级 AGENTS.md

正式项目创建时，应复制项目级模板：

```text
~/.codex/agent-templates/project-agent
```

复制到新项目根目录后，应至少填写：

- 项目一句话定位。
- 目标用户。
- 当前阶段。
- 最重要的成功标准。
- 当前不做。
- 项目权威来源。
- 项目特有约束。
- 项目常用验证命令。

## 3. 父级目录可以先安装父级 AGENTS.md

如果正式项目集中放在一个父级目录下，建议先复制对应父级模板：

- 项目集：`Project and Agent/Parent Project Set/AGENTS.md`
- 独立项目：`Project and Agent/Parent Independent Projects/AGENTS.md`

父级规则用于处理这类情况：

- 子项目目录已经创建。
- Codex 已经信任该目录。
- 但子项目仍是空目录，缺少项目级 `AGENTS.md`。

这种情况下，应先补齐项目级骨架，再继续执行具体任务。

## 4. 项目经验沉淀

项目过程中如果出现可复用经验，应先识别为候选。

只有当前任务包含以下授权时，才写入文件：

- 文档同步；
- 规则维护；
- 经验沉淀；
- 用户明确要求以后默认遵守。

默认写入位置：

- 固定执行规则、验证命令、输出风格：项目 `AGENTS.md`
- 业务口径、命名、项目经验：`.learnings/LEARNINGS.md`
- 已踩错误、失败原因、避免方式：`.learnings/ERRORS.md`
- 重要长期决策：`docs/decision-log.md`

## 5. 项目结束输出

如果项目集或具体项目要求固定结束语，应写在该项目或项目集的 `AGENTS.md` 中，不写入通用项目模板。
