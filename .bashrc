export TERM="xterm-256color"                      # getting proper colors
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries

## ALIASES ##
alias to-vt-codes="cd '/c/Users/vincent/coding/VTCodes' && clear"
alias please="sudo !!"
alias ec2="ssh -i "/c/Users/vincent/.ssh/WebServeraws.pem" ec2-user@ec2-16-170-222-121.eu-north-1.compute.amazonaws.com"
alias v="nvim"
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias fuckoff="exit"

env=~/.ssh/agent.env


agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env

eval "$(starship init bash)"
# $HOME/.yarn/bin:
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"


export GPG_TTY=$(tty)

gpgconf --launch gpg-agent

SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}"
    /usr/bin/ssh-add;
}


if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

ssh-add ~/.ssh/github
ssh-add ~/.ssh/azure_devops

colorscripts.sh random
