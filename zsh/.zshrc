echo "sourcing generic .zshrc"
KEYTIMEOUT=1 #prevent long lags with zsh + vim
plugins=(git zsh-syntax-highlighting jump "$plugins[@]") #standard plugins 

#Custom functions
function cs () { #triggers ls after each cd
  cd "$@" && pwd && ls -lah
}

#List of all custom aliases
#Tar extractions
alias tgz='tar -zxvf' #z: gzip gunzip ungzip / x: extract from archive / v: verbose output / f: use archive file
alias tbz='tar -jxvf' #j: bzip2 / x: extract from archive / v: verbose output / f: use archive file

#alias for yarn
alias y='yarn'
alias ys='yarn start'
alias yt='yarn test'
alias yw='yarn test --watch'
alias yys='yarn && yarn start'
alias yb='yarn build'

#alias for pomodoro
alias p='pomodoro 25*60'

alias gay='echo "I am happily staging your updated files now :)" && gau'
alias sortBySize='find . -type f ! -path "./node_modules/*" ! -path "./.git/*" ! -path "*/.gems/*" ! -path "./dist/*" ! -path "./coverage/*" -exec wc -l {} + | sort -rn | less' 
alias excuse='curl -s http://pages.cs.wisc.edu/~ballard/bofh/excuses | shuf -n 1'

#check disk size 
alias biggie='du -sh *'

#alias for rm
alias rnm='rm -rf node_modules/'
alias wipenm='find . -name \*node_modules -type d -exec rm -rf {} +'

#alias for jump
alias j='jump' 
alias m='mark'
alias um='unmark'
alias ms='marks'

if [ -f ~/.docker_aliases ]; then
  . ~/.docker_aliases
fi
