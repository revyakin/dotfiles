#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function link() 
{
	src="${BASEDIR}/$1"
	dst="$2"

	echo "Linking '${src}' to '${dst}'"
	ln -is "${src}" "${dst}"
}

# BSPWM and SXHKD configs
link sxhkdrc ~/.config/sxhkd/sxhkdrc
link bspwmrc ~/.config/bspwm/bspwmrc

