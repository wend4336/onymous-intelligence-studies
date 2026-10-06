# Handle 字据原语：信用证隐喻的原语化 — 签发版 v1.0

```javascript
COMMIT   oi:design/handle-primitives-lc-v1.0/20261006
PARENT   oi:context/skin-as-mcp-server-v1.0/20261005
AUTHOR   OIS 工程组（Kimi K3 协同）
DATE     2026-10-06
STATUS   签注人：＿＿＿＿＿＿＿＿＿＿    签注时间：＿＿＿＿＿＿
MESSAGE  签发定稿：七动词两读原语 · 状态机不落库 · rules_ref 惯例版本化 · 骑墙定位 · 原语×两段敞口结合 · 统一开发序十步
VERIFY   L/C 单据惯例为贸易金融公知事实层；原语设计为体系内推导；实现差距与开放问题显式列示，零悬空入正文
PURPOSE  开发基础上下文：凡新增字据类型/工具，须先映射到本原语集；映射不上即新原语提案，走裁决
```

**变更摘要（diff v0.1 → v1.0）**

1. 「骑墙」从讨论沉淀为 §七 架构定位节：Handle 住 MCP server 进程内但不属于它——四层（物理/协议/权力/环路）论证；
2. 新增 §八 原语 × 四层皮肤 × 两段敞口：确立**原语集段中立**与**相变点唯一落在 CONFIRM** 两个结构性论断；CREDIT_AUTH 定性为声誉段结算语义在金融段的原生移植；
3. 开发序统一为十步（原 §六 六步 + §8.6 四步合并）；开放问题集中列示；
4. AI 止步定理获原语表述：**模型可以开证、可以交单、可以取石，就是永远不能保兑**。

---

## 一、为什么是信用证

Handle 的核心难题：让"判断"成为可携带、可验证、可结算、可比任何 harness 长寿的**凭据**。国际贸易几百年前解决了同构问题——让"一批货的承诺"成为可携带、可验证、可结算、比任何单一承运方长寿的凭据。答案不是信任，是**单据制度**：银行不管货，只管单据严格相符；信用证独立于底层买卖合同；不可撤销；有有效期；修改须各方留痕。

信用证给 Handle 的最大礼物不是某个字段，是一条总原则：**单据交易原则——系统处理的是字据，不是字据所指的世界。** K3（禁止 LLM 验收 LLM、确定性验收）在 L/C 语境里早已是常识：审单员不登船验货。

---

## 二、隐喻映射总表与边界

| 信用证制度 | Handle 字据 | 说明 |
| --- | --- | --- |
| 开证申请人 | 模型 / Loop（adjudication_submit） | 发起裁决需求的一方 |
| 开证行 | Handle 内核 | **只签不判**：开立字据、核验单据、不做语义裁量 |
| 受益人 | 世界 / 未来需要追溯的任何人 | 字据的最终服务对象 |
| 保兑行 | **具名签署人（signer）** | 人的签名 = 给模型的"开证"加一层可亏钱的信用——AI 止步 L1 的 L/C 表达 |
| 单据（提单/发票/保险单） | 字据各字段与关联单据族 | outcome_ref=提单（物权凭证↔回流凭证）；auth_no=第三方签发的单据（支付平台） |
| UCP（统一惯例） | R-0 科目表 | 管辖单据实践的版本化规则集 |
| 严格相符 / 不符点 | K3 确定性验收 / validator 错误清单 | 不符点通知必须随拒收返回 |
| 不可撤销 | append-only | "撤销"一律以新字据覆盖表达 |
| 独立性原则 | L2：账独立于 harness | 字据不引用任何 harness 内部状态格式 |
| 有效期 | 半衰期（half_life_days） | 届至不消灭历史，只改变可结算性 |
| 修改须各方同意 | amend 双留痕 | 旧单据不撤销，被新字据引用覆盖（SUPERSEDED 语义） |
| 交单期 | 悬置窗口（ISSUE→SETTLE 之间） | 证据可分批呈交 |

