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

function __git_prompt_git() {
  GIT_OPTIONAL_LOCKS=0 command git "$@"
}

function git_current_branch() {
  local ref
  ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}
