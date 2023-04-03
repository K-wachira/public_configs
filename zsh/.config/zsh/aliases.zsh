#!/bin/sh
alias j='z'
alias f='zi'
alias p='z -'

alias jp='j PERSONAL'

alias vim="nvim"
alias 1s="/home/init/.screenlayout/1screen.sh"
alias 2s="/home/init/.screenlayout/2screens.sh"
alias sd="/home/init/.config/scripts/shutdown2.sh"

alias jn="j nvim && vim ."
# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias md='mkdir -p'

# get top process eating cpu ##
alias cpu='ps auxf | sort -nr -k 3 | head -5'

# get top process eating memory
alias mem='ps auxf | sort -nr -k 4 | head -5'
