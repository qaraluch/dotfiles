# common mys
alias mya='cd $D_MYATV'                             # .rc_globals
alias myatv='cd $D_MYATV'                           # .rc_globals

# history
alias h='history'
alias hr='history | tail -n 20'                     # history recent
alias hback='history_zsh_backup'                    # zsh/fns
alias hbring='history_zsh_bring'                    # zsh/fns
alias hpurge='history_zsh_purge'                    # zsh/fns

# sys
alias e='exit'
alias ex='explorer.exe .'
alias clip='clip_it $@'
alias reload='reload_zshrc'                         # zsh/fns
alias t='touch_better'                              # zsh/fns
alias mv='mv -i -v $@'
alias cp='cp -i -v -rf $@'
alias ln='ln -i -v $@'

# editors
alias subl='subl.exe $@'                            # zsh/fns
alias v='vim $@'

# git
alias g='mygit'                                     # .rc_git
alias gs='mygit_status'                             # .rc_git
alias gp='mygit_push $@'                            # .rc_git
alias gc='mygit_commit $@'                          # .rc_git
alias ga='mygit_add @$'                             # .rc_git
alias gau='mygit_add_update @$'                     # .rc_git
alias gac='mygit_add_and_commit @$'                 # .rc_git
alias ghash='mygit_clip_hash'                       # .rc_git
alias gmsg='mygit_clip_msg'                         # .rc_git
alias gl='mygit_log_recent'                         # .rc_git
alias gla='mygit_log_all'                           # .rc_git
alias glt='mygit_log_tree'                          # .rc_git
alias gld='mygit_log_full_date'                     # .rc_git
alias gsta='mygit_stash_ls'                         # .rc_git
alias gstas='mygit_stash_save'                      # .rc_git
alias gstap='mygit_stash_pop'                       # .rc_git
alias gstas='mygit_stash_show'                      # .rc_git