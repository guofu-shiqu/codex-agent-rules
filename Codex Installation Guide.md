# Codex Installation Guide

这份指南用于把本规则包安装到一台已经可以使用 Codex 的电脑上。

安装前可在规则包根目录运行基础验证：

```bash
./scripts/verify-agent-rules.sh
```

## 1. 推荐方式：交给 Codex

在 Codex 中打开本规则包文件夹，然后发送：

```text
请按这个文件夹里的 Codex Installation Guide.md 安装这套 Agent 规则。

要求：
1. 先备份我本机已有的 ~/.codex/AGENTS.md。
2. 把根目录 AGENTS.md 安装为 ~/.codex/AGENTS.md。
3. 把 Project and Agent/Child Project Template/ 安装为 ~/.codex/agent-templates/project-agent/。
4. 如果我明确要求安装父级项目目录规则，请询问我路径和类型，再把对应父级模板放到父级项目目录的 AGENTS.md；否则不要默认安装父级 AGENTS.md。
   - 项目集：Project and Agent/Parent Project Set/AGENTS.md
   - 独立项目：Project and Agent/Parent Independent Projects/AGENTS.md
5. 安装后帮我验证文件是否存在，并告诉我后续创建正式项目时应该复制哪个模板目录。
```

## 2. 手动安装

以下命令以 macOS 为例。

### 2.1 备份现有全局 AGENTS.md

```bash
cp ~/.codex/AGENTS.md ~/.codex/AGENTS.md.bak-agent-rules
```

如果原来没有 `~/.codex/AGENTS.md`，可以跳过备份。

### 2.2 安装全局 AGENTS.md

在本规则包根目录运行：

```bash
cp AGENTS.md ~/.codex/AGENTS.md
```

### 2.3 安装项目级模板源头

```bash
mkdir -p ~/.codex/agent-templates/project-agent
cp -R "Project and Agent/Child Project Template/." ~/.codex/agent-templates/project-agent/
```

安装后应该存在：

```text
~/.codex/agent-templates/project-agent/AGENTS.md
~/.codex/agent-templates/project-agent/README.md
~/.codex/agent-templates/project-agent/docs/agent/workflows.md
~/.codex/agent-templates/project-agent/docs/agent/memory-and-decisions.md
~/.codex/agent-templates/project-agent/.learnings/LEARNINGS.md
~/.codex/agent-templates/project-agent/.learnings/ERRORS.md
```

### 2.4 安装父级目录规则（可选，默认跳过）

父级目录规则不是必备文件。只有当你明确希望某个父级目录统一管理子项目创建规则时，才安装这一层。

如果你有类似“项目集”的父级目录，并希望它统一管理多个子项目，可以复制：

```bash
cp "Project and Agent/Parent Project Set/AGENTS.md" "/path/to/your/project-set/AGENTS.md"
```

如果你有类似“独立项目”的父级目录，并明确希望父级目录也有统一规则，可以复制：

```bash
cp "Project and Agent/Parent Independent Projects/AGENTS.md" "/path/to/your/independent-projects/AGENTS.md"
```

如果父级目录主要只是 Finder 里的项目列表，推荐跳过，不要默认放置父级 `AGENTS.md`。

## 3. 创建正式新项目

当你创建一个会持续推进的正式项目时，把模板复制到新项目根目录：

```bash
cp -R ~/.codex/agent-templates/project-agent/. "/path/to/new-project/"
```

复制后，新项目根目录应该有：

```text
AGENTS.md
README.md
docs/agent/workflows.md
docs/agent/memory-and-decisions.md
.learnings/LEARNINGS.md
.learnings/ERRORS.md
```

然后根据项目实际情况修改新项目自己的 `AGENTS.md` 和 `README.md`。

如果正式项目已经是空目录，但还没有 `AGENTS.md`，应先补齐上述项目级骨架，再继续实施具体任务。仅把目录加入 Codex trusted project 不等于项目初始化完成。

没有父级 `AGENTS.md` 时，也可以直接在具体项目根目录补齐项目级骨架。

## 4. 验证安装

检查全局规则：

```bash
test -f ~/.codex/AGENTS.md && echo "Global AGENTS.md OK"
```

检查项目模板：

```bash
test -f ~/.codex/agent-templates/project-agent/AGENTS.md && echo "Project template AGENTS.md OK"
test -f ~/.codex/agent-templates/project-agent/docs/agent/workflows.md && echo "Project workflows OK"
test -f ~/.codex/agent-templates/project-agent/docs/agent/memory-and-decisions.md && echo "Project memory rules OK"
test -f ~/.codex/agent-templates/project-agent/.learnings/LEARNINGS.md && echo "Project learnings OK"
test -f ~/.codex/agent-templates/project-agent/.learnings/ERRORS.md && echo "Project errors OK"
```

如果你是在维护这套规则包本身，修改全局 Agent、父级目录 Agent、项目级模板或测试用例后，再运行：

```bash
./scripts/verify-agent-rules.sh
```

## 5. 使用规则

- 全局规则放在 `~/.codex/AGENTS.md`。
- 新项目模板源头放在 `~/.codex/agent-templates/project-agent/`。
- 父级项目规则是可选增强，可放在长期父级目录的 `AGENTS.md`，例如项目集目录；普通项目列表目录默认不需要。
- 具体项目只使用复制后的项目根目录 `AGENTS.md`。
- 不要用软链接连接模板和项目，避免项目之间互相污染。
- 临时对话、一次性草稿、短期试验目录，不需要创建项目级 `AGENTS.md`。

## 6. 回滚方式

如果安装后想恢复原全局规则：

```bash
cp ~/.codex/AGENTS.md.bak-agent-rules ~/.codex/AGENTS.md
```

具体项目中的 `AGENTS.md` 是复制出来的实例，不会因为模板变化自动改变。
