# .bashrc

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

HISTSIZE=1000
HISTFILESIZE=2000

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# User specific aliases and functions
alias ff="find . -name"
alias gam="git add \`git diff --name-only\`"
alias gamc="gam ; git commit"
alias glg="git lg"
alias gst="git st"
alias vrc="vim ~/.vimrc"
alias ll="ls -la"
alias less="less -R"

function vff() {
  vim `ff $1`
}

source ~/.bash_profile

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