**隐喻的边界（三条，防过度类比）**：
1. 信用证是**付款承诺**，字据是**判断凭据**——Handle 承诺的不是付钱，是"判断被如实记住、结算规则被遵守"；
2. 银行是信用中介，Handle 无信用、只登记——**保兑的信用全部来自 signer 的 stake**，Handle 更像单据登记处+公证处；
3. UCP 是国际惯例多年演化，R-0 科目表是我们自己版本化的——因此每字据必须显式记录"适用哪版惯例"（见 §五 rules_ref）。

---

## 三、原语集：七动词 + 两读原语

### 写路径七动词

| # | 原语 | L/C 对应 | 语义 | 关键字段（封闭区） | 现状 |
| --- | --- | --- | --- | --- | --- |
| 1 | **开立 ISSUE** | 开证 | 裁决申请落链，开出一张待保兑的判断凭据 | 申请人(model)、押注问题、⚡、管辖域、outcome_ref、化石指针、half_life、rules_ref | `quiz_open` |
| 2 | **呈交 PRESENT** | 交单 | 证据/世界回答的分批提交——交单期内任何方可补交 | 引用 ISSUE、单据指针集、提交人 | **缺，新原语**（现化石在 ISSUE 时一次性携带） |
| 3 | **保兑 CONFIRM** | 保兑 | 具名签署 + stake 档位：人的信用加到模型的开证上，相变发生 | signer（强制）、verdict、band、auth_no?、gate_key? | `stake` |
| 4 | **拒付 REFUSE** | 拒付/拒单 | 一键零惩罚且体面；拒付本身是单据，留链 | signer（强制）、reason? | `veto` |
| 5 | **修改 AMEND** | 修改 | 新单据引用旧单据，双留痕；旧单据标 SUPERSEDED 语义但本体不改 | signer（强制）、amends 指针（强制） | `amend` |
| 6 | **结算 SETTLE** | 议付/承兑 | 世界回答到达后的清算落账：FREEZE→PAY（罚没）或 UNFREEZE（释放）；OutcomeRef 物理回流的落账点 | 引用 CONFIRM（强制）、世界回答证据、operation_id（幂等唯一） | **缺，新原语**（stake 有状态字段但无结算字据类型） |
| 7 | **失效 EXPIRE** | 有效期届至 | 时钟确定性触发，任何方可发起；新字据声明失效，不改写原字据 | 引用 ISSUE、时钟证据 | **缺，新原语**（现仅有保鲜报告的推导，无落链事件） |

### 读路径两原语

| # | 原语 | L/C 对应 | 语义 | 现状 |
| --- | --- | --- | --- | --- |
| 8 | **核验 VERIFY** | 审单 / 取石 | 重放 hash 链 + 严格相符检查（封闭区） | `receipt_verify` |
| 9 | **归档 SNAPSHOT** | 单据归档/副本 | 按科目域裁剪导出（K5：不按 token 预算） | `ledger_snapshot` |

辅助字据（非独立原语，属流程记录）：`card_view`（开卷记录，橡皮图章计时）、`feed_ack`（台面回执）、`promotion`（= ISSUE+CONFIRM+SETTLE 复合简写，保留但须可展开为原语序列）、`train_submit`（练习账，同原语、分账空间）。

---

## 四、生命周期状态机（单单据推导，无存档状态字段）

状态**不落库**，从字据链确定性推导（`deriveState(chain, quiz_id)`）——状态是链的投影，链是唯一真相：

```
ISSUE ──PRESENT(*)──→ OUTSTANDING（悬置中，可补交单据）
  │                       │
  │                       ├─CONFIRM→ CONFIRMED ──SETTLE(PAY)→ SETTLED_PAID（罚没）
  │                       │                │
  │                       │                └─SETTLE(UNFREEZE)→ SETTLED_RELEASED（释放）
  │                       ├─REFUSE → REFUSED（拒付，终态但留链）
  │                       └─EXPIRE → EXPIRED（失效，终态但留链）
  └─EXPIRE（未保兑即届期）→ EXPIRED
CONFIRMED ──AMEND→ 新 CONFIRM（旧者 SUPERSEDED，结算只认最新保兑）
```

