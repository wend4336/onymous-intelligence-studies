#!/usr/bin/env bash
# push.sh — Onymous Intelligence Studies 一键立名推送脚本
#
# 用法（在你的本机执行，Token 不落地、不进入对话）：
#   export GH_TOKEN=<你的 PAT，需 repo 权限>
#   export GH_OWNER=<你的 GitHub 组织名或用户名>
#   ./push.sh
#
# 脚本行为：在 GH_OWNER 名下创建公开仓库 onymous-intelligence-studies 并推送。
# 公开时间戳（initial public commit）即命名优先权锚点。

set -euo pipefail

REPO="onymous-intelligence-studies"
: "${GH_TOKEN:?请先 export GH_TOKEN=...}"
: "${GH_OWNER:?请先 export GH_OWNER=...}"

if ! command -v gh >/dev/null 2>&1; then
  echo "需要 GitHub CLI（gh）：https://cli.github.com/" >&2
  exit 1
fi

echo "${GH_TOKEN}" | gh auth login --with-token
gh repo create "${GH_OWNER}/${REPO}" \
  --public \
  --description "Onymous Intelligence Studies · 具名智能探索 — 立名之地：名-法-制-器-动-币 六层闭环 (v1.0)" \
  --homepage "https://github.com/${GH_OWNER}/${REPO}"

git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/${GH_OWNER}/${REPO}.git"
git push -u origin main

echo "立名完成：https://github.com/${GH_OWNER}/${REPO}"
