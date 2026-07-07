# Codex Installation Guide

这份指南用于把本规则包安装到一台已经可以使用 Codex 的电脑上。

## 1. 推荐方式：交给 Codex

在 Codex 中打开本规则包文件夹，然后发送：

```text
请按这个文件夹里的 Codex Installation Guide.md 安装这套 Agent 规则。

要求：
1. 先备份我本机已有的 ~/.codex/AGENTS.md。
2. 把根目录 AGENTS.md 安装为 ~/.codex/AGENTS.md。
3. 把 Project and Agent/Child Project Template/ 安装为 ~/.codex/agent-templates/project-agent/。
4. 如果我有父级项目目录，请询问我路径，再把 Project and Agent/Parent Project Set/AGENTS.md 放到父级项目目录的 AGENTS.md。
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
~/.codex/agent-templates/project-agent/.learnings/LEARNINGS.md
~/.codex/agent-templates/project-agent/.learnings/ERRORS.md
```

### 2.4 安装父级项目规则（可选）

如果你有类似“项目集”的父级目录，可以复制：

```bash
cp "Project and Agent/Parent Project Set/AGENTS.md" "/path/to/your/project-set/AGENTS.md"
```

如果没有父级项目目录，可以跳过。

## 3. 创建正式新项目

当你创建一个会持续推进的正式项目时，把模板复制到新项目根目录：

```bash
cp -R ~/.codex/agent-templates/project-agent/. "/path/to/new-project/"
```

复制后，新项目根目录应该有：

```text
AGENTS.md
README.md
.learnings/LEARNINGS.md
.learnings/ERRORS.md
```

然后根据项目实际情况修改新项目自己的 `AGENTS.md` 和 `README.md`。

## 4. 验证安装

检查全局规则：

```bash
test -f ~/.codex/AGENTS.md && echo "Global AGENTS.md OK"
```

检查项目模板：

```bash
test -f ~/.codex/agent-templates/project-agent/AGENTS.md && echo "Project template AGENTS.md OK"
test -f ~/.codex/agent-templates/project-agent/.learnings/LEARNINGS.md && echo "Project learnings OK"
test -f ~/.codex/agent-templates/project-agent/.learnings/ERRORS.md && echo "Project errors OK"
```

## 5. 使用规则

- 全局规则放在 `~/.codex/AGENTS.md`。
- 新项目模板源头放在 `~/.codex/agent-templates/project-agent/`。
- 具体项目只使用复制后的项目根目录 `AGENTS.md`。
- 不要用软链接连接模板和项目，避免项目之间互相污染。
- 临时对话、一次性草稿、短期试验目录，不需要创建项目级 `AGENTS.md`。

## 6. 回滚方式

如果安装后想恢复原全局规则：

```bash
cp ~/.codex/AGENTS.md.bak-agent-rules ~/.codex/AGENTS.md
```

具体项目中的 `AGENTS.md` 是复制出来的实例，不会因为模板变化自动改变。
