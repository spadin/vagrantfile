#! /usr/bin/env bash

git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

homeshick clone jimeh/git-aware-prompt
homeshick clone junegunn/vim-plug
homeshick clone spadin/dotbashrc
homeshick clone spadin/dotvimrc
homeshick clone spadin/dotfilesdeux
homeshick link -f

vim -u ~/.vimrc.d/plugins.vim +PlugInstall +qall
