# Update and Verification

本页说明规则包如何更新、验证和发布。

## 1. 修改规则

规则变更应遵守：

- 只改与当前目标直接相关的内容。
- 优先做局部替换，不重写无关章节。
- 新增规则前先判断是否真的是跨项目长期规则。
- 项目特定规则不要写入全局 `AGENTS.md`。

## 2. 运行验证

每次修改全局规则、项目集规则或项目模板后，运行：

```bash
./scripts/verify-agent-rules.sh
```

当前版本预期结果：

```text
91 passed, 0 failed
```

## 3. 更新 CHANGELOG

正式更新必须同步维护：

```text
CHANGELOG.md
```

`CHANGELOG.md` 用于仓库内长期维护更新记录。

## 4. 创建 GitHub Release

每次对外发布安装版本时，应创建 GitHub Release。

推荐命名：

```text
v主版本.次版本.修订版本
```

例如：

```text
v0.2.3
```

Release 应包含：

- 本次更新目的。
- 主要变化。
- 安装方式。
- 验证命令和结果。
- 对应 commit。

## 5. 更新 Wiki

重要版本发布后，应同步更新：

- Home
- Installation Guide
- Version History
- Update and Verification

Wiki 面向团队阅读，`CHANGELOG.md` 面向仓库维护。
