#!/bin/bash
# MAIN
dev_menu() {
    if [[ $1 == "add" && $2 == "new" ]]; then
      _dev_menu_add_new $3
    elif [[ $1 == "snippets" ]]; then
      local _snippet=$(find $D_MYATV_SNIPPETS -maxdepth 1 | fzf | xargs cat)      # coupled with snippets in atv
      echo $_snippet
      clip_it $_snippet
    elif [[ $1 == "todos" ]]; then
      grep --exclude-dir=.git --exclude-dir=node_modules -rEI "//TODO:" . 2>/dev/null
    elif [[ $1 == "git" && $2 == "init" ]]; then
      _dev_menu_git_auto_init
    elif [[ $1 == "github" && $2 == "init" ]]; then
      _dev_menu_github_auto_init
    elif [[ $1 == "show" && $2 == "mynpms" ]]; then
      _dev_menu_show_mynpms
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
  # ---
  _dev_help_dev_menu_add_new
  _dev_help_dev_menu_snippets
  _dev_help_dev_menu_todos
  _dev_help_dev_menu_git_auto_init
  _dev_help_dev_menu_github_auto_init
  _dev_help_dev_menu_show_mynpms
  # ---
  _dev_help_footer
  # line_break
}

# FUNCTIONS
_dev_menu_add_new() {
  dev_menu_touch_pair $1
}
_dev_help_dev_menu_add_new() {
  echo "    - dev ${C_YELLOW}add new ${C_END}              - add new files by touching src and test pair"
}

_dev_help_dev_menu_snippets() {
  echo "    - dev ${C_YELLOW}snippets ${C_END}             - echo and clip code snippets from atv"
}

_dev_help_dev_menu_todos() {
  echo "    - dev ${C_YELLOW}todos ${C_END}                - list all \"//TODO:\" marks in the code"
}

_dev_menu_git_auto_init() {
  dev_menu_git_auto_init
}
_dev_help_dev_menu_git_auto_init() {
  echo "    - dev ${C_YELLOW}git init ${C_END}             - auto git init"
}

_dev_menu_github_auto_init() {
  dev_menu_github_auto_init
}
_dev_help_dev_menu_github_auto_init() {
  echo "    - dev ${C_YELLOW}github init ${C_END}          - auto github repo init"
}

_dev_menu_show_mynpms() {
  npm-user-packages qaraluch                                  ## dependecy npm package: npm-user-packages-cli
}

_dev_help_dev_menu_show_mynpms() {
  echo "    - dev ${C_YELLOW}show mynpms ${C_END}          - show my npm packages"
}


