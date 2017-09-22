# dont-brake-the-chain
# for:
# atv-menu.sh

atv_new_dbtc_no_free_dopamine () {
  GLOBAL_PATH_NO_FREE_DOPAMINE="${D_ATV_NO_FREE_DOPAMINE}/"

  COLOR_YELLOW=$'\e[1;33m'
  COLOR_END=$'\e[0m'

  TOPIC=$1
  DATE="$(date +%Y-%m-%d)"

  if [ -z "$1" ] ; then
    echo -e "[!][atv][dbtc] -> How'd it go? succes [s] or failure [f] or  [s]: \c "
    read  TOPIC
  fi

  FILENAME="day-${DATE}-${TOPIC}.md"

  APATH_BASH="${GLOBAL_PATH_NO_FREE_DOPAMINE}${FILENAME}"

  touch ${APATH_BASH}
  echo "${FILENAME}" | clip # file name to clipboard

  # INFOLINE1="# ${TOPIC}"$'\n'"${INFO}"$'\n\n'

  LINE01=""
  LINE02="# day-${DATE}-${TOPIC}"

  echo "${LINE01}" >> ${APATH_BASH}
  echo "${LINE02}" >> ${APATH_BASH}
  # echo "${LINE03}" >> ${APATH_BASH}
  # echo "${LINE04}" >> ${APATH_BASH}
  # echo "${LINE05}" >> ${APATH_BASH}
  # echo "${LINE06}" >> ${APATH_BASH}
  # echo "${LINE07}" >> ${APATH_BASH}
  # echo "${LINE08}" >> ${APATH_BASH}

  MSG_END="${COLOR_YELLOW}[!][atv][dbtc] -> Added new atv dbtc file: ${FILENAME} ${COLOR_END}\n"
  printf "$MSG_END"

  SUBLPATH=$( convertpath ${APATH_BASH} )

  subl ${SUBLPATH}
}
