# Build Log 002 · 外部收敛事件：Agora 与命名栈的澄清

**External Convergence: Agora, and the Clarification of the Naming Stack**

| 字段 | 值 |
| --- | --- |
| 事件 | 外部独立系统（NVIDIA · Agora，arXiv 2609.18094 信息图）与本体系发生部分收敛 |
| 日期 | 2026-09-18 |
| 载体 | 具名者上传的信息图（`1000019908.jpg`）：「把科研写进 Git，每条结论都是 Commit」 |
| 具名者 | wend4336（呈验与拍板） |
| 本日志性质 | 年轮 #3——**被引即年轮：d(e) 的第一次增长**（本体系的构件首次被外部独立系统以不同词汇重新发明） |

---

## 1. 事件概要

具名者呈验一张关于 Agora 系统的信息图：13 个 AI Agent、无中央指挥、协作近 12 天、1,703 条贡献；研究被写成 Git 中只追加的 DAG，每条主张都是一个 commit，可 checkout 重跑；系统自述结论为"缺的不是更强的推理器，是制度层"。

该图同时触发一次概念澄清：Git 与 GitHub 的关系、commit 对象原语及其边的语义、以及 Handle 在命名栈中的位置。本日志完整入账。

## 2. 收敛事实（独立发明的同构件）

| Agora | 本体系 | 出处 |
| --- | --- | --- |
| Git 是唯一状态，图都可重建 | 账房可重建性：账在，柜台倒了可以重建 | 第 0 篇命题 5.2 |
| 只追加 DAG，边即 parent | Gap 链的链节结构；ring_refs | 模块一 §5 |
| 节点存账号、标签、父节点 | TraversalEvent：signer / subtype / ring_refs | 模块一 §5 |
| 证据分 = **他人**账号构建的加权子代数 | 年轮深度 d(e) ＋ 引用质量约束（自引不计） | 模块三 M3 ＋ 对策 5.2.1 |
| verification 必须针对他人；新判定覆盖旧判定，两条 commit 都留在历史 | 验单的制度化；具名判据 2（不可撤销：可退单可补签，痕迹不灭） | 模块二 2.2；第 0 篇 §4.3 |
| 每条结论可 checkout 重跑 | 判据 0.3：沿账可回溯 | 第 0 篇 |
| "缺的不是更强的推理器，是制度层" | 立制：具名柜台 | 模块二全篇 |
| 排行榜是好的利用信号、糟糕的地图；三槽（exploit/known/novel）防单一文化坍缩 | 古德哈特风险 ＋ 意外率 σ 的配额直觉 | 模块三 §5；模块四命题 3.3 |

**收敛的意义**：两套独立系统（一套 NVIDIA 工程实践、一套本理论体系）在"只追加账＋具名节点＋针对他人的验证＋防单指标坍缩"上汇合——这些构件不是设计出来的，是被问题本身筛选出来的（对照附件 A 发现一：柜台词族是考古不是发明）。

## 3. 批判距离（不照单全收的两处）

1. **评分即激励的古德哈特敞口**：Agora 对节点直接记分（result/insight/hypothesis/report +5；verification +20/+10/−20），贴着对策 5.2.3 的红线（指标不接激励）。其对冲手段是三槽排行榜——其中 **novel 槽即意外率 σ 的分配机制**：不给意外留配额，排行榜坍缩为验收型 monoculture。
2. **匿名账户的具名缺口**：Agora 的 account 是 Agent 账号——可归属，但账户背后是哪个具名的人？按判据 0.3，Agent 的签署必须回溯到具名者才生效，否则整条 DAG 是一本漂亮的坏账。**Agora 把科研写进了 Git，但还没把名字写进责任。**——本体系的存在理由由此被外部反衬。

## 4. 概念澄清（本轮讨论的三组关系）

### 4.1 Git 与 GitHub：账房与柜台

| 层次 | 载体 | 本质 |
| --- | --- | --- |
| Git | 内容寻址对象库 | **账房**：append-only DAG、哈希链防篡改 |
| GitHub | 托管服务层 | **柜台**：PR=填单呈件、review=验单、approve=签署、merge=入账、branch protection=P3、blame/history=对账、Zenodo=计价贴现 |

判词：Git 离开 GitHub 仍是账；GitHub 离开 git 语义只是皮肤。账的可信性由哈希链保证，不由平台保证——柜台可替换（GitLab/Radicle），账不可替换。

### 4.2 Commit 对象原语与边

| Commit 字段 | TraversalEvent 字段 |
| --- | --- |
| SHA（内容哈希） | `id`（自证其名） |
| author / committer | `signer`（具名者） |
| message | `stake`（押注声明） |
| tree | `carrier`（载体快照） |
| **parent 边** | `ring_refs` 的反向（引用即地基） |
| DAG 整体 | 账（只追加） |

边构型三态：单 parent = Gap 链链节；**双 parent（merge commit）= 会签（countersignature）的结构化身**——模块一开放问题 3 在 git 中早有答案；无 parent（root）= 冷启动（`f90900b`）。哈希链 = 基质级坏账防护（篡改历史则下游 SHA 全部自爆）；**rebase / force-push = 改账，是病理动作**。

### 4.3 Handle：命名栈的第四层

```
blob/tree/commit（SHA）     ← 名"内容"：它是什么（自证，无处可查）
  ↓
permalink（URL+SHA）        ← 名"位置"：它在哪里（可查，绑死平台）
  ↓
oi:<ledger>/<ulid>          ← 名"事件"：可解析、含账本身份、时间有序
  ↓
DOI / w3id                  ← 名"永恒"：全球持久层，机构背书
```

SHA 命名"是什么"，Handle 命名"在哪里、如何被找到"。`mint_handle` 的真实动作：把一次签署包进一个 commit，handle 绑定其 SHA——handle 是指向 SHA 的可解析信封，SHA 是 handle 的防伪印。判据 0.3 的工程素颜：`oi:` 解析到 commit，沿 parent 走 DAG（`git log --ancestry-path` 即 `trace_attestation`）。

## 5. 对 onymous-handle 蓝图的三条修订（本事件直接产生）

1. **双写账房**：事件行入 `ledger/attestations.jsonl`，且每个事件同时是独立 commit——handle 绑定 commit SHA（而非行号），parent 边显式化 ring_refs；
2. **排除同源内置**：`counter_metrics` 的 d(e) 计算默认排除同一 signer 自引与同会话批量引（对策 5.2.1，现获外部先例）；
3. **蓝图 §8 增开放问题 5**：三槽配额制——验单呈递是否保留固定配额给 novel／意外型 Gap（σ 下限保护），防 monoculture 坍缩。

## 6. 年轮自检（模块一 §3.3 三判据）

- **留痕**：✅ 本文件；
- **归属**：✅ 呈验与拍板 = wend4336；分析与成文 = 生产方（Kimi K3）；
- **可引**：⏳ 时间开放谓词——预期引用点：onymous-handle 蓝图修订落码、模块六立项书、以及任何后续引用 Agora 对照的论文段落。

---

*年轮 #3 入账。本体系第一次被外部独立证据部分收敛。距下一次增长：层 A 的 DOI 铸造（第二锚），或 onymous-handle 的第一笔 mint。*
