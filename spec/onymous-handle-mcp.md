# SPEC · onymous-handle：Handle MCP 服务设计蓝图

> **层 B 目标**：把 Handle 建成为 MCP 的一部分——目前 MCP 生态中不存在 Handle 服务，本文件把它从蓝图建为事实。
> **定位**：具名柜台的第一个"器"（模块三的工程化身），模块六《最小原型与对照实验》的前置设施。
> **决策记录（2026-09-16 具名者拍板）**：独立仓库 `onymous-handle`；账房 = git；Handle 方案 = `oi:` 自有方案。
> **状态**：蓝图（Blueprint）。代码实施待层 A 落地后开工。

## 1. 职责定义

onymous-handle 解决**消融分类的溯源问题**：消融带上的每一次穿越（traversal）被分类入账之后，必须可以被永恒地指认与回溯。它为 TraversalEvent 提供三件东西：

1. **铸造（mint）**：每个入账事件获得一个全局唯一、永不复用的 handle；
2. **解析（resolve）**：handle → 账上记录（含 signer、stake、ledger_state）；
3. **回溯（trace）**：判据 0.3 的工程化——任给一个已生效动作，沿账回溯到具名签署；回溯中断之处，报告蒸发或坏账。

## 2. Handle 方案：`oi:` 命名方案

```
oi:<ledger-id>/<event-ulid>

示例：oi:onymous-intelligence-studies/01J8ZK3M9WQPXB7R2T4N6V0YHA
```

- **ULID**：时间有序、全球唯一、无碰撞协调成本；
- **解析目标**：git 仓库中带 commit SHA 的 permalink（如 `https://github.com/<owner>/<repo>/blob/<sha>/ledger/attestations.jsonl#L<n>`）——不可篡改、自带时间锚、零外部依赖；
- **与层 A 的关系**：层 A（DOI/w3id）给**术语与版本**立名；`oi:` 给**事件**立名。术语的 handle 永久指向定义，事件的 handle 永久指向账。

## 3. 账房：git 即账房

账本即仓库内的追加式日志：

```
ledger/
└── attestations.jsonl    # 每行一个 TraversalEvent（spec/traversal-event.md §1 的数据结构）
```

入账规则（直接落实设计原则）：

- **P1 可归属**：缺 `signer` 或 `stake` 的行**拒绝写入**（schema 校验在 mint 时强制）；
- **P3 未入账不生效**：handle 只发给 `ledger_state` 完成状态机迁移的事件；挂账中的事件只有临时 ID，不入账、不可解析；
- **不可撤销**：jsonl 只追加不修改；退单/补签是新行，引用原 handle（`ring_refs` / `supersedes`）——痕迹不灭；
- **坏账可计算**：任何"已入账"而缺 signer/stake 的记录（绕过本服务写入者）在 `verify` 时被标记 bad_debt。

## 4. MCP 工具面（Tools）

| 工具 | 入参 | 出参 | 语义 |
| --- | --- | --- | --- |
| `mint_handle` | TraversalEvent（须含 signer+stake） | `oi:` handle + commit SHA | 签署入账，铸造 handle |
| `resolve_handle` | `oi:` handle | TraversalEvent 全文 | 解析指认 |
| `trace_attestation` | 任意 action/handle | 签署链（或断裂点报告） | 判据 0.3：沿账回溯 |
| `verify_ring` | handle + 回溯窗口 | ring(e) 三谓词真值表 | 年轮化判据（留痕/归属/可引） |
| `counter_metrics` | 时间窗 | M1–M9 指标值 | 年轮指标族（模块三 §3） |
| `detect_bad_debt` | 时间窗 | 坏账清单 | 坏账防护的计算化 |

**设计红线**：本服务**只记账、只回放、不代签**——不得提供任何"以人名义默认通过"的工具（防冒签是存在理由，不是功能项）。激励红线同模块三对策 5.2：指标只作诊断与回放。

## 5. 技术选型与仓库骨架

- **语言/SDK**：Python + FastMCP（实现最薄；TraversalEvent 的 schema 校验用 pydantic，与 spec 的字段一一对应）
- **git 操作**：GitPython（追加 jsonl + commit），签名 commit（`gpgsign`）预留——签署的密码学强化是 v0.2 议题

```
onymous-handle/
├── README.md                 # 器的第一件：定位、安装、快速开始
├── LICENSE                   # MIT（与 spec/ 一致）
├── pyproject.toml
├── src/onymous_handle/
│   ├── server.py             # FastMCP 入口，工具注册
│   ├── schema.py             # TraversalEvent（pydantic，对齐 spec/traversal-event.md §1）
│   ├── ledger.py             # git 账房：追加、SHA permalink 生成、状态机迁移
│   ├── handles.py            # oi: 方案：铸造（ULID）与解析
│   ├── metrics.py            # M1–M9 计算（模块三 §3）
│   └── guard.py              # 坏账检测 + 防冒签断言
├── tests/                    # 判据即测试：0.3 回溯、年轮三谓词、坏账检出
├── server.json               # MCP Registry 上架清单
├── Dockerfile                # → GHCR
└── .github/workflows/ci.yml  # pytest + 发布流水线
```

## 6. GitHub 部署路径（实施阶段）

1. **建仓**：`wend4336/onymous-handle`（Public；建仓库即一次具名事件——与开柜台的资格问题呼应，模块二开放问题 3）
2. **CI**：GitHub Actions——pytest（判据级测试套件）+ lint；main 分支保护（require PR + 具名 review，**仓库自身的开发就走在柜台上**）
3. **发布**：PyPI Trusted Publishing（OIDC，免 token）；GitHub Release 打 tag；可选 Zenodo 开关（与主仓同法，获得自身 DOI）
4. **上架**：向官方 MCP Registry 提交（`server.json` + mcp-publisher）；npm/PyPI 包名与仓库同名
5. **远程托管（可选）**：Docker 镜像推 GHCR → 部署 Streamable HTTP 端点（Fly.io / Cloudflare Workers）+ OAuth 2.1 授权——**授权即签署**：哪个具名者授的权，入谁的账
6. **回接主仓**：主仓 README 与 ROADMAP 增加"器已上线"徽章与安装说明；本服务的第一笔入账事件即主仓的 build-log-000

## 7. 与既有体系的焊接点

| 既有概念 | 本蓝图的落实 |
| --- | --- |
| 判据 0.3（沿账回溯） | `trace_attestation` 工具 |
| TraversalEvent（模块一 §5） | `schema.py` pydantic 模型 |
| ledger_state 状态机 | `ledger.py` 迁移守卫 |
| 年轮三判据（模块一 §3.3） | `verify_ring` 工具 |
| 指标族 M1–M9（模块三 §3） | `counter_metrics` 工具 |
| 坏账防护（模块二 2.7） | `detect_bad_debt` + mint 时 schema 强制 |
| 防冒签（全体系红线） | 不提供任何代签工具；commit 须 GPG 签名（v0.2） |

## 8. 开放问题（开工前待拍板）

1. 多仓库账本的分片策略：一个柜台一本账，还是一本总账多柜台？（附件 A 发现三：柜台是一族）
2. `oi:` handle 是否注册为 URN 命名空间（IANA）——正式化收益 vs 流程成本；
3. GPG 签名 commit 的密钥由谁持有：具名者个人密钥 or 柜台服务密钥（后者是否构成代签风险）；
4. 远程托管模式下，OAuth token 的签发是否本身需要走一次柜台签署（递归自举问题）。
