#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function update_readme () {
  local DUMP="$(npm start)"
  DUMP="$(<<<"$DUMP" sed -re '1,+3{/^> /d};/^$/d')"
  <<<"$DUMP" grep -vFe ' = str "' && return 3$(
    echo 'E: flinching: unexpected output --^' >&2)
  local VERSI="$(node-versions)"
  if [ -z "$VERSI" ]; then
    VERSI='W: failed to detect node/npm/os version'
    echo "$VERSI" >&2
  fi
  DUMP=$'$ node-version\n'"$VERSI"$'\n$ npm start\n'"$DUMP"
  # <<<"$DUMP" head -n 4 | nl -ba && <<<"$DUMP" nl -ba | tail -n 4 && return 0
  <<<"$DUMP" timeout 1s sed -nre '
    : copy
      p
      /^```text$/{
        r /dev/stdin
        b skip
      }
      n
    b copy
    : skip
      n
      /^```$/b copy
    b skip
    ' -- README.md >README.new-$$ || return $?
  mv -v -- README.{new-$$,md} || return $?
  return 0
}










[ "$1" == --lib ] && return 0; update_readme "$@"; exit $?
