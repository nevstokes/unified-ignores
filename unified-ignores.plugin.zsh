#!/usr/bin/env zsh

: ${UNIFIED_IGNORE_FILENAME:=.ignore.yaml}

_unified_ignore_chpwd_handler () {
  emulate -L zsh

  if [[ -f ${UNIFIED_IGNORE_FILENAME} ]]; then
    while read ignore; do
      local match=$(printf '/^%s:/,/^[^\s-]+:/p' ${ignore})
      local output=$(printf '.%signore\n' ${ignore})
      sed -nE ${match} ${UNIFIED_IGNORE_FILENAME} | sed -nE 's/^\s*-\s*//p' > ${output}
    done < <(sed -nE 's/^([a-z]+):/\1/p' ${UNIFIED_IGNORE_FILENAME})
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _unified_ignore_chpwd_handler
_unified_ignore_chpwd_handler
