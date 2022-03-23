PROMPT_COMMAND=__prompt_command

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

__prompt_command() {
  local EXIT="$?"
  PS1=""

  local NC='\[\e[0m\]'       # No color

  local BLACK='\[\e[0;30m\]'
  local RED='\[\e[0;31m\]'
  local GREEN='\[\e[0;32m\]'
  local BROWN='\[\e[0;33m\]'
  local BLUE='\[\e[0;34m\]'
  local PURPLE='\[\e[0;35m\]'
  local CYAN='\[\e[0;36m\]'
  local GRAY='\[\e[0;37m\]'

  if [ $EXIT != 0 ] ; then
    PS1+="${RED}$EXIT${NC}"
  else
    PS1+="${GREEN}$EXIT${NC}"
  fi

  #PS1+=" \t "
  PS1+=" ${RED}[${NC}${PURPLE}\u@\h${NC}${RED}]${NC}"
  PS1+=" : ${BLUE}\w${NC}"
  PS1+="${BROWN}$(parse_git_branch)${NC}\n"
  PS1+="\$ "
}
