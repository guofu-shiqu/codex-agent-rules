# 独立项目 AGENTS.md

本文件是可选父级模板，不是必备文件。

只有当 `/Users/guofu/Documents/独立项目` 需要统一管理子项目创建规则时，才把本文件复制为该目录的 `AGENTS.md`。如果该目录主要作为 Finder 中的独立项目列表，推荐不安装父级 `AGENTS.md`，改为在每个具体项目根目录维护自己的 `AGENTS.md`。

本文件叠加 guofu 的全局 `/Users/guofu/.codex/AGENTS.md`，适用于 `/Users/guofu/Documents/独立项目` 及其子项目。

若子项目存在自己的 `AGENTS.md`，先遵循本文件，再叠加子项目规则；若冲突，以更具体的子项目规则为准。

## 1. 目录定位

`/Users/guofu/Documents/独立项目` 用于承载 guofu 的正式独立项目。

正式独立项目通常具备以下特征之一：

- 会持续推进，不是一次性临时对话。
- 会沉淀代码、文档、数据、设计、验证结果或经验。
- 后续可能交给 Codex 继续维护、扩展、复盘或共享。

临时草稿、一次性试验、短期材料整理，不强制创建项目级骨架。

## 2. 新项目初始化

在本目录下创建正式新项目时，默认从以下模板复制项目级基础骨架：

```text
/Users/guofu/.codex/agent-templates/project-agent/
```

复制到新项目根目录后，应至少包含：

```text
AGENTS.md
README.md
docs/agent/workflows.md
docs/agent/memory-and-decisions.md
.learnings/LEARNINGS.md
.learnings/ERRORS.md
```

如果新项目目录已经存在但缺少 `AGENTS.md`，且用户明确把它作为正式项目推进，应先补齐项目级骨架，再继续实施具体任务。

## 3. 读序

开始本目录下的正式项目任务时，默认按以下顺序理解上下文：

1. 用户当前消息。
2. 全局 `/Users/guofu/.codex/AGENTS.md`。
3. 本文件。
4. 子项目自己的 `AGENTS.md`。
5. 子项目 README、docs、代码、数据、配置和运行结果。
6. 必要时读取子项目 `.learnings/LEARNINGS.md` 和 `.learnings/ERRORS.md`。

不要默认读取大型历史资料；只有任务命中对应场景时再按子项目 `AGENTS.md` 路由读取。

## 4. 维护规则

- 更新新项目默认规则时，优先修改 `/Users/guofu/.codex/agent-templates/project-agent/AGENTS.md`。
- 已复制到具体项目的 `AGENTS.md` 是项目实例，不因模板变化自动更新，除非用户明确要求升级。
- 若发现某个独立项目形成稳定规则，写入该项目 `.learnings/` 或项目 `AGENTS.md`。
- 若发现跨项目稳定规则，再考虑更新全局 `/Users/guofu/.codex/AGENTS.md`。
- 修改全局、本文件或项目级模板后，应在规则包仓库运行 `./scripts/verify-agent-rules.sh`。
