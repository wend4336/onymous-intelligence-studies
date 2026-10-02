# Pi Harness 全栈架构定义（ADR）— OIS 签发版 v1.2（增量）

```javascript
COMMIT   oi:adr/pi-harness-fullstack-v1.2/20261002
PARENT   oi:adr/pi-harness-fullstack-v1.1/20261001（已签发 · wend4336 · 20261002）
AUTHOR   OIS 工程组
DATE     2026-10-02
STATUS   签注人：＿＿＿＿＿＿＿＿＿＿    签注时间：＿＿＿＿＿＿
MESSAGE  Pi 1.0.0 对照：诊断三段式入柜台规范；版本策略改钉 1.x；[待建]清单不变
VERIFY   断言图 i1–i7，全部回证通过、零悬空入正文
```

**变更摘要（diff v1.1 → v1.2）**

1. 柜台拒绝传票的 reason 字段采用 Pi 1.0 确立的**诊断三段式**标准：①指出近似合法项（did-you-mean）②给出期望形状 ③指向查询入口；
2. 底座版本策略从"钉死 0.99"修订为"**钉 1.x 轨道、按 changelog 常规升级**"（semver 稳定承诺期生效）；
3. v1.1 全部 **[待建] 标注维持不变**——Pi 1.0.0 未建对象萃取/IR 拓扑/快照组装器/Handle 链接器，确认其不在 Pi 路线图，属 OIS 建设项；
4. 悬空清单新增一条：1.0 changelog 未明示扩展 API 冻结的具体范围（事件名/钩子签名/RPC 协议），首个 1.x 小版本发布时复核。

---

## 1. 对照基线

- 对照版本：Pi **0.99**（MCP / codemode / context mode 版）→ Pi **1.0.0**（2026-10-01 发布，pi.dev 官方 changelog 与 GitHub Releases）。
- 总判定：**1.0 是"编译器诊断质量 + 提示词瘦身"的发布，不是架构变更。** 与编译链路直接相关的动作集中于 codemode 两处；OIS 全部 [待建] 项在 1.0 中依然缺席。

## 2. 编译链路逐段对照

| 编译段 | 0.99 | 1.0.0 | OIS 影响与动作 |
|---|---|---|---|
| 前端·schema 预编译 | tool_use JSON | 不变 | 无 |
| 前端·codemode 载荷 | 工具声明完整进提示词 | **瘦身约 40%**（GPT-5.6 请求 5,300→3,300 token）；工具声明改一行式调用说明，详细参考由模型按需阅读 | **科目表设计规范**：传票 schema 的模型可见面一行式，验收细节不进提示词——模型只需知道怎么调用，不需知道怎么验收 |
| 类型检查·诊断 | `{block:true,reason}` 机制 | codemode 错误升级为"教模型恢复"：`tools.Bash` → 建议 `tools.bash`；畸形参数返回期望形状；未知模型指向 `models.getAvailableOfType()` | **柜台规范修订（本 commit 核心）**：拒绝 reason 采用三段式——近似合法项 / 期望形状 / 查询入口 |
| codemode 脚本探针 | `typeof tools.name` | 必须改为 `"name" in tools` | R-4′ 合成数据与旧脚本迁移注意；传票存在性检查语义由 Pi 代为养成 |
| IR/对象拓扑 | 无 | 无 | [待建] 维持 |
| 优化 pass/快照 | 无 | 无（渲染内存降至约 1/5 属 TUI 性能，与 K5 无关） | [待建] 维持 |

## 3. 编译链路之外的三个 OIS 相关变化

1. **MCP OAuth 硬化**：RFC 9207 `iss` 校验（防授权码串台）、凭证按服务器名+URL 分别存储、step-up 登录保留已授权 scope；修复 deferred MCP 工具在 resume/reload 时被丢弃的缺陷——账房 Handle 化石指针的外部工具通道更稳，快照回放后工具面完整。
2. **`--provider` 不带 `--model` 从静默忽略改为直接报错**——模型版本钉住纪律获工具侧强制力，防静默漂移多一层兜底（呼应 v1.1 §4 账房故障域"版本静默漂移"）。
3. **codemode `models.*` 命名空间扩张**：新增 `generateImages()`，与 `classify()` 并列、同计入会话成本，扩展可经 `ctx.modelRegistry.generateImages()` 调用——classifier models（本地判官）接入点在 1.0 延续且命名空间生长中，OIS 判官层路径稳定。

## 4. 版本策略修订

- 旧条款（0.99 时期）：pre-1.0 变动风险高，钉死版本号、升级走闸门。
- 新条款：**钉 1.x 轨道，按官方 changelog 常规升级**；跨 1.x→2.0 仍走闸门评审。
- 保留风险项：扩展 API 冻结范围未在 changelog 明示（事件名/钩子签名/RPC 协议三个面），入悬空清单，首个 1.x 小版本发布时复核后解除。

## 5. 对既有文档的回写关系

- ADR v1.1 签发版正文**零改动**（本 commit 为纯增量叠加，不修改父 commit）；
- 文档一 §五点五（Pi 实时状态交互论证）：四条回路的协议证据全部基于 RPC/扩展 UI 子协议，1.0 未触及，结论维持；
- 四页皮肤原型（`train/gap/index`，版本 `105df64`）：无依赖变更，柜台页"拒绝理由"渲染区在真机接入时按三段式格式化。

---

**Handle**：`oi:adr/pi-harness-fullstack-v1.2/20261002`
