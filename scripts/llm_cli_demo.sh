#!/usr/bin/env bash
set -euo pipefail

: "${LLM_API_KEY:?LLM_API_KEY is required}"

export PATH="$HOME/.local/bin:$PATH"

./scripts/codex-cli.sh install oh-my-opencode

tmux new-session -d -s opencode

tmux send-keys -t opencode "opencode \"Summarize Pisth in one sentence.\"" C-m

tmux send-keys -t opencode "exit" C-m

tmux attach -t opencode
