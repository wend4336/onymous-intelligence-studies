# 持久标识层部署指南 · Persistent Identifiers Setup

> **层 A 目标**：为 Onymous Intelligence 的命名体系铸造全球可解析的持久标识（Handle）。
> DOI 是 Handle System 的一个前缀——铸造 DOI 即把"具名智能"的立名从 git 时间戳升级为 Handle 体系内的正式注册。
> 本指南中标注 👤 的步骤必须由具名者（wend4336）在浏览器完成——授权即签署，无法代劳。

## 第一部分：Zenodo DOI（约 10 分钟）

### 原理

GitHub 官方支持 Zenodo 集成：Zenodo 用 GitHub 账户登录并为仓库打开开关后，**每次发布 Release 都会自动归档仓库快照并铸造一个 DOI**。每次 Release 得到一个**版本 DOI**（锚定该版定稿），另有一个 **concept DOI** 恒定指向最新版——引用概念用 concept DOI，引用 v1.0 定稿用版本 DOI。

### 步骤

1. 👤 打开 https://zenodo.org → **Log in** → 选 **Log in with GitHub**（授权 Zenodo 读取你的公开仓库）
2. 👤 打开 https://zenodo.org/account/settings/github/ → 在仓库列表中找到 `wend4336/onymous-intelligence-studies` → 把开关拨到 **ON**
   - ⚠️ 开关必须**先于** Release 打开，否则 Zenodo 收不到归档事件
3. 👤 回到 GitHub 仓库 → **Releases** → **Draft a new release**：
   - Tag：`v1.0.0`（Choose a tag → Create new tag on publish）
   - Title：`v1.0 · 立名定稿（The Naming Release）`
   - 描述：**粘贴本仓库 `.github/RELEASE_NOTES_v1.0.0.md` 的全文**
   - 点 **Publish release**
4. 👤 约 1–2 分钟后回到 Zenodo 的 GitHub 设置页 → 点该仓库的记录 → 页面上可见新铸造的 DOI（形如 `10.5281/zenodo.XXXXXXX`），同页可见 concept DOI
5. 👤 在 Zenodo 记录页点 **Edit**，补全元数据：Title 用 `Onymous Intelligence Studies: The Core Document (具名智能探索 · 核心文档)`，Creators 填你的具名署名，Keywords 从 CITATION.cff 复制
6. 把 DOI 发给我（或自行改两个文件）：
   - `CITATION.cff` 增加：
     ```yaml
     identifiers:
       - type: doi
         value: 10.5281/zenodo.XXXXXXX   # concept DOI
         description: "Concept DOI, always resolves to the latest release"
     ```
   - `README.md` 顶部标题下增加徽章：
     ```markdown
     [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.XXXXXXX.svg)](https://doi.org/10.5281/zenodo.XXXXXXX)
     ```

### 命名权的双重锚点（完成后）

| 锚点 | 载体 | 性质 |
| --- | --- | --- |
| 第一锚 | commit `f90900b`（2026-09-16） | git 历史，不可篡改 |
| 第二锚 | DOI `10.5281/zenodo.XXXXXXX` | Handle System 全球可解析，机构背书（CERN/DataCite） |

## 第二部分：w3id.org 永久 URI（术语命名空间，约 15 分钟）

### 原理

w3id.org 是社区运营的永久标识符服务（W3C 永久标识社区组）：向其 GitHub 仓库提交一个目录即可获得 `https://w3id.org/<名字>/` 命名空间，301/303 重定向规则由目录里的 `.htaccess` 定义，**永久托管、永久可改**（改解析目标 = 再提 PR）。

本体系将占用命名空间：**`https://w3id.org/onymous/`**——术语的正式英文名将获得永久 URI，如：

```
https://w3id.org/onymous/attestation   → GLOSSARY.md 中"具名签署"词条
https://w3id.org/onymous/ablation-zone → 第 0 篇定义 2.1
https://w3id.org/onymous/TraversalEvent → spec/traversal-event.md §1
```

论文中引用术语时写 w3id URI 而非 GitHub 链接——GitHub 组织改名、迁移都不影响解析。

### 步骤

1. 👤 Fork https://github.com/perma-id/w3id.org （网页右上角 Fork）
2. 把本仓库 `w3id/onymous/` 目录下的两个文件（`.htaccess`、`README.md`）复制进你的 fork，路径为 `onymous/.htaccess` 与 `onymous/README.md`
   - 可用网页操作：fork 的仓库页面 → Add file → Upload / Create new file
3. 👤 在你的 fork 页面点 **Contribute → Open pull request**，标题：
   `Add /onymous/ namespace — Onymous Intelligence Studies terminology`
4. w3id 维护者通常数小时到数天内合并；合并后立即可用 `https://w3id.org/onymous/`
5. 合并后通知我，把 w3id URI 写回 `GLOSSARY.md` 与 `CITATION.cff`

### ⚠️ 前置检查（建议先做）

打开 https://w3id.org/onymous/ ——若返回 404，命名空间未被占用，可直接占用；若已被占用，换名（如 `onymous-intel`）并同步修改 `.htaccess` 内的所有规则。

## 第三部分：完成核对单

- [ ] Zenodo 开关 ON（先于 Release）
- [ ] Release v1.0.0 已发布（含立名文案）
- [ ] 版本 DOI 与 concept DOI 已取得
- [ ] CITATION.cff 写入 DOI / README 徽章就位
- [ ] w3id.org/onymous/ PR 已提交
- [ ] PR 合并，URI 可解析
- [ ] 以上变更 commit 入库（第二圈年轮）
