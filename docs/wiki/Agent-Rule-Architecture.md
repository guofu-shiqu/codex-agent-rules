# Agent Rule Architecture

本页说明全局 `AGENTS.md`、父级目录 `AGENTS.md`、项目级 `AGENTS.md` 和配套文件之间的关系。

## 1. 全局规则

位置：

```text
~/.codex/AGENTS.md
```

用途：

- 定义 guofu 的长期协作方式。
- 定义执行授权、证据边界、风险暂停、完成条件。
- 定义 Skill / Superpowers / 插件调用边界。
- 定义记忆与沉淀的全局原则。

全局规则应保持单文件可读、分区清楚、不过度拆散。

## 2. 父级目录规则（可选）

位置：

```text
<workspace>/AGENTS.md
```

用途：

- 定义某个父级目录是否承载正式项目。
- 定义该目录下新项目何时需要复制项目级基础骨架。
- 定义父级目录与子项目之间的读序。

父级目录规则是可选增强，不是必备层。普通项目列表目录可以不放父级 `AGENTS.md`，只保留每个具体项目自己的 `AGENTS.md`。

当前内置两类父级模板：

- `Project and Agent/Parent Project Set/AGENTS.md`
- `Project and Agent/Parent Independent Projects/AGENTS.md`

父级规则不写具体项目需求；具体项目需求仍写入子项目自己的 `AGENTS.md`。

## 3. 项目级规则

位置：

```text
<project>/AGENTS.md
```

用途：

- 定义项目定位、用户、阶段、成功标准。
- 定义项目权威来源。
- 定义项目特有约束。
- 定义项目工具与工作流路由。
- 定义项目验证与完成标准。
- 定义项目输出与沉淀规则。

项目级规则只写项目特有内容，不重复全局规则。

## 4. 项目分支资料

推荐结构：

```text
docs/
  agent/
    workflows.md
    memory-and-decisions.md
.learnings/
  LEARNINGS.md
  ERRORS.md
```

用途：

- `docs/agent/workflows.md`：复杂任务、需求澄清、原型、实施计划、交付复盘。
- `docs/agent/memory-and-decisions.md`：主动沉淀、决策记录、错误与待确认口径。
- `.learnings/LEARNINGS.md`：项目已确认经验。
- `.learnings/ERRORS.md`：项目已踩错误与避免方式。

## 5. 加载关系

默认关系：

```text
全局 AGENTS.md
  -> 父级目录 AGENTS.md（可选）
    -> 项目级 AGENTS.md
      -> docs/agent 与 .learnings 按需读取
```

优先级：

1. 用户当前明确指令。
2. 更具体、更靠近任务的项目规则。
3. 全局规则。
4. 历史文档、学习记录和推断。

如果发生冲突，优先遵循更具体、更新、更接近当前任务的规则。
