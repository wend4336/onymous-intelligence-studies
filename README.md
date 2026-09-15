# Onymous Intelligence Studies · 具名智能探索

> **命题 0.1（具名智能，Onymous Intelligence）**
> 存在一种智能形态，其标志不是参数规模、推理速度或自主性，而是——**每一个产生后果的动作，都可归属于一个具名的裁决者。**
> 生产的可以匿名（anonymous），代谢的可以匿名，**生效的必须具名（onymous）**。
>
> **Proposition 0.1 (Onymous Intelligence).** There exists a form of intelligence whose hallmark is not parameter scale, inference speed, or autonomy, but this: **every action that takes effect is attributable to a named adjudicator.** Production may be anonymous; metabolism may be anonymous; **effectuation must be onymous.**

---

## 立名宣言 · Declaration of the Name

本仓库是 **"具名智能"（Onymous Intelligence）** 概念的**立名之地（the place of naming）**。

- **命名**：Onymous Intelligence（具名智能），取自希腊语 *onyma*（名字），是 *anonymous* 的严格反义词；身份研究领域已有 *onymity*（具名性）的先行用法——"披露谁实施了某个特定动作"。
- **对位**：与具身智能（Embodied Intelligence）严格对位——具身让智能进入**物理世界**（以身体为存在方式，承受物理后果）；具名让智能进入**责任世界**（以名字为存在方式，承受人的后果）。具身回答"AI 如何在场"，具名回答"人如何在场"。
- **命名锚点**：本仓库的首次公开提交（initial public commit）即本概念公开立名的时间锚点。git 历史不可篡改地记录了术语体系、命题编号与判据的先后次序——**账在，名在。**
- **立名日期**：2026-09-16（v1.0 定稿六篇一附件全璧首次公开）。

This repository is the **place of naming** for **Onymous Intelligence**: the strict antonym of *anonymous*, the strict counterpart of *Embodied Intelligence*. Embodiment brings intelligence into the physical world; onymity brings intelligence into the world of responsibility. The initial public commit of this repository is the naming anchor of the concept.

## 判据 0.3 · The Test

一个运行中的系统是具名智能，当且仅当：**任取其一个已生效的动作，都能沿账回溯到一次具名签署（attestation，或一次具名的免审授权）。**回溯中断之处，即为蒸发带（evaporation）或坏账（bad debt）。

A running system is an onymous intelligence if and only if: pick any action that has taken effect, and you can trace it back along the ledger to a named attestation. Where the trace breaks, there is evaporation or bad debt.

## 体系结构 · The Six-Layer Loop

六层闭环：名、法、制、器、动、币。每一层都被另一层需要，无悬空概念。

| 层 | 所立 | 篇目 | 核心命题 | 回答的问题 | 位置 |
|---|---|---|---|---|---|
| **名** | 立名 | 第 0 篇《命名论文》 | 命题 0.1（具名智能） | 这片地带叫什么 | [`papers/00-naming/`](papers/00-naming/) |
| **法** | 立法 | 模块一《消融穿越类型学》 | 命题 2.7（六路径全图） | 哪些穿越算数 | [`papers/01-law/`](papers/01-law/) |
| **制** | 立制 | 模块二《具名柜台设计学》 | 七功能件＋设计原则 P1–P5 | 裁决从哪进门 | [`papers/02-institution/`](papers/02-institution/) |
| **器** | 立器 | 模块三《年轮测量学》 | 命题 1.1（反指标定理）＋指标族 M1–M9 | 哪次穿越留下了年轮 | [`papers/03-instrument/`](papers/03-instrument/) |
| **动** | 立动 | 模块四《签付动力学》 | 命题 1.2（空转定理）、命题 5.1（启动命题） | 系统为何动、向哪动 | [`papers/04-dynamics/`](papers/04-dynamics/) |
| **地** | 接地 | 附件 A《领域类型学》 | 发现一~四（六件类型标本） | 理论在哪些领域落地 | [`papers/04-dynamics/appendix-a-domain-genres.md`](papers/04-dynamics/appendix-a-domain-genres.md) |
| **币** | 立币 | 模块五《货币是对裁决结果收敛的贴现》 | 命题 1.3（货币命题）、命题 3.2（非转让核心） | 动的价值如何跨越时间与领域 | [`papers/05-currency/`](papers/05-currency/) |
| — | 待立项 | 模块六《最小原型与对照实验》 | ξ 与 r 的可测性 | 理论如何被检验 | [`papers/06-prototype/`](papers/06-prototype/) |

