#!/bin/bash
# MAIN
atv_menu() {
    if [[ $1 == "add" && $2 == "new" ]]; then
      atv_add_new $3
    elif [[ $1 == "show" && $2 == "memos" && $3 == "-g" ]]; then
      atv_show_memos_grep $4
    elif [[ $1 == "show" && $2 == "memos" ]]; then
      atv_show_memos $3
    elif [[ $1 == "show" && $2 == "note" ]]; then
      atv_show_note $3
    elif [[ $1 == "help" || "-h" ]]; then
      _atv_run_help
    else
      _atv_run_help
    fi
}

# UTILS
_ATV_PROMPT="[ ATV ]"
_ATV_TICK="[ ${C_GREEN}✔${C_END} ]"

# HELP
atv_help_header(){
  echo "${_ATV_PROMPT} [HELP] ----------------------------------------------------"
  echo "Usage: "
}

atv_help_footer(){
  echo "${_ATV_PROMPT} -----------------------------------------------------------"
}

_atv_run_help() {
  atv_help_header
  atv_help_add_new
  atv_help_show_memos
  atv_help_show_memos_grep
  atv_help_show_note
  atv_help_footer
  # line_break
}

# FUNCTIONS
atv_add_new() {
  atv_menu_new_topic $1
}
atv_help_add_new() {
  echo "    - atv ${C_YELLOW}add new${C_END} [fileName (without .md)] - add new atv file note"
}

atv_show_memos() {
  command less $F_MYATV_MEMOS                     # see .rc_globals
}
atv_help_show_memos() {
  echo "    - atv ${C_YELLOW}show memos${C_END}                       - show memos file"
}

atv_show_note() {
  myfzf_get_atv_note | xargs cat | less -FRNX
}
atv_help_show_note() {
  echo "    - atv ${C_YELLOW}show note${C_END}                       - pick and show content of atv note in terminal"
}

atv_show_memos_grep() {
  command cat $F_MYATV_MEMOS | grep $1 | less     # see .rc_globals
}
atv_help_show_memos_grep() {
  echo "    - atv ${C_YELLOW}show memos -g${C_END} [word]             - show memos file + grep"
}


# atv() {
#     elif [[ $@ == "show tree" ]]; then
#         treed $D_ATV_BOOK_WIN
#     elif [[ $@ == "show ongoings" ]]; then
#         command find $D_ATV_ONGOINGS -maxdepth 1 -type f
#     elif [[ $@ == "show dbtc" ]]; then
#         command find $D_ATV_DBTC -type f
#     elif [[ $@ == "show one month ago" ]]; then
#         command git log --pretty=format:'%C(auto,yellow)%h %C(auto,blue)%>(30,trunc) - %ad - %C(auto,reset)%s%C(auto,cyan)% gD% D' --abbrev-commit --after="1 month ago" --before="27 day ago"
#     elif [[ $1 == "mv" ]]; then
#         command mv -t ${@:2}
#     elif [[ $1 == "import" ]]; then
#         command mv -t ${D_ATV} ${@:2}
#         command echo 'Moved that file to atv dir!'
#     elif [[ $1 == "split" ]]; then
#         command atv-import-atmd run ${@:2}    # js script atv-import-atmd
#     elif [[ $1 == "help" ]]; then
#         atv_help
#     else
#       command cat $F_ATV_AGENDA
#       atv_help
#     fi
# }

# atv_help() {
#   echo '  - atv show tree - show atv/book dir';
#   echo '  - atv show ongoings - show just ongoings dir';
#   echo '  - atv show dbtc - show all dont break the chains';
#   echo '  - atv show one month ago - show whats been doing one month ago (only in atv dir)';
#   echo ' ' ;
#   echo '  - atv mv [full path of dest. dir] [file, file, ...] - move multiple files to book dir';
#   echo '  - atv import (from other locations) [file, file, ...] - moves notes e.g. from atmd';
#   echo ' ';
#   echo '  - atv split [file] - split md file to small topics (atv-import-atmd)';
#   echo ' ';
#   echo '  - atv help';
# }

