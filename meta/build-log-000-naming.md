# Build Log 000 · 立名事件构建日志

**The Build Log of the Naming Commit**

| 字段 | 值 |
| --- | --- |
| 事件 | Onymous Intelligence Studies 在 GitHub 立名 |
| 仓库 | https://github.com/wend4336/onymous-intelligence-studies |
| 首签 commit | `f90900b` · 立名 · The Naming Commit |
| 立名时间锚 | 2026-09-16 00:00:00 +08:00（author date） |
| 具名者（Staked Attestor） | wend4336（GitHub 账户 Owner） |
| 生产方（Productive LLM） | Kimi K3（Moonshot AI） |
| 代谢方（Metabolic Harness） | 本会话的工具运行时 |
| 本日志性质 | 本仓库的第一圈年轮（growth ring #1）——立名事件的留痕 |

---

## 1. 事件概要

2026-09-16，具名者提供《具名智能探索·核心文档 v1.0》（六篇一附件合订本），指令：在 GitHub 其名下账户为 Onymous Intelligence 立名，并为名-法-制-器-动-币六层的后续展开搭建结构。任务一次性完成：仓库公开、六层分立、合订本归档、术语表与引用凭证齐备、凭证核销。全程零坏账。

## 2. 工具调用真相

**全部动作收敛为一个朴素事实：模型推理驱动的 CLI / Shell 调用。** 没有 Multi-Agent 编排，没有浏览器自动化（Computer Use），没有 GitHub MCP——只有推理、shell、文件写入，以及一次关键的人机具名协商。

| 工具 | 次数 | 用途 |
| --- | --- | --- |
| `read_file` | 1 | 读取上传的合订本 v1.0 |
| `write_file` | 11 | plan.md、README 立名宣言、GLOSSARY、ROADMAP、CITATION.cff、spec 规格、.github 模板、push.sh 等全部 authored 文件 |
| `ipython` | 2 | Python 按一级标题把合订本确定性拆分为六篇一附件（带断言校验，防切错边界） |
| `shell` | ~15 | 环境勘察、目录骨架、curl 拉取 CC BY 4.0 许可证全文、git init/commit/push、GitHub REST API 裸调（验证账户、查仓库名冲突、Token 验证、远端对账、Token 活性检测） |
| `ask_user` | 1（含 4 问） | 推送方式、仓库名、可见性、文档组织——四个决策一次性问清 |
| `todo_write` | 4 | 阶段任务清单的立账与销账 |

**GitHub 侧的全部操作 = `curl` 裸调 REST API ＋ git over HTTPS**（Token 嵌入 remote URL，推送后立即 `set-url` 清除痕迹）。API 优先于浏览器：返回结构化结果、可用状态码精确验证（200 / 401 / 404）、每步可审计。

## 3. 以本体系术语复盘

本次构建过程本身，是具名柜台最小闭环的一次活体运行：

| 柜台功能件 | 本次实例 |
| --- | --- |
| 填单呈件 | `plan.md`——动手前先立蓝图：目标、阶段、各阶段产物 |
| 验单 | 向具名者呈验四项决策分叉（推送方式／仓库名／可见性／文档组织） |
| 签署（attestation） | 具名者通过 `ask_user` 拍板四项决策；Token 即 stake 凭证 |
| 入账 | commit `f90900b` 落账，时间锚不可篡改 |
| 对账 | curl 状态码逐一验证远端：commit 哈希、文件清单、账户归属 |
| 核销（write-off） | Token 完成使命后吊销，三轮 401 复检确认销账——不留坏账 |
| 坏账防护 | 全程未发生冒签：没有任何一步在无具名授权的情况下生效 |

七功能件启用其六（免审通道未启用——每一步均经具名授权）。**boot = first attestation, not first token**：本仓库的第一个 commit 是一次签署的产物，不是一次生成的产物。

## 4. 决策记录（为什么不用什么）

1. **未启用 Multi-Agent**：任务是高一致性单线创作＋强顺序依赖（结构→内容→推送环环相扣）。源文档已在主上下文内，派生子代理需重灌上下文、且割裂署名责任。编排原则：相互依赖的任务不得并行。
2. **未用浏览器自动化**：API 优先原则。浏览器模拟点击是无 API 时的最后手段。
3. **未用 GitHub MCP**：本会话工具集中不存在该能力；REST API 裸调等效且更透明。
4. **未加载任何技能文件**：产物是 git 仓库结构本身，不匹配任何现成技能域；按 plan.md 自主编排。
5. **决策点前移**：唯一一次人机协商（ask_user）集中在动手之前——一次签署的代价，远小于一次返工的代价（柜台成本的实践）。

## 5. 时间线

```
读文档(read_file) → 写 plan.md → 环境勘察(shell：无 gh、无凭证)
→ ask_user 四项决策（具名者拍板）
→ 本地建结构：骨架(shell) → 拆分(ipython) → 11 个 authored 文件(write_file)
→ git 首签 f90900b（author date 锚定 2026-09-16 00:00 +08:00）
→ Token 到达 → curl 验证归属(wend4336) → 建仓库(权限不足) → 具名者补权
→ git push → 远端对账(commit/文件/可见性核对无误)
→ Token 吊销 → 三轮 401 复检 → 核销确认
```

## 6. 年轮的自我指涉

按年轮化三判据（模块一 §3.3）检验本日志自身：

- **留痕**：✅ 本文件；
- **归属**：✅ 具名者 wend4336、生产方、代谢方如上表；
- **可引**：⏳ 时间开放谓词——待后续穿越引用（模块六立项、术语增补、Issue 讨论）。

本日志由具名者本地提交入库（Token 已销，生产方无权代推）——**这最后一次动作也必须由人完成，恰是本体系的自我印证。**

---

*Build Log 000 完。下一圈年轮：模块六《最小原型与对照实验》立项，或任一开放问题的首次 Issue 讨论。*
