
info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

directory_exist () {
  if [[ -d "$1" ]] ; then
    return 0
  else
    return 1
  fi
}

get_os () {
  if [[ "$(uname)" == "Darwin" ]]; then
    echo "darwin"
  elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    echo "linux"
  else
    echo "windows"
  fi
}

export OS=`get_os`
