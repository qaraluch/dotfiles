# org source: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/norm.zsh-theme
PROMPT=$'\n''%{$fg[yellow]%}λ %{$FG[001]%}[ %D{%Y-%m-%d} %T ] %{$fg[green]%}%/ %{$fg[yellow]%}→ %{$reset_color%}' # replaced machine name with date
# PROMPT=$'\n''%{$fg[yellow]%}λ %m %{$fg[green]%}%/ %{$fg[yellow]%}→ %{$reset_color%}' # removed $(git_prompt_info)

ZSH_THEME_GIT_PROMPT_PREFIX="λ %{$fg[blue]%}git %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%} → %{$reset_color%}"
