export PATH=$HOME/.bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/ag/.oh-my-zsh

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.dotfiles-source/zsh/custom

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell" # default
# ZSH_THEME="agnoster" # font display problem
ZSH_THEME="norm"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git-prompt) # to slow
plugins=()

# ZSH
[ -f ~/.zshrc_opts ] && source ~/.zshrc_opts
[ -f ~/.zshrc_utils ] && source ~/.zshrc_test
[ -f ~/.zshrc_utils ] && source ~/.zshrc_utils

#  source fns and utils
for function in ~/.dotfiles-source/zsh/fns/*; do
  source $function
done

for function in ~/.dotfiles-source/zsh/utils/*; do
  source $function
done

# MENUS
for function in ~/.dotfiles-source/menus/matv/*; do
  source $function
done

for function in ~/.dotfiles-source/menus/mdev/*; do
  source $function
done

# mygit
[ -f ~/.rc_git ] && source ~/.rc_git

# rc_globals
[ -f ~/.rc_globals ] && source ~/.rc_globals

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

## zsh-syntax-highlighting plugin
## see: [zsh-syntax-highlighting/main.md](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'

### ANTIGEN
# antigen time!
source /usr/share/zsh-antigen/antigen.zsh
local b="antigen-bundle"

# Syntax highlighting on the readline
$b zsh-users/zsh-syntax-highlighting
$b urbainvaes/fzf-marks

# Tell antigen that you're done.
antigen apply

source $ZSH/oh-my-zsh.sh

# original FZF cfg
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'

# --- ORG CFG ------

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
