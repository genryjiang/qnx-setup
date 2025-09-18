
# --- Config ---
TARGET_DIRNAME="qemu-qnx800-aarch64le"
HOSTNAME="qnx-a64"

# Source the environment (assuming default install path)
source "$HOME/qnx800/qnxsdp-env.sh"

# --- Ensure mkqnximage is available ---
if ! command -v mkqnximage >/dev/null 2>&1; then
  echo "ERROR: 'mkqnximage' not found in PATH. Make sure your QNX environment is sourced."
  exit 1
fi

# --- Find qnxprojects/targets ---
TARGETS_PATH=""

# Prefer the canonical location under $HOME
if [ -d "$HOME/qnxprojects/targets" ]; then
  TARGETS_PATH="$HOME/qnxprojects/targets"
else
  # Search under $HOME for .../qnxprojects/targets
  # Prints the first match; adjust 'head -n1' behavior if you want a different selection rule.
  IFS= read -r TARGETS_PATH <<<"$(find "$HOME" -type d -path '*/qnxprojects/targets' 2>/dev/null | head -n1 || true)"
fi

if [ -z "${TARGETS_PATH}" ]; then
  echo "ERROR: Could not find a 'qnxprojects/targets' folder under \$HOME."
  exit 1
fi

echo "Using targets folder: $TARGETS_PATH"

# --- Create (if missing) and enter the desired target dir ---
DEST="$TARGETS_PATH/$TARGET_DIRNAME"
mkdir -p "$DEST"

# Copy run.sh into this folder

# --- Copy run.sh if present next to this script ---
if [ -f "$RUN_SRC" ]; then
  cp -f "$RUN_SRC" "$DEST/run.sh"
  chmod +x "$DEST/run.sh"
  echo "Copied run.sh to: $DEST/run.sh"
else
  echo "WARNING: run.sh not found next to this script at: $RUN_SRC"
fi


cd "$DEST"

# --- Run the build command ---
echo "Running build in: $DEST"
set -x
mkqnximage --type=qemu --arch=aarch64le --ssh-ident=$HOME/.ssh/id_ed25519.pub --hostname="${HOSTNAME}" --build
set +x

echo "Done."