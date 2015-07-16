#!/bin/sh

fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@"
}



if ! command -v vim >/dev/null; then
  fancy_echo "Installing vim ..."
    apt-get install vim
else
  fancy_echo "Vim is already installed"
fi

if [ ! -d "$HOME/.vim" ]; then
  mkdir "$HOME/.vim"
fi

if [ ! -d "$HOME/.vim/autoload" ]; then
  mkdir "$HOME/.vim/autoload"
fi

if [ ! -d "$HOME/.vim/bundle" ]; then
  mkdir "$HOME/.vim/bundle" 
fi



fancy_echo "Getting the vimrc file ..."
#curl -LSso ~/.vimrc https://raw.githubusercontent.com/latnec/Configuration/master/dotFiles/_vimrc

fancy_echo "Installing pathogen ..."
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

fancy_echo "Installing some packages ..."

cd ~/.vim/bundle

git clone git://github.com/altercation/vim-colors-solarized.git 
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/Yggdroot/indentLine.git
git clone --recursive https://github.com/davidhalter/jedi-vim.git

