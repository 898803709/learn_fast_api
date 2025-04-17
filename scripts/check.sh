#!/bin/bash

CHECK="all"

if [ "$#" -ne 0 ]; then
  CHECK="$1"
fi

if [[ "$CHECK" == "all" || "$CHECK" == "type" || "$CHECK" == "mypy" ]]; then
    echo "Pythonの型チェック中(mypy)..."
    uv run mypy api
fi

if [[ "$CHECK" == "all" || "$CHECK" == "format" || "$CHECK" == "lint" || "$CHECK" == "black" ]]; then
    echo "Pythonコードスタイルのチェック中(black)..."
    uv run black api tests --check --diff
fi

if [[ "$CHECK" == "all" || "$CHECK" == "format" || "$CHECK" == "lint" || "$CHECK" == "ruff" ]]; then
    echo "Pythonコードスタイルのチェック中(ruff)..."
    uv run ruff check api tests
fi
