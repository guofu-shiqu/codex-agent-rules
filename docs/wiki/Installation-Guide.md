# Installation Guide

本页说明如何安装当前版本的 Codex Agent 规则包。

## 1. 下载指定版本

推荐安装正式 Release 版本，避免团队成员安装到不同提交。

```bash
git clone --branch v0.2.3 https://github.com/guofu-shiqu/codex-agent-rules.git
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

## 4. 验证安装

在规则包仓库根目录运行：

```bash
./scripts/verify-agent-rules.sh
```

当前版本预期结果：

```text
91 passed, 0 failed
```

## 5. 确认版本

团队成员应确认当前安装来源：

```bash
git describe --tags --always
```

当前正式版本应为：

```text
v0.2.3
```
