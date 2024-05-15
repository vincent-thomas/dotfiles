
typeset -U path cdpath fpath manpath

# HELPDIR="/nix/store/nxm7lxd5kcfzrvdkdvvnp3s1bxa6j3mi-zsh-5.9/share/zsh/$ZSH_VERSION/help"


# calling it twice causes slight start up slowdown
# as all $fpath entries will be traversed again.
# autoload -U compinit && compinit


# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="10000"

HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

# setopt HIST_FCNTL_LOCK
# setopt HIST_IGNORE_DUPS
# unsetopt HIST_IGNORE_ALL_DUPS
# setopt HIST_IGNORE_SPACE
# sunsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
# unsetopt EXTENDED_HISTORY


eval "$(zoxide init zsh)"

if [[ $TERM != "dumb" ]]; then
  eval "$(starship init zsh)"
fi

# Aliases
alias l='eza -l'

alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias gp='. $HOME/scripts/goto-project.sh'
