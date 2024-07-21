
typeset -U path cdpath fpath manpath

. ~/.cargo/env



# calling it twice causes slight start up slowdown
# as all $fpath entries will be traversed again.
# autoload -U compinit && compinit


# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="10000"
DISPLAY=:0

HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

# setopt HIST_FCNTL_LOCK
# setopt HIST_IGNORE_DUPS
# unsetopt HIST_IGNORE_ALL_DUPS
# setopt HIST_IGNORE_SPACE
# sunsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
# unsetopt EXTENDED_HISTORY

export EDITOR="nvim"

# Aliases
alias ls='eza -l'

alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias gg='gitm go -- '
alias cd="z"
alias clear="clear && sh $HOME/scripts/colorscripts/colorscripts.sh --random"

eval "$(zoxide init zsh)"

if [[ $TERM != "dumb" ]]; then
  eval "$(starship init zsh)"
fi

sh $HOME/scripts/colorscripts/colorscripts.sh --random

path+=("/home/vincent/.local/bin")

export PATH

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
