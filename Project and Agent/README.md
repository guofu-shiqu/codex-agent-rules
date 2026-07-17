# Project and Agent

本目录放置项目级 Agent 规则的可复用模板。

## 目录说明

- `Child Project Template/`：正式新项目的基础骨架，安装到 `~/.codex/agent-templates/project-agent/`。
- `Parent Project Set/`：适合“项目集”这类会集中管理多个子项目的父级目录。
- `Parent Independent Projects/`：适合“独立项目”这类会不断新增正式项目的父级目录。

## 维护原则

- 新项目默认骨架只维护在 `Child Project Template/`。
- 父级目录规则只说明该父级目录下哪些项目需要初始化、读序是什么、何时补齐骨架。
- 具体项目自己的规则写入该项目根目录 `AGENTS.md`，不回写模板。
- 不使用软链接，避免多个项目互相污染。
