BASE_DIR="$(cd "$(dirname "$0")" && pwd)/PASSPORT"

mkdir -p "$BASE_DIR" "$BASE_DIR/log" "$BASE_DIR/tmp"

{
    echo "Forming date: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Hostname: $(hostname)"
} > "$BASE_DIR/tmp/host.tmp"

{
    echo "Uset (whoami): $(whoami)"
    echo "Sessions (who):"
    who
} > "$BASE_DIR/tmp/user.tmp"

{
    echo "Current dir: $(pwd)"
    echo "Directory containing:"
    ls -la
} > "$BASE_DIR/tmp/cwd.tmp"

REPORT="$BASE_DIR/passport.txt"

{
    echo "-------------------------------------------"
    echo "        SERVER PASSPORT"
    echo "-------------------------------------------"
    echo

    echo "Host info:"
    cat "$BASE_DIR/tmp/host.tmp"
    echo

    echo "User info:"
    cat "$BASE_DIR/tmp/user.tmp"
    echo

    echo "Work Directory and containing:"
    cat "$BASE_DIR/tmp/cwd.tmp"
    echo

    echo "END"
} > "$REPORT"

LOG="$BASE_DIR/log/report.log"
echo "Script was started: $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG"


find "$BASE_DIR" -type f -name "*.tmp" -delete

echo "Ready. Report: $REPORT"
echo "Log: $LOG"
