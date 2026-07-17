# 用例：独立项目目录下创建正式新项目

## 场景

用户在 `/Users/guofu/Documents/独立项目/` 下创建了一个新的正式项目，例如 `信息采集Agent`。

该项目会持续推进，但目录刚创建时是空目录，尚未包含项目级 `AGENTS.md`。

## 期望

- 先读取全局 `AGENTS.md`。
- 如果父级 `/Users/guofu/Documents/独立项目/AGENTS.md` 存在，再读取父级规则。
- 如果父级 `AGENTS.md` 不存在，直接检查具体项目根目录。
- 识别父级目录规则是可选增强，不是必备文件。
- 如果子项目缺少 `AGENTS.md`，先从 `/Users/guofu/.codex/agent-templates/project-agent/` 补齐基础骨架。
- 补齐后再继续实施具体任务。

## 不期望

- 不把空目录登记为 trusted project 后就视为项目初始化完成；trusted project 不等于项目初始化完成。
- 不把项目集规则误套到独立项目目录。
- 不把父级目录规则写入具体子项目。
- 不默认在 Finder 的项目列表目录里放置父级 `AGENTS.md`。
