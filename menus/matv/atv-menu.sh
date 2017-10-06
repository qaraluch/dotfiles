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
    elif [[ $1 == "split" && $2 == "-d" ]]; then
      atv-import-split-md run -d ${@:3}                       # see dev/...
    elif [[ $1 == "split" ]]; then
      atv-import-split-md run ${@:2}                          # see dev/...
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
  atv_help_import_split_md
  atv_help_import_split_md_dryrun
  atv_help_footer
  # line_break
}

############################################################### DOTFILES scripts
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
  echo "    - atv ${C_YELLOW}show note${C_END}                        - pick and show content of atv note in terminal"
}

atv_show_memos_grep() {
  command cat $F_MYATV_MEMOS | grep $1 | less     # see .rc_globals
}
atv_help_show_memos_grep() {
  echo "    - atv ${C_YELLOW}show memos -g${C_END} [word]             - show memos file + grep"
}


############################################################### SYS npm modules
atv_help_import_split_md() {
  echo "    - atv ${C_YELLOW}split${C_END} [filePath]                 - split big md files into small subtopics files"
}
atv_help_import_split_md_dryrun() {
  echo "    - atv ${C_YELLOW}split -d${C_END} [filePath]              - as above but dryrun"
}

