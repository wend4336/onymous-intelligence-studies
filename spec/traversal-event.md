# SPEC · TraversalEvent：穿越事件的形式化规格

> **地位**：本文件是"器"（模块三《年轮测量学》）的可计算接口，也是未来模块六原型的数据层契约。
> 文本依据：模块一 §5（数据结构）、§3.3（年轮化判据）；模块三 §2（谓词编译）、§3（指标族）；模块四 §3.1（Gap 周期）。
> 许可：MIT（见同目录 LICENSE）。

## 1. TraversalEvent · 穿越事件最小数据结构（模块一 §5）

```
TraversalEvent = {
  id:            事件唯一标识（event id）
  direction:     ∈ {生成流 generation, 具名签署流 attestation, 状态流 state,
                    装配流 assembly, 配置流 configuration, 呈现流 presentation}
  subtype:       ∈ {签署 attested, 拒签 declined, 退单 chargeback, 补签 retroactive,
                    会签 countersigned, 冒签 forged, …}   // 仅具名签署流使用
  carrier:       载体引用（输出/裁决单/状态写入/…）
  signer:        具名者标识（具名签署流必填，其余流可空）
  stake:         押注声明（判什么、依据什么、押上什么）
  revocable:     布尔，是否可撤销
  ledger_state:  ∈ {挂账 pending, 已入账 ledgered, 已退单 returned, 坏账 bad_debt}
  ring_refs:     引用本事件的后续穿越列表（年轮深度的原始数据）
  timestamp:     时间戳
}
```

## 2. ledger_state 状态机（模块一 §5）

具名签署流的账态迁移：

```
挂账 pending ──(签署 attested / 拒签 declined)──▶ 已入账 ledgered
挂账 pending ──(退单 chargeback)──▶ 挂账' pending'
已入账 ledgered ──(审计发现伪造)──▶ 坏账 bad_debt
```

**坏账的计算判据**：无 `signer` 与 `stake` 而 `ledger_state = ledgered` 的记录——形式化使"坏账"成为可计算的字段而非修辞。

## 3. 年轮谓词（模块三 §2）

```
traced(e)     ≡  e 存在完整记录（direction, carrier, timestamp 非空）
attributed(e) ≡  e.signer ≠ ∅  ∧  e.stake ≠ ∅
citable(e)    ≡  e.ring_refs 在时间窗内非空（存在后续穿越引用 e）
ring(e)       ≡  traced(e) ∧ attributed(e) ∧ citable(e)
```

注意：`citable` 是**时间开放谓词**——年轮判定必须带回溯窗口（建议 30 天起）。年轮是长出来的，不是当场打印的。

## 4. Gap 周期（模块四 §3.1，与状态机同构）

```
押注（开 Gap）→ 悬置（挂账待决）→ 世界回答 → ┬ 收敛（入账，留年轮）
                                            ├ 断裂（退单／拒签，Gap 重开）
                                            └ 伪造（冒签，伪闭合）
```

Gap 四态：验收型 confirmatory｜意外型 serendipitous｜断裂型 rupture｜伪 Gap forged closure。

## 5. 指标族 M1–M9（模块三 §3）

| 编号 | 名称 | 符号 | 定义 |
| --- | --- | --- | --- |
| M1 | 签署密度 attestation density | ρ | 具名签署流事件数 / 生成流事件数（同时间窗） |
| M2 | 蒸发谱 evaporation spectrum | η₁ η₂ η₃ | 三阶蒸发各自占比（¬traced / 未裁决 / 留而未引） |
| M3 | 年轮深度 ring depth | d(e)，d*(e) | 事件被后续穿越直接引用次数；d* 为传递闭包深度 |
| M4 | 签付复利 attestation compounding | c(s) | 具名者 s 全部签署的 d* 加权和（时间衰减） |
| M5 | 信任折旧率 trust depreciation | δ | 免审通道事件抽检误判率的滑动窗 |
| M6 | 坏账率 bad-debt ratio | β | bad_debt 事件数 / 已入账事件总数 |
| M7 | 挂账滞留 pending dwell time | — | 挂账待决区事件滞留时长分布 |
| M8 | 柜台汇率 counter exchange rate | ξ | 单次签署投入时间 / 其后产生的 d*(e) |
| M9 | 意外率 serendipity rate | σ | 意外型 Gap 占全部收敛 Gap 之比 |

## 6. 防伪协议（模块三 §5.2，Anti-Goodhart）

1. **引用质量约束**：ring_refs 只统计跨会话、跨任务的实质性引用；自引与同源批量引不计；
2. **三角验证**：每项指标须能由两个独立数据源核算，背离超阈值即触发对账；
3. **去单指标化**：任何单项年轮指标不得单独接入激励或排名——八项指标只作诊断与回放。

## 7. 货币层参数（模块五）

- 贴现率 r：`PV = E[V]/(1+r)^t`——系统对时间的定价，具名智能最深刻的政策参数；
- 非转让核心（命题 3.2）：可贴现、可流通的是收敛的结果；**不可贴现、不可流通的是名字本身**。
