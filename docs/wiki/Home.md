# Codex Agent Rules

这是 guofu 团队使用的 Codex Agent 规则包 Wiki。

本 Wiki 面向团队成员，说明如何安装、更新、验证和使用当前版本的全局 `AGENTS.md` 与项目级 `AGENTS.md` 模板。

## 当前版本

- 当前正式版本：`v0.2.4`
- Release：<https://github.com/guofu-shiqu/codex-agent-rules/releases/tag/v0.2.4>
- 对应提交：以 Release 页面为准。
- 验证结果：`128 passed, 0 failed`

## 当前设计重点

- 已按 GPT-5.6 的提示词特性做过适配：强调 outcome-first、执行授权、证据边界、停止条件和最小必要上下文。
- 已优化 Superpowers / Skill 的触发逻辑：显式点名必须使用，隐式调用保持克制，不因极弱关联触发重型流程 Skill。
- Skill 与 Superpowers 不扩大用户授权，不绕过沙箱、审批、外部写入、线上变更、推送或 PR 边界。
- 已补充“独立项目”父级模板，解决空目录被 trusted 后但未完成项目级 Agent 初始化的问题。
- 规则包配套验证脚本、GitHub Release 和 Wiki，方便团队确认当前安装版本与更新内容。
- README 已加入 5 张 GPT-image-2 生成的视觉说明图，用于解释痛点、经验沉淀、分层架构、GPT-5.6 适配和 Skill 边界。

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
