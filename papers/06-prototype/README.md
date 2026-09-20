# 模块六 · 最小原型与对照实验（已立项 V0.1）

**Module 6 · Minimal Prototype and Controlled Experiment (Commissioned V0.1)**

**状态**：已立项 V0.1（Commissioned）——立项文档：[commissioning-v0.1-jev-typed-decision.md](./commissioning-v0.1-jev-typed-decision.md)（类型化决策件 Jev 进入对照设计，2×2 factorial）。以下为原占位页立项依据，保留备查——依据附件 A 发现三（不存在通用柜台，只存在类型的柜台），原型的设计必须在类型学约束下展开。

---

## 立项依据（已定）

- **首选原型域**：研究核查类（research verification）——裁决结构最清晰（断言—证据—判定），意外型 Gap 占比最高（附件 A §1.4）。
- **阴性对照域**：视频分发类（video distribution）——零柜台的反例标本（附件 A §1.2）。
- **对照设计**（模块二 §5）：同一任务，皮肤式界面（聊天窗）对柜台式界面，测量组间差异：裁决质量、入账密度、年轮深度、具名者主观价值报告。
- **最小闭环**（模块二 §5）：填单 → 验单 → 签署/拒签/退单 → 入账 → 对账，五环齐备即为柜台；缺一即为皮肤。
- **首个检验点**（模块五 §6.4）：柜台汇率 ξ 与贴现率 r 的可测性。
- **首个可证伪假设**（附件 A 发现四）：意外率 σ 的类型分布排序。

## 立项前待决问题

1. 数据层是否直接采用 [`spec/traversal-event.md`](../../spec/traversal-event.md) 作为事件契约；
2. 挂账待决区（Suspense Zone）的时效与升级规则（提醒／转签／显式作废）；
3. 回溯窗口长度（建议 30 天起——模块三 §6，"由谁拍板"见模块三开放问题 4）；
4. 首个具名者（first Staked Attestor）的冷启动机制（模块四 §5.2：首签引导／默认挂账／低 stake 起步）。

> **启动命题（模块四 命题 5.1）**：boot = first attestation, not first token。
> 本原型的第一次运行，以一笔具名签署启动，不以一次生成启动。
