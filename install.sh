#!/bin/bash

######################################################################### UTILS ########
_C_GREEN=$'\033[1;32m'
_C_YELLOW=$'\033[1;33m'
_C_END=$'\033[0m'
_PROMPT="[ dotfiles ]"
_TASK="[ install ]"
_TICK="[ ${_C_GREEN}✔${_C_END} ]"
_empty_line() {
  echo ' '
}

######################################################################### WELCOME ######
echo "---------------------------------------------------------------------------------"
echo "${_PROMPT}                                                        by qaraluch"
echo "---------------------------------------------------------------------------------"

######################################################################### UPDATES ######
git pull
echo "${_PROMPT}${_TASK}${_TICK} Dotfiles are uptodate"

echo "${_PROMPT}${_TASK} About to run sys updates..."
sudo apt -qq update
sudo apt -qq upgrade
echo "${_PROMPT}${_TASK}${_TICK} Done updatings!"


#################################################################### UNIX INSTALLS #####
# sudo apt -qq install dos2unix unix2dos
# echo "${_PROMPT}${_TASK}${_TICK} Installed zsh"

# sudo apt -qq install zsh
# echo "${_PROMPT}${_TASK}${_TICK} Installed zsh"

# sudo apt -qq install zsh
# echo "${_PROMPT}${_TASK}${_TICK} Installed zsh"


######################################################################### FOOTER #######
echo "-------------------------------------------------------------------- [ END ] ----"
_empty_line
