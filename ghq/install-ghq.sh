#!/bin/bash

set -euo pipefail
set -x

url=
bin="$HOME/.local/bin"

# renovate: datasource=github-tags depName=x-motemen/ghq versioning=loose
GHQ_VERSION=v1.7.1

case "$(uname -m)" in
  aarch64*|armv*)
    url="https://github.com/x-motemen/ghq/releases/download/${GHQ_VERSION}/ghq_linux_arm64.zip"
    ;;
  i*86|x86_64)
    # TODO: renovate
    url="https://github.com/x-motemen/ghq/releases/download/${GHQ_VERSION}/ghq_linux_amd64.zip"
    ;;
esac

[ -z "$url" ] && exit 0

mkdir -p "$bin"
curl -fsSL --progress-bar --output-dir "$bin" -O "$url"
unzip -j "$bin"/ghq_linux_a??64.zip '*/ghq' -d "$bin"
chmod +x "$bin/ghq"
rm -f "$bin"/ghq_linux_a??64.zip
