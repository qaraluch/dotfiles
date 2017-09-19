#!/bin/bash

######################################################################### UTILS ########
_C_GREEN=$'\033[1;32m'
_C_YELLOW=$'\033[1;33m'
_C_END=$'\033[0m'
_PROMPT="[ dotfiles ]"
_TASK="[ install ]"
_TICK="[ ${_C_GREEN}✔${_C_END} ]"
_CROSS="[ ${_C_YELLOW}✖${_C_END} ]"
_empty_line() {
  echo ' '
}

######################################################################### WELCOME ######
echo "---------------------------------------------------------------------------------"
echo "${_PROMPT}                                                        by qaraluch"
echo "---------------------------------------------------------------------------------"

######################################################################### UPDATES ######
echo "${_PROMPT} About to run sys updates..."
sudo apt -qq update
sudo apt -qq upgrade
echo "${_PROMPT}${_TASK}${_TICK} Done updatings!"

#################################################################### UNIX INSTALLS #####
echo "${_PROMPT}${_TASK} Installation zsh..."
sudo apt -qq install zsh
echo "${_PROMPT}${_TASK}${_TICK} Done!"

echo "${_PROMPT}${_TASK} Installation dos2unix..."
sudo apt -qq install dos2unix
echo "${_PROMPT}${_TASK}${_TICK} Done!"

echo "${_PROMPT}${_TASK} Installation oh-my-zsh..."
if [ ! -d $HOME/.oh-my-zsh  ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  echo "${_PROMPT}${_TASK}${_TICK} Installed oh-my-zsh"
else
  echo "${_PROMPT}${_TASK}${_CROSS} Skiped installation of oh-my-zsh. Already installed!"
fi

echo "${_PROMPT}${_TASK} Installation fzf..."
if [ ! -d $HOME/.fzf  ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
  $HOME/.fzf/install
  echo "${_PROMPT}${_TASK}${_TICK} Installed fzf"
else
  echo "${_PROMPT}${_TASK}${_CROSS} Skiped installation of fzf. Already installed!"
fi

# sudo apt -qq install zsh
# echo "${_PROMPT}${_TASK}${_TICK} Installed zsh"

######################################################################### SYMLINKS #######



######################################################################### FOOTER #######
echo "-------------------------------------------------------------------- [ END ] ----"
_empty_line
