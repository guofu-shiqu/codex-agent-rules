# Version History

本页记录正式 GitHub Release 版本。

## v0.2.2 - README GPT-5.6 and Superpowers Clarity

Release：

<https://github.com/guofu-shiqu/codex-agent-rules/releases/tag/v0.2.2>

对应提交：

以 Release 页面为准。

### 主要更新

- 在 README 顶部补充当前版本已经兼容 GPT-5.6 提示词特性的说明。
- 在 README 顶部补充 Superpowers / Skill 触发逻辑优化说明。
- 同步更新 Wiki 首页、安装指南和验证脚本中的当前版本。

### 验证结果

```text
以 Release 页面为准。
```

## v0.2.1 - Release and Wiki Documentation

Release：

<https://github.com/guofu-shiqu/codex-agent-rules/releases/tag/v0.2.1>

对应提交：

以 Release 页面为准。

### 主要更新

- 补充 GitHub Release 作为团队安装版本锚点。
- 新增 `docs/wiki/` 作为 GitHub Wiki 页面源文件。
- 补充安装指南、架构说明、项目流程、更新验证和版本历史页面。
- 在 GitHub Wiki git 远端尚未初始化时，团队可先使用 `docs/wiki/` 阅读与维护。

### 验证结果

```text
91 passed, 0 failed
```

## v0.2.0 - GPT-5.6 Agent Rule Refinement

Release：

<https://github.com/guofu-shiqu/codex-agent-rules/releases/tag/v0.2.0>

对应提交：

```text
b96e8e5943d564997ea281e15715e0531c482f03
```

### 主要更新

- 适配 GPT-5.6 提示词特性。
- 全局 `AGENTS.md` 新增集中执行授权。
- 全局 `AGENTS.md` 新增证据边界。
- 全局 `AGENTS.md` 新增完成与停止条件。
- 优化 Skill / Superpowers 调用边界：
  - 显式点名必须使用；
  - 隐式调用应基于任务直接匹配和实际收益；
  - 不因极弱关联触发重型流程 Skill；
  - Skill 不扩大用户授权；
  - Skill 不绕过沙箱、审批、外部写入、线上变更、推送或 PR 边界。
- 项目级模板收敛为六段：
  - 项目结果；
  - 项目权威来源；
  - 项目约束；
  - 工具与工作流路由；
  - 验证与完成标准；
  - 输出与沉淀。
- 增加 GPT-5.6 与 Skill/Superpowers 边界测试用例。

### 验证结果

```text
91 passed, 0 failed
```
