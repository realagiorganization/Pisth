#!/usr/bin/env bash
set -euo pipefail

command=${1:-}
package=${2:-}

if [[ "$command" != "install" || "$package" != "oh-my-opencode" ]]; then
  echo "Usage: $0 install oh-my-opencode"
  exit 1
fi

install_dir="$HOME/.local/share/opencode"
bin_dir="$HOME/.local/bin"

mkdir -p "$install_dir" "$bin_dir"
cp "$(dirname "$0")/opencode_cli.py" "$install_dir/opencode_cli.py"

cat <<'SH' > "$bin_dir/opencode"
#!/usr/bin/env bash
set -euo pipefail
python3 "$HOME/.local/share/opencode/opencode_cli.py" "$@"
SH

chmod +x "$bin_dir/opencode"

echo "Installed oh-my-opencode to $bin_dir/opencode"
