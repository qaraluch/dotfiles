# qyadr prompt
function git-get-current-branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}
# My First
setopt PROMPT_SUBST
PROMPT='%(1j.[%j].)[ %(!.%{%F{red}%}%n%{%f%}.%{%F{white}%}%}%n%{%f%})@%m ] %{%F{cyan}%}%~%{%f%} %{%F{010}%}$(git-get-current-branch)%{%f%} %(?.%{%F{green}%}λ %{%f%}.%{%F{red}%}λ %{%f%})'

# Helper function to add empty line before prompt redraw
precmd() { print "" }


# org source: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/norm.zsh-theme
# PROMPT=$'\n''%{$fg[yellow]%}λ %{$FG[001]%}[ %D{%Y-%m-%d} %T ] %{$fg[green]%}%/ %{$fg[yellow]%}→ %{$reset_color%}' # replaced machine name with date
# PROMPT=$'\n''%{$fg[yellow]%}λ %m %{$fg[green]%}%/ %{$fg[yellow]%}→ %{$reset_color%}' # removed $(git_prompt_info)

# RPROMPT='$(git_prompt_info)'

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[001]%}[ %{$fg[blue]%}git %{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[001]%} ] %{$reset_color%}"
