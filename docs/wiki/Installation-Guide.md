# Installation Guide

本页说明如何安装当前版本的 Codex Agent 规则包。

## 1. 下载指定版本

推荐安装正式 Release 版本，避免团队成员安装到不同提交。

```bash
git clone --branch v0.2.4 https://github.com/guofu-shiqu/codex-agent-rules.git
```

## 2. 安装全局 AGENTS.md

将仓库根目录的 `AGENTS.md` 复制到本机 Codex 全局目录：

```bash
cp AGENTS.md ~/.codex/AGENTS.md
```

安装后，新开的 Codex 项目会先读取全局 `AGENTS.md`。

## 3. 安装项目级模板

将 `Project and Agent/Child Project Template` 复制到本机模板目录：

```bash
mkdir -p ~/.codex/agent-templates
cp -R "Project and Agent/Child Project Template" ~/.codex/agent-templates/project-agent
```

正式新项目创建时，从该模板复制项目级基础文件。

## 4. 安装父级目录模板（可选）

如果你有父级项目目录，可以按目录类型复制对应模板：

```bash
# 项目集
cp "Project and Agent/Parent Project Set/AGENTS.md" "/path/to/project-set/AGENTS.md"

# 独立项目
cp "Project and Agent/Parent Independent Projects/AGENTS.md" "/path/to/independent-projects/AGENTS.md"
```

父级模板用于让 Codex 在进入空的新项目目录时，先判断是否需要补齐项目级 `AGENTS.md`、`README.md`、`docs/agent/` 和 `.learnings/`。

## 5. 验证安装

在规则包仓库根目录运行：

```bash
./scripts/verify-agent-rules.sh
```

当前版本预期结果：

```text
以 Release 页面为准。
```

## 6. 确认版本

团队成员应确认当前安装来源：

```bash
git describe --tags --always
```

当前正式版本应为：

```text
v0.2.4
```