规则：
- **一张 ISSUE 至多一张生效 CONFIRM**（AMEND 链的最新者）；SETTLE 必须引用生效 CONFIRM；
- **一张 CONFIRM 至多一张终态 SETTLE**（幂等：`operation_id` 唯一 = `out_request_no` 的 OIS 表达）；
- EXPIRED/REFUSED 后禁止 CONFIRM 与 SETTLE（确定性检查）；
- SUPERSEDED 不阻止链上查询——旧保兑是化石，参与回溯不参与结算。

---

## 五、rules_ref：每字据注明适用的"统一惯例"

UCP 之所以可用，是因为每张信用证明确写"subject to UCP600"。字据同理：**新增封闭字段 `rules_ref` = 开立时 R-0 科目表的内容哈希**。语义：

- 验收按**字据自己的 rules_ref** 回放（历史字据不因科目表演进而 retroactively 失效）；
- 科目表升版 = 新字据用新 rules_ref，旧字据留在旧惯例下——**惯例演化的双留痕**；
- VERIFY 报告须按 rules_ref 分组列出链上并存了几版惯例（惯例碎片化本身是仪表）。

---

## 六、八条不变式（实现期高压线，违反任意一条=内核失效）

- **I1 单据原则**：验收只审单据（封闭区），不审世界（语义）。语义意见只能以"判官建议"开放字段附言，无一票否决。
- **I2 独立性**：字据不引用任何 harness 内部状态格式；整链可导出、可携带、可在无 harness 环境独立核验。
- **I3 不可撤销**：内核无 update/delete；一切"撤销/改写"以新字据引用覆盖表达。
- **I4 严格相符**：不符点即拒收，错误清单随拒收返回（不符点通知）；LLM 零参与。
- **I5 单单一致**：字据间引用（amends/gate_key/fossils/settle→confirm）必须指向链上存在的字据（Handle 存在性校验）。
- **I6 有效期强制**：每 ISSUE 携带 half_life 与 rules_ref；EXPIRE 只改可结算性，不改历史。
- **I7 保兑具名**：CONFIRM/REFUSE/AMEND 的 signer 非空强制（AI 止步 L1）。
- **I8 结算闭合**：SETTLE 必须引用生效 CONFIRM；每 CONFIRM 至多一次终态结算（幂等键唯一）。

---

## 七、架构位置：Handle 骑在 MCP Server 的墙上

先排除两个错误位置：**墙内**（Harness 里）违反 L2——Handle 若活在宿主状态格式里，宿主一换账即殉葬；**墙外**（普通外部系统）失去强制力——皮会有第二个写通道，"唯一副作用=落字据"沦为口号。Handle 必须骑墙：住在 MCP server 进程内，但不属于这个进程；利用墙的强制力，不依附墙的任何一侧。四层展开：

1. **物理层——server 是任期保管人，不是主人。** Handle 本体是 hash 链 + rules_ref 的自验证结构；server 死了、换了、升级了、迁云了，链原封搬走（`git remote` 一改即走）。换保管人零信任成本：下任无法伪造上任的链（I2+I3）。
2. **协议层——MCP 无状态把状态赶出管道，Handle 是唯一合法收留所。** 请求无状态，字据有状态；墙负责遗忘，Handle 负责记住。无状态纪律堵死状态侧门（防插件效应范围复活），Handle 接住被墙挡在协议外的状态。
3. **权力层——Handle 给墙的三方分权补第四格。** 声明生成权在 server、暴露预算权在宿主、编排权在模型、**签署权在具名的人**。AI 止步 L1 在这张权力表上不是道德主张，是第四列没有给模型留行。
4. **环路层——状态唯一环路的两端都在墙上过境。** 读路径植入（Handle→切片→IR payload→过墙）要检疫（ProjectionPolicy 最小充分集）；写路径签署（反应→tools/call→过墙→落字据）要验关（K3 确定性验收）。绕过口岸的路都是走私——桥 Extension 只许持闸门，正因它在墙内一侧、离走私最近。

