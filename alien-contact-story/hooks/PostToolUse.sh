#!/bin/bash
# 護欄層 - 寫作後品質檢查（PostToolUse）
# 在章節草稿完成後自動執行

CHAPTER_FILE="$1"

echo "=== 《星際接觸》寫作後品質檢查 ==="

# 伏筆追蹤檢查
echo ""
echo "📌 伏筆狀態核查："
FORESHADOW_FILE="./CLAUDE.md/project.md"

if grep -q "\- \[ \]" "$FORESHADOW_FILE" 2>/dev/null; then
    echo "⏳ 以下伏筆尚未閉合："
    grep "\- \[ \]" "$FORESHADOW_FILE"
else
    echo "✅ 所有伏筆已閉合"
fi

# 字數統計
if [ -f "$CHAPTER_FILE" ]; then
    WORD_COUNT=$(wc -w < "$CHAPTER_FILE")
    echo ""
    echo "📊 字數統計：$WORD_COUNT 字"
    if [ "$WORD_COUNT" -lt 2000 ]; then
        echo "⚠️  章節偏短（目標：4,000–6,000字），建議擴展"
    elif [ "$WORD_COUNT" -gt 8000 ]; then
        echo "⚠️  章節偏長（目標：4,000–6,000字），建議精簡"
    else
        echo "✅ 字數在目標範圍內"
    fi
fi

# 沃艾語法規則檢查
echo ""
echo "🔍 沃艾語語法簡查："
if grep -q "艾歐拉" "$CHAPTER_FILE" 2>/dev/null; then
    echo "   請確認艾歐拉的對話符合「結果優先」語法（參見 skills/alien-linguist.md）"
fi

echo ""
echo "✅ 後置檢查完成"
echo "💡 提示：完成章節後請更新 CLAUDE.md/project.md 中的伏筆追蹤清單"
