#!/bin/sh
alias j='z'
alias f='zi'
alias p='z -'

alias jp='j PERSONAL'
alias jn="j nvim && vim ."

alias vim="nvim"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias md='mkdir -p'

alias t='touch'
alias c='clear'

# get top process eating cpu ##
alias cpu='ps auxf | sort -nr -k 3 | head -5'

# get top process eating memory
alias mem='ps auxf | sort -nr -k 4 | head -5'

#shutdown
alias sd="/home/init/.config/scripts/shutdown2.sh"
