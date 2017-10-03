#!/bin/bash
# MAIN
dev_menu() {
    if [[ $1 == "git" && $2 == "init" ]]; then
      _dev_menu_git_auto_init
    elif [[ $1 == "show" && $2 == "memos" && $3 == "-g" ]]; then
      # atv_show_memos_grep $4
    elif [[ $1 == "help" || "-h" ]]; then
      dev_run_help
    else
      dev_run_help
    fi
}

# UTILS
_DEV_PROMPT="[ DEV ]"
_DEV_TICK="[ ${C_GREEN}✔${C_END} ]"
_DEV_CROSS="[ ${_C_YELLOW}✖${_C_END} ]"

# HELP
_dev_help_header(){
  echo "${_DEV_PROMPT} [HELP] ----------------------------------------------------"
  echo "Usage: "
}

_dev_help_footer(){
  echo "${_DEV_PROMPT} -----------------------------------------------------------"
}

dev_run_help() {
  _dev_help_header
  _dev_help_dev_menu_git_auto_init
  _dev_help_footer
  # line_break
}

# FUNCTIONS
_dev_menu_git_auto_init() {
  dev_menu_git_auto_init
}
_dev_help_dev_menu_git_auto_init() {
  echo "    - dev ${C_YELLOW}git init ${C_END}             - auto git init"
}

