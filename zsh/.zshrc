source ${ZDOTDIR}/general.zsh
source ${ZDOTDIR}/utility.zsh
# TODO: source ${ZDOTDIR}/completion.zsh
# TODO: prompt theme, syntax-highlighting, history-substring-search, you-should-use

# RPROMPT="%(?..%F{red}%?%f )%F{#586e74}%*%f"

# homebrew
export HOMEBREW_NO_ANALYTICS=1

# ripgrep
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/.ripgreprc"

# direnv
eval "$(direnv hook zsh)"

# mise
eval "$(mise activate zsh)"

# fzf
export FZF_DEFAULT_OPTS="--walker-skip=.git,node_modules,Library"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers {}'"
source <(fzf --zsh)

## Aliases
alias work="cd ~/Documents/work/kumamushi-v2/"

alias tm="tmux"
alias tms="tmux new-session -A -s $(hostname -s)"

