#!/bin/sh
export ZSHCONFIGDIR=$HOME/.config/zsh
HISTFILE=~/.zsh_history
setopt appendhistory

# man zshoptions for reference
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments

unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

#bindkeys
bindkey -v
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Up
bindkey -s '^o' 'vifm^M'
bindkey -s '^e' 'vim .^M'

# vars
KEYTIMEOUT=1

# source personal files
source "$ZSHCONFIGDIR/zshmanager.sh"
zsh_add_file "fns.sh"
zsh_add_file "generalias.sh"
zsh_add_file "jump.sh"
zsh_add_file "spotify.sh"
zsh_add_file "evals.sh"
zsh_add_file "prompt.sh"

# add plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
