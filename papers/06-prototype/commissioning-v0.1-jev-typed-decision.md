---
title: "模块六 · 最小原型与对照实验 —— 立项 V0.1"
title_en: "Module 6 · Minimal Prototype and Controlled Experiment — Commissioned V0.1"
version: "V0.1"
status: "已立项（commissioned）"
date: 2026-09-19
spec_refs:
  - "spec/traversal-event.md"
module_refs: ["模块一", "模块二", "模块四", "模块五", "模块六占位页", "附件A", "build-log-002"]
keywords: ["具名签署流", "类型化决策件", "Jev", "对照实验", "2x2-factorial"]
---

# 模块六 · 最小原型与对照实验 —— 立项 V0.1

**Module 6 · Minimal Prototype and Controlled Experiment — Commissioned**

> **状态**：已立项 V0.1（首个入库版本）
> **依据**：《模块六》占位页已定立项依据；《模块一》命题 2.7；《模块二》§5 最小闭环；《模块五》§6.4 首个检验点；附件 A 发现三、发现四；`spec/traversal-event.md` 数据层契约
> **新增变量**：类型化决策件（typed decision component，代表实例：TypeSafe AI Jev，2026-09-15 发布）进入对照设计
> **核查状态**：全部可外部验证断言已经断言图流水线回证（8 断言：7 accepted，1 superseded 已修正，0 悬空），记录见[附录 B](#附录-b--核查记录断言图摘要)

---

## 1. 立项动机：命题 2.7 的工程条件发生了变化

模块一命题 2.7 诊断：六条穿越路径中，**具名签署流最稀薄、无设施、无仪表**。该诊断写于类型化决策件成熟之前。

2026-09-15，TypeSafe AI 结束两年隐身状态发布 Jev——其称之为 System One 模型，不生成文本，接收**非结构化或结构化状态**与类型化问题，单次并行前向返回三类原语——Choice（≤255 选项选一）、Score（有序量表评分，2–10 级）、Noul（是/否概率）——Choice 与 Score 附校准置信度与概率分布，Noul 返回概率本身；厂商自报端到端延迟 70–500ms，截至立项日**未经独立复现**。这使"裁决点"第一次可以被**结构化地枚举、排队、预填**——而这恰是具名签署流设施化的前置条件。

**判词**：Jev 类组件不改变命题 2.7 的诊断（签署流仍是唯一携带不可撤销性与 stake 的流），但改变了它的**可施工性**。模块六立项正当其时。

## 2. 红线：机判不占签署位（设计前提，不可协商）

依判据 0.3 与具名三判据，Jev 的输出是**匿名生产**，不是具名签署：

- Jev 的 Noul 答案无论置信多高，**不得**以 `subtype = attested` 入账——无 signer、无 stake 的机判入账即冒签（forged attestation），即三阶蒸发的自动化；
- Jev 的合法位置只有两个：
  1. **裁决前置**（模块一 §2.3，状态流的 pre-adjudication）：在状态写入生效前筛出"不值得上柜台的决策"，降柜台通胀；
  2. **填单辅助**（呈现流的结构化）：把待决 Gap 渲染成带 stakes 的预填单——判什么、依据什么、建议结论与置信度——呈具名者拍板。

**入账规则**：每次 Jev 调用自身记录为一条 TraversalEvent（`direction = 装配流`，`signer = ∅`），其输出作为后续具名签署事件 `stake.依据` 的引用载体。机判进账的方式是**被具名签署引用**，不是自己入账。本立项不新增任何术语（规则 7.3 四件检查：无新词，无需过检）。

## 3. 对照设计：2×2 factorial

在原定"皮肤 vs 柜台"对照（模块二 §5）上扩展一维：

| | 皮肤式界面（聊天窗） | 柜台式界面（五环闭环） |
|---|---|---|
| **无前置件** | A 组（基线） | B 组（原设计） |
| **有 Jev 前置** | C 组 | D 组（本立项核心） |

- **原型域**：研究核查类（首选，已定）；阴性对照域：视频分发类（已定）；
- **D 组工作流**：装配流中 Jev 对所有候选决策点做 Noul 护栏与 Score 排序 → 高于阈值的生成预填单上柜台 → 具名者走五环：填单（已被预填，可改）→ 验单 → 签署/拒签/退单 → 入账 → 对账；
- **启动合规**：依命题 5.1，四组首次运行均以一笔具名签署启动（boot = first attestation），Jev 不得产生组内第一个生效动作。

## 4. 测量方案（器层指标全部沿用 M1–M9，不改定义）

| 测量对象 | 指标 | 组间预期 |
|---|---|---|
| 裁决质量 | 年轮化率 ring(e)（三谓词） | D > B，且 C 不优于 A |
| 入账密度 | 单位任务 ledgered 事件数 | D ≥ B（前置件不得压低入账） |
| 年轮深度 | d(e)，30 天回溯窗口 | D 组预填单事件应被后续穿越引用（citable） |
| **橡皮图章风险** | 建议一致时的响应时长中位数、改口率 | **D 组专属安全仪表**：若具名者对 Jev 建议的响应时长坍缩至接近零、改口率趋零，判前置件已诱导冒签——这比无前置件更毒（归属真、裁决假），实验应立即熔断 |
| 首个检验点 | 柜台汇率 ξ、贴现率 r 的可测性（模块五 §6.4） | D 组数据密度应使 ξ/r 首次可估 |
| 可证伪假设 | 意外率 σ 的类型分布排序（附件 A 发现四） | 四组共用 |

**基线校准注记**：独立第三方 Every 的测试显示，Jev 处理 37 份文档、21 个问题共 777 次判断，总耗时 <0.7s、成本约 $0.0025，但准确率比前沿 LLM 低一档；厂商自报的 4 工作流基准准确率约 68%，接近中档 LLM。**D 组的预期收益应建模为"吞吐量与成本"，而非"峰值准确率"**——这决定了橡皮图章仪表（上表第 4 行）是本案真正的生死线。

## 5. Jev 特有的失效模式与对策

1. **自信地选错**：Jev 可能在结构上合法（schema 内）而实质错误。此非推测：TypeSafe CEO 在 Hacker News 发布讨论中直接承认 schema-valid 的答案仍可为错；"零幻觉"只保证输出形状，不保证判断正确。对策：预填单必须渲染置信度与"依据链"指针，Score 低于阈值的建议**必须**标注为低置信，禁止裸结论呈现（呈现流须携带裁决所需结构，模块一 §2.6）。
2. **古德哈特敞口**：若 Jev 排序分被用作具名者绩效信号，贴对策 5.2.3 红线（指标不接激励）。对策：Jev 分数只进装配流，不进计价层。
3. **校准漂移**：RLCD（Reinforcement Learning for Calibrated Decisions）校准对分布外决策点失准。对策：对账环节回放"建议 vs 具名者实际裁决"的分歧率，分歧率漂移即前置件失准的仪表——这本身成为一条可入账的年轮数据。
4. **多渠道命名漂移**：Jev 已上架 OpenRouter、AI/ML API、Vercel AI SDK 等渠道，但同一原语在不同渠道命名不一致（如官方 API 的 Noul 在 Vercel AI SDK 中名为 boolean，probability 字段返回）。对策：前置件接入层以官方三原语（Choice/Score/Noul）为唯一契约词汇，渠道差异封装在适配器内，不得渗入预填单与账本字段。

## 6. 待决问题（在原占位页 4 条之上）

5. **前置件行为等价性**（由原"可替换性"问题收敛而来）：定价已确认 $0.042/百万输入 token、输出免费；开源复现框架 jevlike（输入输出形状相同、架构自研）已出现，OpenRouter/AI/ML API 等多渠道上架亦提供替代供给。仍待决：任何替代件是否满足"Choice/Score/Noul 契约 + 校准概率"的行为等价，需以 D 组分流协议实测判定——前置件是柜台零件，不是柜台本身；依 build-log-002 判词，**零件可替换，账不可替换**；
6. 预填单的"建议呈现强度"档位（只排序／给建议／给建议+依据）是否作为第三实验维——建议首版固定一档，避免维度爆炸；
7. 熔断阈值（§4 橡皮图章仪表）的具体数值由谁拍板——建议列为首个具名者冷启动后的第一笔签署事项（冷启动机制见模块四 §5.2）。

## 7. 与 GitHub 柜台的关系（实现层注记）

首个原型可直接以 GitHub 为柜台实现（build-log-002 §4.1 映射：PR=填单、review=验单、approve=签署、merge=入账、branch protection=P3）：Jev 前置件以 bot 身份在 PR 上贴预填单评论（装配流事件），具名者的 approve/reject 仍为唯一入账通道。此实现下，本实验的全部数据天然落在 append-only 账上，账在，名在。

---

## 附录 A · 版本沿革

| 版本 | 性质 | 说明 |
|---|---|---|
| 草案 v0.1（未入库） | Issue 讨论稿 | 初始草案 |
| 草案 v0.2（未入库） | 核查修订稿 | 断言图回证：修正"结构化状态"表述、校准概率精确化、失效模式 1 升级为已证、新增失效模式 4、待决问题 5 收敛 |
| **V0.1（本版）** | **立项入库** | 核查修订稿内容原样定稿，编号直接立为 V0.1 |

## 附录 B · 核查记录（断言图摘要）

立项前对全部可外部验证断言执行拆断言 → 回证 → 独立复核流水线：**8 断言，7 accepted，1 superseded（已修正），0 悬空**。

| 断言 | 裁决 | 关键证据 |
|---|---|---|
| TypeSafe AI 于 2026-09-15 发布 Jev | accepted | [DataCamp](https://www.datacamp.com/blog/system-one-models-jev)、[TMCnet](https://insight.tmcnet.com/insight/typesafe-ai-launches-jev-for-fast-typed-automation-decisions-mu4y0b4q) |
| 三原语 Choice（≤255）/Score/Noul，单次并行前向 | accepted | [explainx](https://explainx.ai/blog/top-10-jev-typesafe-ai-use-cases-2026)、[apidog](https://apidog.com/pt/blog/what-is-jev/)、[thruwire/foreman（SDK 实证）](https://github.com/thruwire/foreman) |
| 回答附校准概率/置信度 | accepted（措辞已修正：Choice/Score 附 confidence，Noul 返回概率本身） | [geotoolbox](https://geotoolbox.ai/blog/what-is-jev-ai)、[flaviocopes](https://flaviocopes.com/jev/) |
| 延迟 70–500ms 厂商自报、未独立复现 | accepted | [AIMLAPI](https://hidden.aimlapi.com/models/typesafe-jev-latest)、[OpenRouter 目录页](https://www.hunteralphahub.com/typesafe-jev) |
| 定价 $0.042/Mtok 输入、输出免费 | accepted | [OpenRouter 目录页](https://www.hunteralphahub.com/typesafe-jev)、[Cody](https://meetcody.ai/models/jev-1-13/) |
| RLCD 训练方法 | accepted | [DataCamp](https://www.datacamp.com/blog/system-one-models-jev)、[explainx](https://explainx.ai/blog/typesafe-ai-jev-system-one-models-launch-2026) |
| 输入为"结构化状态" | **superseded** → 非结构化或结构化均可（正文已修正） | [capitalandcompute](https://capitalandcompute.net/blog/typesafe-jev-system-one-models-cost-use-cases/)、[remio](https://www.remio.ai/zh/post/typesafe-jev-model-rejects-chatbots-for-programmatic-decisions-zh) |
| "自信地选错"为已证失效模式 | accepted | [explainx（CEO HN 承认）](https://explainx.ai/blog/typesafe-ai-jev-system-one-models-launch-2026)、[jdon（Every 独立测试）](https://www.jdon.com/94919-jevlike-one-pass-option-scoring-attention.html) |

---

*本立项依规则 7.3 自检：无新术语；全部事实性判断已经断言图回证并可回溯至仓库既有命题与公开信源（附录 B）；第 2 节红线若被后续 Issue 讨论推翻，本立项全文作废重来。*
