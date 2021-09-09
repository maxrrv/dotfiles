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
alias yl='yarn link'
alias yc='yarn commit'
alias yj='yarn jest'
alias yjd='node --inspect-brk node_modules/.bin/jest --runInBand'

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

alias l='ls -lah'

alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gc='git commit'
alias gpsup='git push --set-upstream origin '
alias glg='git log -p'
alias gd='git diff | bat'
alias gau='git add -u'
alias gaa='git add .'
alias gds='git diff --staged | bat'
