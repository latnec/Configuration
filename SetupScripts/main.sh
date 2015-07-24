#!/bin/sh

fancy_echo() {
  local fmt="$1"; shift

  printf "\n$fmt\n" "$@"
}

printf "Hello\n"



#Check if curl is installed, if not, install it
if ! command -v curl >/dev/null; then
  fancy_echo "Installing curl ... "
    apt-get install -y curl
fi

#Check if git is installed
if ! command -v git >/dev/null; then
	fancy_echo "Installing git ..."
	apt-get install -y git
fi


fancy_echo "Installing Vim and its dependencies..."
  sh ./setupVim.sh
