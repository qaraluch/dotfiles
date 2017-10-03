
# default make for js pair src file and test file
# for:
# dv-menu.sh

## for refactor !!!

dev_menu_js_new_src_and_test() {
  local FNAME=$1
if [ -z "$1" ] ; then
  echo -e "[!][dev][create] -> file name: \c "
  read  FNAME
fi

FNAMESRC="${FNAME}.js"
FNAMETEST="${FNAME}.test.js"

PATH_FNAMESRC="${PWD}/src/${FNAMESRC}"
PATH_FNAMETEST="${PWD}/test/${FNAMETEST}"

touch ${PATH_FNAMESRC}
touch ${PATH_FNAMETEST}

echo "${PATH_FNAMESRC}" # | clip # file name to clipboard
echo "${PATH_FNAMETEST}" # | clip # file name to clipboard

MSG_END1="${COLOR_YELLOW}[!][dev][create] -> Touched new file: ${FNAMESRC} ${COLOR_END}\n"
MSG_END2="${COLOR_YELLOW}[!][dev][create] -> Touched new file: ${FNAMETEST} ${COLOR_END}\n"

printf "$MSG_END1"
printf "$MSG_END2"

convertpath() { echo $1 | sed -e 's/^\///' -e 's/\//\\/g' -e 's/^./\0:/' ;}

SUBLPATH1=$( convertpath ${PATH_FNAMESRC} )
SUBLPATH2=$( convertpath ${PATH_FNAMETEST} )

subl ${SUBLPATH1}
subl ${SUBLPATH2}

}



