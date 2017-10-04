#!/bin/bash

######################################################################### UTILS ########
_C_GREEN=$'\033[1;32m'
_C_YELLOW=$'\033[1;33m'
_C_RED=$'\033[0;31m'
_C_END=$'\033[0m'
_PROMPT="[ vscode ]"
_TASK="[ install ]"
_TICK="[ ${_C_GREEN}✔${_C_END} ]"
_CROSS="[ ${_C_YELLOW}✖${_C_END} ]"
_empty_line() {
  echo ' '
}

######################################################################### WELCOME ######
echo "------------------------------------------------------------------------------------------------"
echo "${_PROMPT}                                                        by qaraluch"
echo "------------------------------------------------------------------------------------------------"

if test "$(which code)"; then
  ######################################################################## SYMLINKS #######
  rm -rf $D_VSCODE
  # var1="C:\Users\agolawski\AppData\Roaming\Code\User"
  # var2="G:\config\dotfiles\vscode\User"
  $(cmd.exe /C mklink /J $D_VSCODE_WIN $D_VSCODE_DOTFILES_WIN)
  # error?
  # ./install.sh: line 26: Junction: command not found
  [[ $? ]] && echo "${_PROMPT}${_TASK}${_TICK} Symlinked vscode User dir"
fi

######################################################################### FOOTER #######
echo "-------------------------------------------------------------------- [ END ] -------------------"
_empty_line


  # BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # _VSCODE_SOURCE="${BASEDIR}/User"                                          # dotfiles dir in ~
  # _VSCODE_DEST=$D_VSCODE                                                    # see .rc_globals
  # rm -rf ${_VSCODE_DEST} && ln -s ${_VSCODE_SOURCE} ${_VSCODE_DEST}
