# Path to Oh My Fish install.
set -gx OMF_PATH /Users/julian/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /Users/julian/.config/omf

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

setenv PATH '/Users/julian/.pyenv/shims' $PATH
setenv PYENV_SHELL fish
. '/usr/local/Cellar/pyenv/20160726/libexec/../completions/pyenv.fish'
command pyenv rehash 2>/dev/null
function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    . (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end

alias vim nvim

set -gx EDITOR vim

set -gx GOPATH $HOME/.go
set -gx PATH $GOPATH/bin $PATH

status --is-interactive; and . (rbenv init -|psub)

start_agent
