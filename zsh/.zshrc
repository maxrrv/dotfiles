###############################################################################
#Settings
###############################################################################
KEYTIMEOUT=1

###############################################################################
#Custom functions
###############################################################################
function cs () { #triggers ls after each cd
      cd "$@" && pwd && ls -lah
          }
###############################################################################
#List of all custom aliases
###############################################################################

#adb alias for android studio
alias adb='~/Android/Sdk/platform-tools/adb'

#Tar extractions
alias tgz='tar -zxvf' #z: gzip gunzip ungzip / x: extract from archive / v: verbose output / f: use archive file
alias tbz='tar -jxvf' #j: bzip2 / x: extract from archive / v: verbose output / f: use archive file

#alias for yarn
alias y='yarn'
alias ys='yarn start'
alias yt='yarn test'
alias yw='yarn test --watch'
alias yys='yarn && yarn start'
