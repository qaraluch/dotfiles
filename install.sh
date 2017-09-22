#!/bin/bash

######################################################################### UTILS ########
_C_GREEN=$'\033[1;32m'
_C_YELLOW=$'\033[1;33m'
_C_RED=$'\033[0;31m'
_C_END=$'\033[0m'
_PROMPT="[ dotfiles ]"
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
  echo "${_PROMPT}${_TASK}${_TICK} Installed oh-my-zsh."
else
  echo "${_PROMPT}${_TASK}${_CROSS} Skiped installation of oh-my-zsh. Already installed!"
fi

echo "${_PROMPT}${_TASK} Installation fzf..."
if [ ! -d $HOME/.fzf  ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
  $HOME/.fzf/install
  echo "${_PROMPT}${_TASK}${_TICK} Installed fzf."
else
  echo "${_PROMPT}${_TASK}${_CROSS} Skiped installation of fzf. Already installed!"
fi
#################################################################### DEV INSTALLS #####
echo "${_PROMPT}${_TASK} Installation node.js..."
if [ ! -f /usr/bin/node  ]; then
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  sudo apt-get install -y nodejs
  sudo npm install npm --global
  echo "${_PROMPT}${_TASK}${_TICK} Installed node.js."
else
  echo "${_PROMPT}${_TASK}${_CROSS} Skiped installation of node.js. Already installed!"
fi

######################################################################### CONDITION #######
echo "${_PROMPT}${_TASK} Checking if .dotfiles-cfg-(...) file is sourced beforehand ?"
if [ -z ${_DOTFILES_WHOIS+x} ]; then
  echo "${_PROMPT}${_TASK}${_C_RED}[ ERROR ] Not sourced .dotfiles-cfg. Terminating rest of the script!${_C_END}"
  echo "-------------------------------------------------------------------- [ END ] -------------------"
  _empty_line
  exit 1
else
  echo "${_PROMPT}${_TASK}[ TEST ] Sourced cfg: ${_C_YELLOW}${_DOTFILES_WHOIS}${_C_END}"

  ######################################################################### SYMLINKS #######
  BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  ## DRIVES
  rm -rf $HOME/c && ln -sf /mnt/c $HOME/c
  rm -rf $HOME/g && ln -sf /mnt/g $HOME/g
  rm -rf $HOME/h && ln -sf /mnt/h $HOME/h
  echo "${_PROMPT}${_TASK}${_TICK} Symlinked main drives."

  ## DIRS
  rm -rf $HOME/whome && ln -sf $_DOTFILES_WINHOME $HOME/whome       # see dotfiles-cfg/.dotfiles-config
  echo "${_PROMPT}${_TASK}${_TICK} Symlinked windows home dir."
  rm -rf $HOME/bin && ln -sf ${BASEDIR}/bin  ~/.bin
  echo "${_PROMPT}${_TASK}${_TICK} Symlinked bin dir."

  ##################################################################### SYMLINKS CFGS ####

  ## GIT
  ln -sf ${BASEDIR}/git/.rc_git  ~
  ln -sf ${BASEDIR}/git/.gitconfig  ~
  echo "${_PROMPT}${_TASK}${_TICK} Symlinked git configs."

  ## BASH
  ln -sf ${BASEDIR}/bash/.bashrc  ~
  ln -sf ${BASEDIR}/bash/.inputrc  ~
  echo "${_PROMPT}${_TASK}${_TICK} Symlinked bash configs."

  ## ZSH
  ln -sf ${BASEDIR}/zsh/.zshrc  ~
  ln -sf ${BASEDIR}/zsh/.zshrc_opts  ~
  ln -sf ${BASEDIR}/zsh/.zshrc_utils  ~
  ln -sf ${BASEDIR}/zsh/.zshrc_test  ~
  echo "${_PROMPT}${_TASK}${_TICK} Symlinked zsh configs."

  ######################################################################### MANUAL #######
  ## HYPER
  echo "${_PROMPT}${_TASK}${_CROSS} Not symlinked hyper configs."
  echo "${_PROMPT}${_TASK}${_C_YELLOW} Please do it manually. See: personal notes (hyperjs.md) for command snippet.${_C_END}"
fi
######################################################################### FOOTER #######
echo "-------------------------------------------------------------------- [ END ] -------------------"
_empty_line
