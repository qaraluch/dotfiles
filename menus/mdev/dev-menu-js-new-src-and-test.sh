# touches pair src/<name>.js and test/<name>.test.js
# for:
# dv-menu.sh

# UTILS
_DEV_TASK_TOUCH_PAIR="[ touch pair ]"

dev_menu_touch_pair() {
  echo "${_DEV_PROMPT} About to touch pair dev files..."
  local _FNAME=$1
  if [ -z "$1" ] ; then
    vared -p "${_DEV_PROMPT}${_DEV_TASK_GITHUBINIT} Input filename: " _FNAME
  fi

  _FNAMESRC="${_FNAME}.js"
  _FNAMETEST="${_FNAME}.test.js"

  _PATH_FNAMESRC="${PWD}/src/${_FNAMESRC}"
  _PATH_FNAMETEST="${PWD}/test/${_FNAMETEST}"

  touch ${_PATH_FNAMESRC}
  touch ${_PATH_FNAMETEST}

  _MSG_END1="${_DEV_PROMPT}${_DEV_TASK_TOUCH_PAIR} Touched new file:${C_YELLOW} ${_FNAMESRC} ${C_END}"
  _MSG_END2="${_DEV_PROMPT}${_DEV_TASK_TOUCH_PAIR} Touched new file:${C_YELLOW} ${_FNAMETEST} ${C_END}"

  echo "$_MSG_END1"
  echo "$_MSG_END2"

  echo "${_DEV_PROMPT} About to open files in code..."
  sleep 1
  code_it "$_PATH_FNAMESRC"
  code_it "$_PATH_FNAMETEST"

}



