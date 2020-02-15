#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CCLR="\e[39m"
CRED="\e[31m"
CGRN="\e[32m"

function link() 
{
	local src="${BASEDIR}/$1"
	local dst="$2"

	local okmsg="[ \e[32mOK\e[39m ]"
	local errmsg="[ \e[31mERR\e[39m ]"

	if [[ $(readlink -f "${dst}") -ef ${src} ]]; then
		echo -e "${okmsg} ${src} -> ${dst}" 1>&2
		return
	fi

	if [[ -a "${dst}" ]]; then
		echo -e "${errmsg} ${dst} already exists" 1>&2
		return
	fi

	mkdir -p "$(dirname "${dst}")" && ln -s "${src}" "${dst}" \
		&& echo -e "${okmsg} ${src} -> ${dst}" 1>&2 \
		&& echo -e "${errmsg} ${src} -> ${dst}" 1>&2
}


# BSPWM and SXHKD configs
link sxhkdrc ~/.config/sxhkd/sxhkdrc
link bspwmrc ~/.config/bspwm/bspwmrc
link polybar ~/.config/polybar


# VIM/Neovim configs
link vim/vimrc           ~/.vimrc
link vim/neovim-init.vim ~/.config/nvim/init.vim

# Install VIM/Neovim plugin manager (junegunn/vim-plug)
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

