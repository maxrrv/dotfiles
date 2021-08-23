# export ZSH=/Users/maximilian.ungar/.oh-my-zsh # Path to your oh-my-zsh installation.
# ZSH_THEME="minimal" #others: bira2, robbyrussel, agnoster, minimal
# plugins=(osx "$plugins[@]") #add mac related plugins
# plugins=(git zsh-syntax-highlighting jump "$plugins[@]") #standard plugins
# source $ZSH/oh-my-zsh.sh #must run after 'plugins' definition

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
# zinit plugins

# pure theme
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

export NVM_LAZY_LOAD=true
zinit ice wait
zinit load lukechilds/zsh-nvm

zinit ice wait
zinit light zdharma/fast-syntax-highlighting
zinit light mdumitru/git-aliases

#important configuration
KEYTIMEOUT=1 #prevent long lags with zsh + vim
setopt auto_cd

#alias, exports and custom functions
SHELLSTARTUP=~/.shellstartup
source $SHELLSTARTUP/fns.sh
source $SHELLSTARTUP/generalias.sh
source $SHELLSTARTUP/workalias.sh
source $SHELLSTARTUP/jump.sh
source $SHELLSTARTUP/spotify.sh
source $SHELLSTARTUP/crds.sh
source $SHELLSTARTUP/exports.sh
