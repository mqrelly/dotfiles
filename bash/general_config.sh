# Set Ruby Gem home
GEM_HOME="$HOME/bin/gems"

# Useful aliases
alias g=git
alias vim=nvim

# Prevent prompt displacement after hitting ESC on previous command.
PS1="\[\033[G\]$PS1"

# Load auto-completion files
source ~/.bash/completion/*
