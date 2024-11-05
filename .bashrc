export PS1='\[\033]0;bash $PWD\007\]\n\[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]$ '
alias ls='ls -alh'
alias gsr='for d in */; do echo $d && git -C $d status --short; done'
