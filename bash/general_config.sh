# Set Ruby Gem home
GEM_HOME="$HOME/bin/gems"
export GEM_HOME

PATH="$GEM_HOME/bin:$PATH"
export PATH

# Useful aliases
alias g=git
alias vim=nvim

# Prevent prompt displacement after hitting ESC on previous command.
PS1="\[\033[G\]$PS1"

# Load auto-completion files
source ~/.bash/completion/*

__git_complete g __git_main
