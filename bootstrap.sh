#!/usr/bin/env bash
#
# bootstrap.sh — clone the sibling repositories that ScoutDemo.xcworkspace
# references through relative paths (../scout, ../scout-db).
#
# The workspace expects this on-disk layout:
#
#   <parent>/
#   ├── scout-demo/      (this repo)
#   ├── scout/
#   └── scout-db/
#
# Run once after cloning scout-demo on a fresh machine, then open
# ScoutDemo.xcworkspace. Safe to re-run: existing checkouts are left untouched.
#
# Clone URLs are derived from this repo's `origin` remote, so the siblings use
# the same host, owner, and transport (SSH or HTTPS) you cloned scout-demo with.

set -euo pipefail

# Sibling repos the workspace references — see contents.xcworkspacedata.
SIBLINGS=(scout scout-db)

# Directory of this script == the scout-demo repo root.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

# Derive the clone-URL prefix from scout-demo's origin, e.g.
#   git@github.com:owner/scout-demo.git    -> git@github.com:owner/
#   https://github.com/owner/scout-demo.git -> https://github.com/owner/
origin_url="$(git -C "$SCRIPT_DIR" remote get-url origin 2>/dev/null || true)"
url_no_git="${origin_url%.git}"
prefix="${url_no_git%scout-demo}"
if [[ -z "$origin_url" || "$prefix" == "$url_no_git" ]]; then
    # origin missing or not the expected scout-demo URL — fall back to a default.
    prefix="git@github.com:kasianov-mikhail/"
    echo "warning: could not derive clone URL from origin; using ${prefix}" >&2
fi

echo "Sibling layout root: ${PARENT_DIR}"

for name in "${SIBLINGS[@]}"; do
    dest="${PARENT_DIR}/${name}"
    if [[ -d "$dest" ]]; then
        echo "✓ ${name} already present — skipping"
        continue
    fi
    url="${prefix}${name}.git"
    echo "→ cloning ${name} from ${url}"
    git clone "$url" "$dest"
done

echo "Done. Open ScoutDemo.xcworkspace."
