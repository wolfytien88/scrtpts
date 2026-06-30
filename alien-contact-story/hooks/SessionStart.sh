#!/bin/bash
# 護欄層 - 每次工作階段開始載入（SessionStart）
# 每次開啟新的寫作工作階段時執行

echo ""
echo "╔══════════════════════════════════════╗"
echo "║   《星際接觸》寫作工作階段啟動       ║"
echo "║   地球與外星接觸的未來冒險故事       ║"
echo "╚══════════════════════════════════════╝"
echo ""

# 顯示當前進度
CHAPTERS_DONE=$(ls ./chapters/ch*_*.md 2>/dev/null | wc -l)
echo "📖 目前進度：$CHAPTERS_DONE / 12 章"
echo ""

# 顯示待辦伏筆
echo "📌 未閉合伏筆："
if [ -f "./CLAUDE.md/project.md" ]; then
    grep "\- \[ \]" ./CLAUDE.md/project.md | sed 's/- \[ \] /   ⏳ /'
else
    echo "   （無法讀取 project.md）"
fi

echo ""
echo "👤 主角提醒：Dr. 林曉晨 — 理性、情感壓抑、對沃艾人保持謹慎"
echo "🌍 世界提醒：2157年，地球生態危機，月球基地「寧靜海前哨」"
echo ""
echo "📚 可用 Skills："
echo "   world-builder.md   → 世界觀/科技描寫"
echo "   chapter-writer.md  → 章節結構指引"
echo "   alien-linguist.md  → 沃艾語法規則"
echo ""
echo "🤖 可用 Subagents："
echo "   chapter-drafter    → 章節草稿"
echo "   science-advisor    → 科學事實審查"
echo "   alien-designer     → 外星文化設計"
echo "   editor             → 風格與一致性編輯"
echo ""
echo "準備開始！輸入你想撰寫的章節或任務。"
