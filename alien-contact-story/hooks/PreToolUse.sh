#!/bin/bash
# 護欄層 - 寫作前驗證（PreToolUse）
# 在任何章節寫作操作前自動執行

CHAPTER_FILE="$1"
CURRENT_CHAPTER=$(echo "$CHAPTER_FILE" | grep -oP '(?<=ch)\d+')

echo "=== 《星際接觸》寫作前驗證 ==="
echo "目標章節：第 $CURRENT_CHAPTER 章"

# 規則1：章節順序檢查
if [ -n "$CURRENT_CHAPTER" ]; then
    PREV=$((CURRENT_CHAPTER - 1))
    if [ "$PREV" -gt 0 ]; then
        PREV_FILE="ch$(printf '%02d' $PREV)_*.md"
        if ! ls ./chapters/$PREV_FILE 2>/dev/null | head -1 | grep -q .; then
            echo "❌ 警告：第 $PREV 章尚未完成，建議先完成前章"
        else
            echo "✅ 前章已存在，可繼續"
        fi
    fi
fi

# 規則2：卡洛族出現時機保護
if [ "$CURRENT_CHAPTER" -lt 8 ] 2>/dev/null; then
    echo "🔒 提醒：第 $CURRENT_CHAPTER 章 — 卡洛族（Karo）不得出場或被明確提及"
fi

# 規則3：主角性格一致性提示
echo ""
echo "📋 林曉晨性格核心提示："
echo "   - 理性分析先於情感反應"
echo "   - 情感以行為表達，非直接陳述"
echo "   - 對沃艾人：謹慎信任，第8章前保持疑慮"
echo ""
echo "✅ 驗證完成，可開始寫作"
