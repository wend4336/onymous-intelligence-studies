# Commit：皮作为 MCP Server —— 从 Codex Computer Use 到 OIS 账房的工程路线确认（研究发布版）

```javascript
COMMIT   oi:context/skin-as-mcp-server-v1.0/20261005
PARENT   oi:context/ledger-stake-payment-v1.2/20261002（账房建设与 Stake 柜台支付·签发版）
AUTHOR   OIS 工程组（Kimi K3 协同）
DATE     2026-10-05
STATUS   签注人：＿＿＿＿＿＿＿＿＿＿    签注时间：＿＿＿＿＿＿
MESSAGE  皮=MCP Server 路线回证闭合 · API 三假设失效论 · 对齐 OIS v1.2 四件落地（v0.2，冒烟 23/23）
VERIFY   事实断言经 claim-graph 回证（双源互证处已标注）；设计推演为体系内推导；悬空项显式列示，零悬空入正文
SCOPE    研究发布：工程路线判断；商业 Knowhow 与五界面具体内容本版省略，另册发布
```

---

## 一、研究主线：三次回证闭合的推理链

**环节一【事实·双源】**：Codex 的 Computer Use 以 MCP Server 形态实现——`codex mcp list` 显示 `computer-use` 作为 MCP server 注册，指向 openai-bundled 插件；第三方文档佐证其为 "Codex-native MCP plugin"。推论边界：MCP 是接口层，桌面操控由底层原生服务（macOS CUAService）执行——**"能力以 MCP Server 上架"的形态成立**。

**环节二【事实·双源】**：UI 可经 MCP Server 开发。MCP Apps（SEP-1865）于 2026-01-26 转正：server 经 `ui://` scheme 交付自包含 HTML bundle，宿主沙箱 iframe 渲染，`postMessage` 上走 JSON-RPC 双向通信；`visibility:["app"]` 工具模型不可见、仅 iframe 可调。OpenAI 官方文档原话即此路线："Add UI to your MCP server"。

**环节三【观点·体系内推导】**：皮（裁决/签注界面）不是 Extension，是 MCP Server。三条硬理由：Extension 无沙箱（与宿主同权），而皮高频迭代、面向非技术裁决者；皮的"零写权限"纪律需要协议强制而非工程自觉（iframe 碰不到宿主，副作用唯一通道=tools/call）；皮的身份应从"已安装"迁到"已提交"（`ui://` URI 即 cache key，版本=commit）。

**Pi 1.0 映射【事实前提见底稿，映射为观点】**：皮不占编译点位（Extension 仅留极薄的桥）；皮的工具落五级暴露谱系——模型侧 codemode 档，皮侧 hidden 档，**`hidden` ↔ `visibility:["app"]` 是同一权限边界的两种表达**；Handle（append-only 字据库）落 Durable 时序/状态层，Durable 实验性故当前以 JSONL+hash 链自实现，schema 不变、存储可换。

---

## 二、API 重定义：三个隐性假设同时失效

由环节一、二外推的一般性判断【观点层，事实锚点已回证】：

1. **消费者假设失效**：API 的消费者从"读文档的开发者"变为"读声明生成调用的模型"。文档→IDL/符号表，SDK→运行时自发现（`server/discover`），编排示例→模型自写控制流（Codemode）。**编排权从提供方文档页转移到消费方模型手里**；API 设计标准从"SDK 顺手"变为"声明的语义坐标精确到模型不歧义"。
2. **交付物假设失效**：双向溶解——API 长出 UI（MCP Apps，`ui://` 交付交互面），UI 变成 API（Computer Use 使无 API 系统亦可被 agent 消费）。消费者清单裂为三方（模型/应用/人），权限按消费者分档。
3. **信任模型假设失效**：认证+限流不够用了。模型一秒生成一百个语义各异的调用，"次数"失去意义，问题变为"这次调用的后果谁承担"：认证→具名签署，计费→stake 占资，rate limit→敞口管理，日志→append-only 字据链。**未来 API 的写端点内嵌一个柜台，这是重定义后的默认形态。**

附带推论：MCP 无状态化（2026-07-28 移除 initialize 握手）是定义性动作——状态被驱逐出协议，**驱逐到哪，哪就是权力中心**。协议越无状态，账房越值钱。

---

## 三、工程落地确认（v0.2，冒烟 23/23）

对齐 OIS v1.2 的四处缺口已闭合，五界面具体内容省略，仅记架构动作：

1. **蒸发带门控（架构级）**：桥 Extension 挂 `tool_call`（bail 派发），高危工具拦截→`gate_key=sha256(tool+args)` 提交裁决→挂起等具名字据落链→放行/拒行，超时 fail-closed。押注物理上发生在模型与动作之间。
2. **字据金融段（字段级）**：schema 增 `signer`（签署类强制非空）、`stake{auth_no,amount,operation_id,status∈FREEZE/UNFREEZE/PAY/SUPERSEDED/CREDIT_AUTH}`、`parent_tool_call_id`（嵌套传票）。
3. **R-0 科目表三重生成（生成级）**：封闭枚举一次定义、三处生成——确定性验收器（落链前执行）/ 渲染模板规格（serve 时注入 bundle）/ 快照裁剪规则（按科目域不按 token 预算）。消灭三者漂移。
4. **暴露梯度构件闭环（构件级）**：L0–L3 五界面齐备，全部走 `ui://` 交付、hidden 档签署工具、append-only 落链。

**一次失败化石记录**：习字格"默写连续 5 张一次通过"的 streak 语义——测试预期写错（以为失败后旧记录仍计入），实现返回清零才是对的。此类"测试错、实现对"的化石留入回归集，防止未来把连续语义"修"坏。

---

## 四、悬空清单（未验证，禁止当事实引用）

1. **Pi 1.0 是否实装 MCP Apps 渲染**（`ui://` 在 Pi TUI/桌面端的渲染能力）——不支持则浏览器当宿主，server 端不变，但"皮内嵌 Pi"的体验降级。
2. **Pi hidden 档与 MCP `visibility:["app"]` 叠加语义**——理论双重隐藏，实测待做。
3. **桥 Extension 的 Pi API 确切签名**——按点位表推断，真机接驳需校准（bail 短路语义已回证）。
4. **Durable multiplayer 冲突解决语义**——多皮并发签署的写冲突行为未披露；当前以 append-only 无冲突规避。
5. **微信支付分账/预授权接口细节**——延续 v1.2 悬空，二期补齐回证后评估。
6. **支付宝各接口费率/冻结上限/行业准入**——以商户签约合同为准。

---

**Handle**：`oi:context/skin-as-mcp-server-v1.0/20261005`
**关联交付**：设计文档《Pi 前端皮肤设计：皮作为 MCP Server（Pi 1.0 映射版）》；可运行脚手架 `pi-skin/`（17 工具、5 bundle、冒烟 23/23）；五界面预览版本 e0abab4。
