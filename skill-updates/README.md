# Astra 技能更新

v0.3.0 协调六项规则：授权继承、精确触发、复用确认、适量验证、候选与写入分离、按规模表达。

依据：[OpenAI Astra 指南](https://developers.openai.com/api/docs/guides/latest-model)、[Eric Provencher 原文](https://x.com/pvncher/status/2095991462416490862)。不通过规则强制选择模型。

## Superpowers

补丁基于上游 44c9b2d6e889982ac18c27d05a19fefe335194e1，修改四个技能主文件，保留其他引用和平台资源。MIT 许可见 superpowers/LICENSE。

在已有 Superpowers 仓库中检查本地变更并备份，然后运行（替换绝对路径）：

```bash
git apply --check /absolute/path/codex-agent-rules/skill-updates/superpowers/astra.patch
git apply /absolute/path/codex-agent-rules/skill-updates/superpowers/astra.patch
```

检查失败时逐项比较，不能强制覆盖。检查是否已经安装：

```bash
git apply --reverse --check /absolute/path/codex-agent-rules/skill-updates/superpowers/astra.patch
```

上游升级前保存本地补丁；升级后重新检查适配并保留上游新增必要约束。无需为旧流程重新启用 writing-plans。

## Guofu-improving-Agent

这是现有技能的更新包，不是完整平台安装包。只合并 SKILL.md 与 references/record-formats.md 到已安装的同名技能，保留现有脚本、资源和元数据；未安装时可跳过。

保留历史技能名以兼容已有调用。其大写名称不符合新版 skill-creator 的小写命名检查，这是现有兼容例外，未将其静态校验报告为全绿。

## 个人持久指令

个人 Profile 和 config.toml 不公开。对本机对应条款局部合并：

- 偏好档案按需检索，全局 AGENTS.md 第 10 节统一写入授权，不自动双写。
- 历史经验不覆盖当前指令，不自行授予权限。
- PR 用中文，按改动规模说明目的、变化、实际验证和存在的风险；小改动可用短段落，项目已有模板时遵循。

模板更新不自动迁移已有项目，不覆盖项目自有规则。父级规则继续可选。

## 验证

运行 scripts/verify-agent-rules.sh 做结构与复制验证；tests/cases/astra-boundaries.md 提供真实会话验收。脚本模拟写回不代表模型实际触发成功。安装后在新任务验证路由和授权行为。
