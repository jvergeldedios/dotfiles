# Path to Oh My Fish install.
set -gx OMF_PATH /Users/julian/.local/share/omf

set -gx EDITOR vim

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

#this script can never fail
#i use it in the fish_config
#call it with start_agent

setenv SSH_ENV $HOME/.ssh/environment

function start_agent
  if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
      test_identities
    end
  else
    if [ -f $SSH_ENV ]
      . $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
      test_identities
    else
      ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
      chmod 600 $SSH_ENV
      . $SSH_ENV > /dev/null
      ssh-add
    end
  end
end


function test_identities
  ssh-add -l | grep "The agent has no identities" > /dev/null
  if [ $status -eq 0 ]
    ssh-add
    if [ $status -eq 2 ]
      start_agent
    end
  end
end


function fish_title
  if [ $_ = 'fish' ]
    echo (prompt_pwd)
  else
    echo $_
  end
end

# Editor aliases
alias vim nvim
alias v vim

# Git aliases
alias ga        "git add"
alias gaa       "git add . --all"
alias gb        "git branch"
alias gc        "git commit -m"
alias gco       "git checkout"
alias gcl       "git clone"
alias gd        "git diff"
alias gpl       "git pull"
alias gpsh      "git push"
alias gs        "git status"
alias gstash    "git stash"
alias gsp       "git stash pop"

status --is-interactive; and . (rbenv init -|psub)

start_agent