```
立名（第0篇）──术语──▶ 立法（模块一：六路径）
    ▲                      │
    │                      ▼
    │                立制（模块二：具名柜台七件）
    │                      │
    │                      ▼
    │                立器（模块三：年轮指标 M1–M9）
    │                      │
    │                      ▼
    │                立动（模块四：Gap 周期·空转定理）
    │                      │
    │                      ▼
    └──货币信用的地基──立币（模块五：收敛的贴现）
         （附件 A：六件领域类型标本，把全部抽象落回地面）
```

## 核心术语 · Core Terms（精选，全表见 [GLOSSARY.md](GLOSSARY.md)）

| 口语层 | 正式层 | English |
|---|---|---|
| 具名智能 | 具名智能 | **Onymous Intelligence (OI)** |
| 会拍板的人 | 会签付的人 | the Staked Attestor |
| 三者交界 | 消融带 | Ablation Zone |
| 穿越 | 穿越 | traversal |
| 裁决进入系统 | 入账 | ledgering |
| 柜台 | 具名柜台 | the Counter / Attestation Counter |
| 年轮 | 年轮 | growth rings |
| 坏账／冒签 | 坏账／冒签 | bad debt / forged attestation |

**术语规范（规则 7.3）**：任何新词进入本体系，须同时给出：口语名、正式名、英文名、判据（如何核验一个实例是否属于该词）。废止词：收割、实缴、口岸、审判。

## 仓库结构 · Repository Layout

```
onymous-intelligence-studies/
├── README.md                 # 本文件：立名宣言
├── GLOSSARY.md               # 术语总表（英汉，含判据与废止词）
├── ROADMAP.md                # 六层路线图与下一阶段
├── CITATION.cff              # 引用格式与命名优先权凭证
├── LICENSE                   # 文本 CC BY 4.0
├── papers/                   # 六篇一附件（按层分立）
│   ├── 00-naming/            # 名
│   ├── 01-law/               # 法
│   ├── 02-institution/       # 制
│   ├── 03-instrument/        # 器
│   ├── 04-dynamics/          # 动（含附件 A · 领域类型学）
│   ├── 05-currency/          # 币
│   └── 06-prototype/         # 待立项
├── compendium/               # v1.0 合订本定稿快照 + 总附录
└── spec/                     # 器的形式化接口（TraversalEvent / 指标族）
```

## 引用 · Citation

如引用本术语体系或命题，请使用 [CITATION.cff](CITATION.cff)（GitHub 页面右侧 "Cite this repository" 可直接导出 BibTeX / APA）。

```bibtex
@misc{onymous_intelligence_studies_2026,
  title  = {Onymous Intelligence Studies: The Core Document},
  author = {{Onymous Intelligence Studies Project}},
  year   = {2026},
  url    = {https://github.com/OWNER/onymous-intelligence-studies},
  note   = {Version 1.0. Naming anchor: initial public commit, 2026-09-16.}
}
```

## 许可 · License

- 论文文本（`papers/`、`compendium/`、`GLOSSARY.md`）：[CC BY 4.0](LICENSE)——署名即可使用，署名即具名。
- 形式化规格与代码片段（`spec/`）：MIT——见 [`spec/LICENSE`](spec/LICENSE)。

署名要求与本文档的精神一致：**使用可以匿名，生效必须具名。**

## 参与 · Contributing

本体系的全部**开放问题**（各篇末节）欢迎以 Issue 讨论；任何新术语的 PR 必须通过规则 7.3 四件检查（见 [PULL_REQUEST_TEMPLATE](.github/PULL_REQUEST_TEMPLATE.md)）。讨论礼仪遵循同一条原则：**观点可以匿名提出，入账必须具名。**
