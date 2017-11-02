#!/bin/bash
# MAIN
atv_menu() {
    if [[ $1 == "add" && $2 == "new" ]]; then
      atv_add_new $3
    elif [[ $1 == "flow" ]]; then
      atv_flow $2
    elif [[ $1 == "show" && $2 == "memos" && $3 == "-g" ]]; then
      atv_show_memos_grep $4
    elif [[ $1 == "show" && $2 == "memos" ]]; then
      atv_show_memos $3
    elif [[ $1 == "show" && $2 == "note" ]]; then
      atv_show_note $3
    elif [[ $1 == "show" && $2 == "files" ]]; then
      atv_show_files $3
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
  atv_help_flow
  atv_help_show_memos
  atv_help_show_memos_grep
  atv_help_show_note
  atv_help_show_files
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

atv_flow() {
  vim $F_MYATV_FLOW
}
atv_help_flow() {
  echo "    - atv ${C_YELLOW}flow${C_END}                             - edit flow file in vim"
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

atv_show_files() {
  if [[ $1 == "atv" ]]; then
    tre "$D_MYATV_BOOK/abouts/$1"
  elif [[ $1 == "vectra" ]]; then
    tre "$D_MYATV_BOOK/auto/$1"
  elif [[ $1 == "bitcoin" ]]; then
    tre "$D_MYATV_BOOK/$1"
  elif [[ $1 == "js" ]]; then
    tre "$D_MYATV_BOOK/dev/$1"
  elif [[ $1 == "vba" ]]; then
    tre "$D_MYATV_BOOK/dev/$1"
  elif [[ $1 == "fon" ]]; then
    tre "$D_MYATV_BOOK/$1"
  elif [[ $1 == "ideas" ]]; then
    tre "$D_MYATV_BOOK/$1"
  elif [[ $1 == "ongoings" ]]; then
    tre "$D_MYATV_BOOK/$1"
  elif [[ $1 == "bash" ]]; then
    tre "$D_MYATV_BOOK/power-user/$1"
  elif [[ $1 == "git" ]]; then
    tre "$D_MYATV_BOOK/power-user/$1"
  elif [[ $1 == "st3" ]]; then
    tre "$D_MYATV_BOOK/power-user/$1"
  elif [[ $1 == "vim" ]]; then
    tre "$D_MYATV_BOOK/power-user/$1"
  elif [[ $1 == "vsc" ]]; then
    tre "$D_MYATV_BOOK/power-user/$1"
  elif [[ $1 == "win10" ]]; then
    tre "$D_MYATV_BOOK/power-user/$1"
  elif [[ $1 == "imports" ]]; then
    tre "$D_MYATV/$1"
  else
    tree_better_dirs $D_MYATV                             # see zsh/fns
  fi
}
atv_help_show_files() {
  echo "    - atv ${C_YELLOW}show files${C_END} [dir]                 - tree show of files in dir:
                                             - atv, ideas, ongoings,
                                             - vectra, bitcoin, fon,
                                             - js, vba,
                                             - bash, git, st3, vim, vsc, win10,
                                             - imports"
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

