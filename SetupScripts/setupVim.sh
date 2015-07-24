#!/bin/sh

fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@"
}



if ! command -v vim >/dev/null; then
  fancy_echo "Installing vim ..."
    apt-get install -y vim
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
curl -LSso ~/.vimrc https://raw.githubusercontent.com/latnec/Configuration/master/dotFiles/.vimrc

fancy_echo "Installing pathogen ..."
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

fancy_echo "Installing some packages ..."

cd ~/.vim/bundle

git clone git://github.com/altercation/vim-colors-solarized.git 
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/Yggdroot/indentLine.git
git clone --recursive https://github.com/davidhalter/jedi-vim.git

mkdir ~/.config/colorScheme/

curl -LSso ~/.config/colorScheme/base16-solarized.dark.sh https://raw.githubusercontent.com/latnec/Configuration/master/colorScheme/base16-solarized.dark.sh

echo -e "BASE16_SHELL=\"$HOME/.config/colorScheme/base16-solarized.dark.sh\"[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL" >> ~/.bashrc
