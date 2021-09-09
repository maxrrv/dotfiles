#Custom functions
function cs () { #triggers ls after each cd
  cd "$@" && pwd && ls -lah
}

timestamp() {
  gdate +"%s%N" # current time
}

nvm_load () {
  . $NVM_DIR/nvm.sh
  . $NVM_DIR/bash_completion
}

