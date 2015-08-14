# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Theme
Theme "robbyrussell"

# Plugins
Plugin "rbenv"
Plugin "brew"

# Set default editor to neovim
set -x EDITOR nvim

# Set nvim truecolor var
set -x NVIM_TUI_ENABLE_TRUE_COLOR 1

# git aliases
alias gco "git checkout"
alias gcob "git checkout -b"
alias gcl "git clone"
alias ga "git add"
alias gaa "git add --all"
alias gc "git commit"
alias gca "git commit -a"
alias gpsh "git push"
alias gpll "git pull"
alias gb "git branch"
alias gm "git merge"
alias gs "git status"
alias gf "git fetch"
