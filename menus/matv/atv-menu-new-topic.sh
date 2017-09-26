# default topic maker
# for:
# atv-menu.sh

atv_menu_new_topic() {
  # ARGS
  TOPIC=$1
  if [ -z "$1" ] ; then
    echo -e "${_ATV_PROMPT} Type the topic (kebab-case): \c "
    read  TOPIC
  fi

  FILENAME="${TOPIC}.md"
  APATH_BASH="${D_MYATV}/${FILENAME}"
  touch ${APATH_BASH}
  echo "${FILENAME}" | clip.exe # file name to clipboard

  LINE01=""
  LINE02="# ${TOPIC}"
  echo "${LINE01}" >> ${APATH_BASH}
  echo "${LINE02}" >> ${APATH_BASH}
  # echo "${LINE03}" >> ${APATH_BASH}
  # echo "${LINE04}" >> ${APATH_BASH}
  # echo "${LINE05}" >> ${APATH_BASH}
  # echo "${LINE06}" >> ${APATH_BASH}
  # echo "${LINE07}" >> ${APATH_BASH}
  # echo "${LINE08}" >> ${APATH_BASH}

  MSG_ADD="${_ATV_PROMPT}${_ATV_TICK} Added new file to atv\n"
  printf "$MSG_ADD"
  SUBLPATH=$( wslpath -w ${APATH_BASH} )
  SUBLPATH_TOSHOW=$( wslpath -m ${APATH_BASH} )
  MSG_OPENING="${_ATV_PROMPT} Opening file in ST3: ${C_YELLOW}${SUBLPATH_TOSHOW}${C_END}\n"   # see .bashrc_utils
  printf "$MSG_OPENING"
  sleep 1
  subl ${SUBLPATH}
}
