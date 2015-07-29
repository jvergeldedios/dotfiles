# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Theme
Theme "robbyrussell"

# Plugins
Plugin "rbenv"
Plugin "brew"

# Set default editor to vim
set -x EDITOR vim

# git aliases
alias gco "git checkout"
alias gcob "git checkout -b"
alias gcl "git clone"
alias ga "git add"
alias gaa "git add --all"
alias gc "git commit"
alias gpsh "git push"
alias gpll "git pull"
alias gb "git branch"
alias gm "git merge"
alias gs "git status"

