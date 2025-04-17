#!/bin/bash -eu
# コードスタイルの自動修正を行います

cd "$( dirname "$0" )"/..
uv run ruff check --fix-only api tests
uv run black api tests