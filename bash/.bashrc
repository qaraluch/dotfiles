# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# from installation of fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f ~/.rc_git ]; then
    . ~/.rc_git
else
  printf "[ERROR] Sourcing: .rc_git problem! \n"
fi

# COLORS
export C_GREEN=$'\033[1;32m'
export C_END=$'\033[0m'

# ICONS
export I_TICK="[ ${C_GREEN}✔${C_END} ]"

# COMMON COMMANDS
mkdir() { command mkdir -pv $@ ; }
ex() { explorer.exe . ; }
e() { exit ; }
v() { vim $@ ; }

mv() { command mv -i -v $@ ; }
cp() { command cp -i -v -rf $@ ; }
ln() { command ln -i -v $@ ; }

alias ls='ls --color=auto'
ld() { command ls -d1 */ --color=auto ; }
ll() { command ls -al --color=auto ; }

cd..() { command cd .. ; ls ; }
cd...() { command cd ../../../ ; ls ; }

MSG_RELOAD_BASHRC="${I_TICK} Reloaded ${C_YELLOW}.bashrc${C_END} file!"
reload(){ source ~/.bashrc ; echo $MSG_RELOAD_BASHRC ; }

MSG_TOUCH_FILE="${I_TICK} Touched new file!"
t(){ touch $1 ; echo $MSG_TOUCH_FILE$1 ; ls ; }

MSG_MKDIR="${I_TICK} made a new dir!"
mkd(){ mkdir -pv $1 ; cd -P $1 ; echo $MSG_MKDIR ; }

# HISTORY
h() { command history ; }
hr() { history | tail -n 20 ; }                             ## hr - history rencent
hd() { history -d $1 ; history -w ; }                       ## hd - history delete (by offset nr)

# OPTIONS
shopt -s autocd                    # auto cd
shopt -s histverify                # review command found before executing
shopt -s no_empty_cmd_completion   # no annoying completion on emppty command!

# HISTORY OPTIONS
shopt -s histappend                                 # append to history, don't overwrite it
export HISTFILESIZE=10000                           # history file size
export HISTSIZE=10000                               # history size
export HISTCONTROL=ignoredups:erasedups             # no duplicate entries
export HISTIGNORE="ls:cd:exit:nc:nca:e:ex:hd*:hr:[ \t]*"        # history command ignore list
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# FZF
export FZF_DEFAULT_COMMAND='find * ""'
# export FZF_DEFAULT_OPTS='--reverse'

# EDITORS
export VISUAL=vim
export EDITOR="$VISUAL"
