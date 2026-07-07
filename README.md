# Codex Agent 规则包

这是一套可以交给 Codex 安装的 Agent 规则包。

它用于建立三层协作规则：

```text
全局 Agent
        ↓
父级项目 Agent（可选）
        ↓
子项目 Agent 模板
```

这份仓库保留了 guofu 当前使用的规则口径。团队或个人使用时，可以把其中的用户名、路径、输出风格和项目集规则替换成自己的版本。

## 1. 最快使用方式

克隆或下载本仓库后，把整个文件夹交给 Codex，并发送：

```text
请读取这个文件夹里的 README.md 和 Codex Installation Guide.md，按指南帮我安装这套 Agent 规则。
安装前先备份我本机已有的 ~/.codex/AGENTS.md。
安装后请告诉我全局 AGENTS.md、项目级模板和验证结果分别在哪里。
```

## 2. 文件结构

```text
README.md
Codex Installation Guide.md
AGENTS.md
Project and Agent/
├── Parent Project Set/
│   └── AGENTS.md
└── Child Project Template/
    ├── AGENTS.md
    ├── README.md
    └── .learnings/
        ├── LEARNINGS.md
        └── ERRORS.md
```

## 3. 哪些文件是必要的

必要文件：

- `README.md`：给人和 Codex 的入口说明。
- `Codex Installation Guide.md`：安装步骤。
- `AGENTS.md`：全局 Agent 规则，安装到 `~/.codex/AGENTS.md`。
- `Project and Agent/Child Project Template/`：正式新项目模板，安装到 `~/.codex/agent-templates/project-agent/`。

可选但保留：

- `Project and Agent/Parent Project Set/AGENTS.md`：父级项目规则。适合“项目集”这类会管理多个子项目的目录；没有父级项目时可以跳过。

不包含：

- 不包含过程审查材料。
- 不包含任务触发型文件，例如 `implementation-plan.md`、`decision-log.md`、`final-report.md`，因为这些文件只在具体项目任务命中时创建。
- 不包含软链接，避免多个项目互相污染。

## 4. 安装后的关系

```text
~/.codex/AGENTS.md
        ↓
父级项目/AGENTS.md（可选）
        ↓
具体项目/AGENTS.md
        ↓
具体项目 README / docs / .learnings / 代码与数据
```

## 5. 正式新项目怎么用

创建正式项目时，从这里复制基础模板：

```text
~/.codex/agent-templates/project-agent/
```

复制到新项目根目录后，新项目会有：

```text
AGENTS.md
README.md
.learnings/LEARNINGS.md
.learnings/ERRORS.md
```

临时对话、一次性草稿、短期试验目录，不需要创建项目级 `AGENTS.md`。

## 6. 适合谁使用

适合：

- 已经在用 Codex，并希望长期管理项目上下文的人。
- 需要区分全局规则、父级项目规则、子项目规则的团队。
- 希望新项目一开始就有 `AGENTS.md`、`README.md` 和 `.learnings/` 基础骨架的工作流。

不适合：

- 只做一次性聊天或临时草稿。
- 不希望 Codex 读取本地项目规则。
- 没有持续项目沉淀需求的场景。

## 7. 许可

本仓库使用 MIT License。
