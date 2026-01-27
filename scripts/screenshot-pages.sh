#!/bin/bash
set -euo pipefail

url="${1:-https://pisth.github.io}"
output="${2:-docs/gh-pages-screenshot.png}"

if command -v google-chrome >/dev/null 2>&1; then
  chrome_bin="google-chrome"
elif command -v chromium-browser >/dev/null 2>&1; then
  chrome_bin="chromium-browser"
elif command -v chromium >/dev/null 2>&1; then
  chrome_bin="chromium"
else
  echo "No Chrome/Chromium binary found for screenshot." >&2
  exit 1
fi

"$chrome_bin" --headless --disable-gpu --no-sandbox --window-size=1280,720 --screenshot="$output" "$url"
