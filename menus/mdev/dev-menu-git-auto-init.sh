# simple automation for git init new repo in WSL
# clone whatever boilerplate repo and run this script
# will remove old .git ant init new one
# for:
# dev-menu.sh

# UTILS
_DEV_TASK_INIT="[ git init ]"

dev_menu_git_auto_init() {
  local DIR_NAME=${PWD##*/}
  local _MYREPONAME=$DIR_NAME
  echo "${_DEV_PROMPT} About to init new repo... "
  read REPLY\?"${_DEV_PROMPT}${_DEV_TASK_INIT} Are you sure that you are in right working dir and cloned desired boilerplate? [y/N]"
  if [[ "$REPLY" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
    if [ -d "./.git" ]; then # zsh
      echo "${_DEV_PROMPT}${_DEV_TASK_INIT} Removing old .git dir ..."
      rm -rf .git
    fi
    git init
    touch .gitignore
    git add .
    git commit -m "First commit"
    local DIR_NAME=${PWD##*/}
    clip_it $DIR_NAME
    vared -p "${_DEV_PROMPT}${_DEV_TASK_INIT} Input remote repo name: " _MYREPONAME
    echo  "${_DEV_PROMPT}${_DEV_TASK_INIT} My remote repo name will be: ${C_YELLOW}${_MYREPONAME}${C_END}"
    local REPO_PATH="$D_MYGITREMOTE/$_MYREPONAME.git"
    git init --bare $REPO_PATH
    git remote add origin $REPO_PATH
    git push -u origin master

    echo  "${_DEV_PROMPT}${_DEV_TASK_INIT} Apend file:  ${C_END}"
    echo  "${_DEV_PROMPT}${_DEV_TASK_INIT}${C_YELLOW} $F_MYGITREMOTE ${C_END}"             # see: rc_globals
    echo  "${_DEV_PROMPT}${_DEV_TASK_INIT} ... for reference ${C_END}"
    echo $REPO_PATH >> $F_MYGITREMOTE

    echo  "${_DEV_PROMPT}${_DEV_TASK_INIT}${C_YELLOW} Set up fzf-mark name for this dir. ${C_END}"
    echo  "${_DEV_PROMPT}${_DEV_TASK_INIT}${C_YELLOW} Set up project in your code editor. ${C_END}"
    echo  "${_DEV_PROMPT}${_DEV_TASK_INIT}${_DEV_TICK} Done!"
  else
    echo "${_DEV_PROMPT}${_DEV_TASK_INIT}${_DEV_CROSS} Aborting script..."
  fi

}