**操作性判据**：任何新组件先问住墙的哪侧——墙内组件不许碰字据，墙上组件只许经 tools/call 产生副作用，墙外组件只持有 Handle 的镜像或第三方单据。住错层的组件，无论功能多合理，都是走私通道的候选。

**信用证语言收束**：Handle 是开在边境口岸上的单据登记处。货物（语义流）从墙的两侧过，哪家的船（哪个 harness）运都行、换船不影响单据效力；单据只在口岸登记，登记处不属于任何船公司，也比任何船公司活得久。**船会沉，航线会废，口岸的登记簿还在。**

---

## 八、原语 × 四层皮肤 × 两段敞口

### 8.1 两个结构性论断

**论断一：原语集是段中立的。** 七动词在声誉段和金融段各跑一遍，变的是结算物，不是动词——L0 练习账里跑的是这套，L3 真金白银里跑的还是这套。这就是为什么暴露梯度不需要两套系统：信用证制度本身就同时服务过信用记账与现金结算。

**论断二：相变点精确落在且仅落在 CONFIRM 上。** 具名签署必须是独立原语、不能是 ISSUE 的一个参数——因为它改变的不是字据的内容，而是敞口所在的市场：签署前，字据在声誉市场流通（损失形态=面子、定价、降级）；签署后，同一字据被搬进货币市场（损失形态=冻结、罚没）。**CREDIT_AUTH 档位的本质 = 声誉段的结算语义在金融段的原生移植**——敞口已开立（具名）、占资递延（信用记账），正是 L1 段天经地义的运行方式。

### 8.2 原语 × 梯度 × 敞口段总矩阵

| 梯度 | 皮肤 | 敞口段 | 宿主原语 | 触发者 | 结算物 |
| --- | --- | --- | --- | --- | --- |
| L0 | 习字格 | 声誉（预演） | ISSUE（train_submit=练习账开证）、AMEND、VERIFY | 学员（具名） | 判据点亮、毕业判据 |
| L1 | 分诊台×落差池 | 声誉（公开） | ISSUE（gap_register=具名暴露）、PRESENT（判官双判据打分=单据呈交）、SETTLE（P_pen 重算）、EXPIRE（保鲜耗尽降级回流） | 人登记、判官呈交、时钟失效 | P_pen 定价、半衰期降级、判官信誉回流 |
| **L2** | 柜台 | **相变** | **CONFIRM / REFUSE / AMEND（具名三动词）** | **仅具名人** | stake 冻结 / CREDIT_AUTH 递延 |
| L3 | 账房 | 金融（结算永存） | SETTLE（PAY/UNFREEZE）、EXPIRE、VERIFY、SNAPSHOT | 人确认、时钟、任何人取石 | 解冻/罚没、声誉永存 |
| 台面 | 晨报 feed | 跨段 | 读原语 + EXPIRE 巡检 + 四仪表 | 系统 | 仪表数据 |

### 8.3 AI 止步定理的原语表述

- **模型可做**：ISSUE（开证）、PRESENT（交单）、VERIFY/SNAPSHOT（取石/归档）、triage_submit（事件原料呈交）——全是声誉段动作，暴露上限=归属化石；
- **模型不可做**：CONFIRM / REFUSE / AMEND（相变三动词，hidden 档物理隔离）、SETTLE 确认——全在保兑段。

**模型可以开证、可以交单、可以取石，就是永远不能保兑。** I7（保兑具名）因此不再是孤立的纪律条款，而是整张矩阵的必然空格。

