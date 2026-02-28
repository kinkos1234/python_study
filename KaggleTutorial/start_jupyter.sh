#!/bin/bash
# Kaggle Tutorial - 로컬 Jupyter 실행 스크립트
# 사용법: bash start_jupyter.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV="$SCRIPT_DIR/.venv"

echo ""
echo "🚀 Kaggle Tutorial 로컬 환경 시작!"
echo "──────────────────────────────────────"

# 데이터 확인
MISSING=0
for f in "data/home-data-for-ml-course/train.csv" "data/home-data-for-ml-course/test.csv" "data/melbourne-housing-snapshot/melb_data.csv"; do
    if [ ! -f "$SCRIPT_DIR/$f" ]; then
        echo "⚠️  없음: $f"
        MISSING=1
    else
        echo "✅ 있음: $f"
    fi
done

if [ $MISSING -eq 1 ]; then
    echo ""
    echo "❌ 누락된 데이터 파일이 있습니다!"
    echo "   https://www.kaggle.com/competitions/home-data-for-ml-course/data"
    echo ""
fi

echo ""
echo "🌐 Jupyter Notebook 실행 중... (Ctrl+C 로 종료)"
cd "$SCRIPT_DIR"
source "$VENV/bin/activate" && jupyter notebook --notebook-dir="$SCRIPT_DIR"
