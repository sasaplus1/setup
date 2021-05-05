#!/bin/bash

set -euo pipefail

__main() {
  unset -f __main

  local -r dist='bash-5.1'
  local -r archive="${dist}.tar.gz"

  curl -fsSLO "https://ftp.gnu.org/gnu/bash/${archive}"
  curl -fsSLO 'https://ftp.gnu.org/gnu/bash/bash-5.1-patches/bash51-00[1-4]'

  tar fx "$archive"
  mv bash51-00? "$dist"

  (
    cd "$dist"
    find . -type f -name 'bash51-00?' -print0 | sort -nz | xargs -0 -n 1 -I % patch -p 0 -i %
  )

  export CFLAGS='-DSSH_SOURCE_BASHRC'

  (
    cd "$dist"
    ./configure --prefix="${SETUP_PREFIX:-${HOME}/Local}"
    make install
  )

  unset -v CFLAGS

  rm -rf "$archive"
  rm -rf "$dist"
}
__main "$@"