### 8.4 两段的结算语义：同一 SETTLE，两种 payload

- **声誉段**：`SETTLE{type: reputation_reprice}`——P_pen 重算留痕、半衰期降级、判官信誉打脸回流。无资金动作，但每笔重算都是一张字据（可回溯、可归因）。
- **金融段**：`SETTLE{type: financial, operation_id}`——引用生效 CONFIRM，FREEZE→PAY/UNFREEZE，幂等键唯一（I8）。
- 段位**不落字段、由推导得出**（同状态机原则）：`segmentOf(receipt)` 按原语类型与 payload 推导，避免"段位字段与链漂移"的错误类别。

### 8.5 身份连续体：跨段的 signer 携带

OIS 待建项一在原语层的落点：同一 signer 的 CONFIRM/ISSUE 历史跨练习账与生产账可汇总——L0 的预演暴露记录携带为 L1/L2 的声誉前身（毕业=暴露记录的携带，不是证书的颁发）。工程形态：跨链 signer 汇总工具，凭 signer + rules_ref 在多本账上聚合——**声誉的跨账连续不靠中央征信，靠字据的可携带性**。

---

## 九、统一开发序（十步）与开放问题

| 序 | 动作 | 涉及 |
| --- | --- | --- |
| 1 | R-0 receipt_types 扩展：`present` / `settle` / `expire`；schema 增 `rules_ref`、`settle_ref`、`evidence_ref` 封闭字段 | subjects + schema.ts |
| 2 | `deriveState(chain, quiz_id)` 状态机推导器 + 违反不变式的拒绝路径 | projection.ts |
| 3 | 新工具：`present_evidence`（codemode 档）、`settle_receipt`（结算落账；资金划转仍由柜台 CLI 执行，字据是清算指令的登记）、`expire_check`（时钟巡检，保鲜报告的事件源） | server.ts |
| 4 | `Handle.append` 加 I5 引用存在性校验（amends/settle_ref/fossils 指向链上已有字据） | handle.ts |
| 5 | rules_ref 落链：ISSUE 时写入科目表内容哈希；VERIFY 按版本分组报告 | handle.ts + schema.ts |
| 6 | 冒烟：结算闭合（无 CONFIRM 不可 SETTLE）、幂等（重复结算拒）、失效后禁保兑、rules_ref 双版本并存 | smoke.mjs |
| 7 | `segmentOf` 推导（deriveState 同层）；SETTLE payload 分 `reputation_reprice \| financial` 两态 | projection.ts + server.ts |
| 8 | L1 段闭环：P_pen 重算 = SETTLE(reputation_reprice) 落链；保鲜耗尽 = EXPIRE 落链并触发降级回流 | server.ts |
| 9 | 跨链 signer 汇总工具（读原语，codemode 档）——身份连续体最小实现 | server.ts |
| 10 | 冒烟：相变路径（ISSUE→CONFIRM 前后 `segmentOf` 翻转）、CREDIT_AUTH 递延语义（CONFIRM 落链即相变，无 FREEZE 动作） | smoke.mjs |

**开放问题（留裁决）**：
- **SETTLE 触发权**：世界回答由判官建议+人确认，还是证据确定性可判（outcome 数据接口回签）即自动结算？建议首个版本走**人确认**（保守），自动结算作为独立提案过裁决。
- **promotion 复合字据**是否拆为原语序列：保留简写有 ergonomics 价值，但审计须能展开——建议保留 + VERIFY 支持展开视图。

---

## 十、一句话

**Handle = 判断的信用证体系：开立靠模型，保兑靠具名，审单靠规则，结算靠世界回答，长寿靠谁也不依赖。** 信用证让陌生人的货物可以跨洋交易，字据让模型的判断可以跨 harness 追责——前者解放了货物，后者解放的是判断。

**Handle**：`oi:design/handle-primitives-lc-v1.0/20261006`
