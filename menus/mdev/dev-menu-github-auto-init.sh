# Simple automation for GITHUB init new repo in WSL
# as follow up for git auto init
# two parts:
#   - init github repo
#   - add new urls to remote origin
# for:
# dev-menu.sh
# This script gets a username from .gitconfig.  If it indicates that your default username is an empty string, you can set it with
# git config --add user.user YOUR_GIT_USERNAME
# credists:
# jerrykrinock - https://gist.github.com/jerrykrinock/6618003
# robwierzbowski - https://gist.github.com/robwierzbowski/5430952/

# UTILS
_DEV_TASK_GITHUBINIT="[ github init ]"

dev_menu_github_auto_init() {
  echo "${_DEV_PROMPT} About to init new repo on GITHUB... "

  # checks if it is in repo dir
  if is_in_git_repo ; then
    echo  "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT}${_DEV_TICK} You are in git repo. Continuing..."
    local DIR_NAME=${PWD##*/}
    # clip_it $DIR_NAME # ???
    local GITHUBUSER=$(git config user.name)
    local _MYUSER=$GITHUBUSER
    local _MYREPONAME=$DIR_NAME

    ## PART 1 (main): init new github repo
    read REPLY3\?"${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT} Wanna init github repo? (Type 'y' to proceed) "
    if [[ "$REPLY3" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
      echo "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT} Imput following data:"
      vared -p "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT} Input user name or just <enter> to make it: " _MYUSER
      vared -p "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT} Input github repo name or just <enter> to make it: " _MYREPONAME
      vared -p "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT} Input github repo description as one-liner: " -c _MYDESCRIPTION
      # for public repos only
      _REPOTYPE='public'
      _PRIVATE_FLAGE=false
      line_break
      echo "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT} Summary:"
      echo "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT} In current dir ${C_YELLOW}$DIR_NAME${C_END}, We will create new ${C_YELLOW}$_REPOTYPE${C_END} repo"
      echo "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT} named ${C_YELLOW}$_MYREPONAME${C_END} on GitHub.com as a user: ${C_YELLOW}$_MYUSER${C_END},"
      echo "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT} with this desription: ${C_YELLOW}$_MYDESCRIPTION${C_END}."

      read REPLY\?"${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT} Type 'y' to proceed ?"
      if [[ "$REPLY" =~ ^([yY][eE][sS]|[yY])+$ ]]
      then
        echo  "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT}$ Creating repo..."
        curl -u $_MYUSER https://api.github.com/user/repos -d "{\"name\": \"$_MYREPONAME\", \"description\": \"${_MYDESCRIPTION}\", \"private\": $_PRIVATE_FLAGE, \"has_issues\": true, \"has_downloads\": true, \"has_wiki\": false}"
        echo  "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT}${_DEV_TICK} DONE!"

        local REPOURL="https://github.com/${_MYUSER}/${_MYREPONAME}.git"
        echo "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT} Apend file: "
        echo "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT}${C_YELLOW} $F_MYGITPUB ${C_END}"             # see: rc_globals
        echo "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT} ... for reference "
        echo $REPOURL >> $F_MYGITPUB

        echo  "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT}${_DEV_TICK} Opening browser (chrome)"
        sleep 1
        chrome_it $REPOURL                                                                                                 ## see: zsh/fns
      else
        echo  "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT}${_DEV_CROSS} ${C_YELLOW}Aborted process of init new github repo!${C_END}"
      fi
    else
      echo  "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT}${_DEV_CROSS} ${C_YELLOW}Skipped init github new repo!${C_END}"
    fi

    ## PART 2: add new url to remote origin
    read REPLY2\?"${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT} Wanna add github remote to the project? (Type 'y' to proceed) "
    if [[ "$REPLY2" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
      local LOCALGITREMOTE=$(git remote get-url origin);
      $(git remote set-url --add --push origin $LOCALGITREMOTE)
      $(git remote set-url --add --push origin $REPOURL)
      git remote -v                                                                                                    ## check correctness
      echo  "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT}${_DEV_TICK} All done!"
    else
      echo  "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT}${_DEV_CROSS} ${C_YELLOW}Aborting script!${C_END}"
    fi

  else
    echo  "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT}${_DEV_CROSS} ${C_YELLOW}Sorry not in git repo... Aborting script!${C_END}"
  fi
}
