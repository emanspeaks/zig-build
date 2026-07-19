#!/usr/bin/env bash
#cSpell:enableCompoundWords
# Pulls the last "failed command: ..." line out of a build log (the most
# recent one under $ZIG_BUILD_LOG_DIR by default) and writes it to
# last-failed-command.sh with --listen=- stripped, so it can be re-run
# standalone: outside ninja's output capture and outside the parent `zig
# build` process's IPC progress protocol, both of which swallow any detail
# beyond "process exited with code N" when the child crashes. Running the
# generated script gets you a normal live progress bar and a chance at a
# panic/stack trace instead.
. ./common.sh

log_file="${1:-$(ls -t "$ZIG_BUILD_LOG_DIR"/*.log 2>/dev/null | head -n 1)}"
if [ -z "$log_file" ] || [ ! -f "$log_file" ]; then
  echo "No build log found under $ZIG_BUILD_LOG_DIR. Pass a log file path, or run a build first." >&2
  exit 1
fi

cmd_line=$(grep '^failed command: ' "$log_file" | tail -n 1 | sed 's/^failed command: //')
if [ -z "$cmd_line" ]; then
  echo "No 'failed command:' line found in $log_file -- nothing to extract." >&2
  exit 1
fi

# Drop the trailing --listen=- flag: that's what puts the child into the
# binary IPC protocol instead of printing normal progress/output.
cmd_line=${cmd_line% --listen=-}

out="$ZIGROOT/last-failed-command.sh"
{
  echo '#!/usr/bin/env bash'
  echo ". \"$ZIGROOT/common.sh\""
  echo "cd \"$ZIG_SRC\""
  echo "$cmd_line" '"$@"'
} > "$out"
chmod +x "$out"

echo "Extracted from: $log_file"
echo "Wrote: $out"
echo
echo "Run it directly for live progress and a chance at panic/crash output:"
echo "  $out"
echo "Or add verbosity flags, e.g.:"
echo "  $out --verbose-cc --verbose-link"
