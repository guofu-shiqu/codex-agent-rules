# Codex Agent Rules

这是 guofu 团队使用的 Codex Agent 规则包 Wiki。

本 Wiki 面向团队成员，说明如何安装、更新、验证和使用当前版本的全局 `AGENTS.md` 与项目级 `AGENTS.md` 模板。

## 当前版本

- 当前正式版本：`v0.2.1`
- Release：<https://github.com/guofu-shiqu/codex-agent-rules/releases/tag/v0.2.1>
- 对应提交：以 Release 页面为准。
- 验证结果：`91 passed, 0 failed`

## 主要页面

- [Installation Guide](Installation-Guide)：安装指南
- [Agent Rule Architecture](Agent-Rule-Architecture)：全局 Agent 与项目级 Agent 架构
- [Version History](Version-History)：版本记录与 Release 说明
- [Project Workflow](Project-Workflow)：正式项目创建与使用流程
- [Update and Verification](Update-and-Verification)：更新与验证流程

## 使用原则

1. 全局规则先加载，项目规则再叠加。
2. 项目级 `AGENTS.md` 只放项目特有规则，不重复全局规则。
3. 经验沉淀先识别候选，写入需要任务授权。
4. 每次修改规则包后，必须运行验证脚本。
5. 每个对外安装版本必须创建 GitHub Release。
