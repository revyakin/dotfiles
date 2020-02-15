#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo $BASEDIR

function link() 
{
	src="${BASEDIR}/$1"
	dst="$2"

	ln -is "${src}" "${dst}"
}

# sxhkd
link sxhkd ~/.config/sxhkd/sxhkdrc

# # vim
# ln -s ${BASEDIR}/vimrc ~/.vimrc
# ln -s ${BASEDIR}/vim/ ~/.vim
# 
# # zsh
# ln -s ${BASEDIR}/zshrc ~/.zshrc
# 
# # git
# ln -s ${BASEDIR}/gitconfig ~/.gitconfig
