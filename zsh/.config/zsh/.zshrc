#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh
HISTFILE=~/.zsh_history
setopt appendhistory

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments

unsetopt BEEP

# source personal files

source "$ZDOTDIR/fns.sh"
source "$ZDOTDIR/generalias.sh"
source "$ZDOTDIR/jump.sh"
source "$ZDOTDIR/spotify.sh"
