source ${ZDOTDIR}/general.zsh
source ${ZDOTDIR}/utility.zsh
# TODO: source ${ZDOTDIR}/completion.zsh

# prompt
fpath+=(${ZDOTDIR}/modules/pure)
autoload -U promptinit; promptinit
prompt pure
zstyle :prompt:pure:git:stash show yes
RPROMPT="NEW %(?..%F{red}%?%f )%F{242}%*%f"

# TODO: history-substring-search, you-should-use


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

## Final module loads
# zsh-syntax-highlighting
source ./modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets)

