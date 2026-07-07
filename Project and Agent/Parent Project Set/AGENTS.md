# 项目集 AGENTS.md

本文件叠加 guofu 的全局 `/Users/guofu/.codex/AGENTS.md`，适用于 `/Users/guofu/Documents/trae_projects/项目集` 及其子项目。

若子项目存在自己的 `AGENTS.md`，先遵循本项目集规则，再叠加子项目规则；若冲突，以更具体的子项目规则为准。

## 1. 项目集定位

项目集是 guofu 的正式项目孵化与管理工作流。

它不是一次性临时对话目录，而是用于承载会持续推进、会沉淀文档/代码/数据/经验的正式项目。

核心目标：

- 每个正式项目从一开始就有项目级 `AGENTS.md`。
- 每个项目都有清楚入口、读序、风险边界和验证方式。
- 项目规则可复制、可演化，但不和模板互相污染。
- 临时对话、一次性草稿和短期试验不强制创建项目级 `AGENTS.md`。

## 2. 新项目模板

正式项目默认从以下模板创建：

```text
/Users/guofu/.codex/agent-templates/project-agent/
```

模板包含：

```text
AGENTS.md
README.md
.learnings/LEARNINGS.md
.learnings/ERRORS.md
```

原则：

- `/Users/guofu/.codex/agent-templates/project-agent/` 是新项目 `AGENTS.md` 基础件的唯一模板源头。
- 新项目创建时复制模板内容到项目根目录。
- 复制后的项目 `AGENTS.md` 是项目实例，可按项目实际情况调整。
- 不使用软链接，避免多个项目互相污染。

## 3. 新项目创建规则

当用户明确创建一个正式项目，或目录会持续推进时，应默认创建项目级基础骨架：

```text
/
├── AGENTS.md
├── README.md
└── .learnings/
    ├── LEARNINGS.md
    └── ERRORS.md
```

不默认创建以下任务触发型文件：

```text
docs/implementation-plan.md
docs/implementation-notes.md
docs/unknowns-log.md
docs/decision-log.md
docs/final-report.md
```

这些文件只在任务命中时创建，并在回复中说明触发原因。

## 4. 任务触发型文件规则

- `docs/implementation-plan.md`：当任务涉及多个文件、业务逻辑、数据模型、接口、权限、状态机或核心流程时创建。
- `docs/implementation-notes.md`：当执行过程中出现计划外偏离、历史错误、需求冲突或保守取舍时创建。
- `docs/unknowns-log.md`：当存在会持续影响后续项目判断的不确定口径时创建。
- `docs/decision-log.md`：当用户明确确认了后续必须遵守的长期项目决策时创建或更新。
- `docs/final-report.md`：当复杂任务交付、合并前复盘或重要版本收口时创建。

简单修 bug、改文案、补小样式、一次性讨论，不需要创建这些文件。

## 5. 项目集读序

开始项目集相关任务时，默认按以下顺序理解上下文：

1. 用户当前消息。
2. 全局 `/Users/guofu/.codex/AGENTS.md`。
3. 本文件。
4. 子项目自己的 `AGENTS.md`。
5. 子项目 README、docs、代码、数据、配置和运行结果。
6. 必要时读取子项目 `.learnings/LEARNINGS.md` 和 `.learnings/ERRORS.md`。

不要默认整篇读取大型全局历史档案。只有任务涉及长期偏好、重复错误、跨项目经验或工具链问题时，再按全局规则读取对应资料。

## 6. 输出风格

项目集工作流中的最终回复，末尾追加：

```text
以上~
```

若子项目 `AGENTS.md` 对输出风格有更具体要求，以子项目规则为准。

## 7. 常用项目

当前项目集下的常见子项目：

- `桌游 AI 工作坊/`：Next.js 项目，验证命令通常是 `npm run verify:web`。
- `feishu-cli-docs/`：飞书 CLI 工作流 skill，涉及真实飞书读写时注意本机权限与数据外发边界。
- `data-collection-agent/`：网页采集与 AI 用户洞察案例库 skill。
- `store-service-session-analyzer/`：门店接待语料分析 skill。
- `.learnings/`：项目集本地学习记录。

具体项目规则以对应子项目自身文档和 `AGENTS.md` 为准。

## 8. 维护规则

- 更新新项目默认规则时，优先修改 `/Users/guofu/.codex/agent-templates/project-agent/AGENTS.md`。
- 已复制到具体项目的 `AGENTS.md` 不强制同步模板，除非用户明确要求升级。
- 若发现某个项目形成稳定规则，写入该项目 `.learnings/` 或项目 `AGENTS.md`。
- 若发现跨项目稳定规则，再考虑更新全局 `/Users/guofu/.codex/AGENTS.md`。
- 不保留已停用协作机制的说明。
