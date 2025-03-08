source ${ZDOTDIR}/general.zsh # General zsh options
source ${ZDOTDIR}/utility.zsh # General utility options/aliases
source ${ZDOTDIR}/completion.zsh # Completions setup

## Initial module loads
# prompt
fpath+=(${ZDOTDIR}/modules/pure)
autoload -U promptinit; promptinit
prompt pure
zstyle :prompt:pure:git:stash show yes
RPROMPT="%(?..%F{red}%?%f )%F{242}%*%f"

# zsh-you-should-use
source ${ZDOTDIR}/modules/zsh-you-should-use/you-should-use.plugin.zsh

## Program setup
# nvim
# TEMP TESTING LAZYVIM
export NVIM_APPNAME="lazyvim"

# homebrew
export HOMEBREW_NO_ANALYTICS=1

# ripgrep
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/.ripgreprc"

# direnv
if command -v direnv &>/dev/null; then
	eval "$(direnv hook zsh)"
fi

# mise
eval "$(mise activate zsh)"

# fzf
export FZF_DEFAULT_OPTS="--walker-skip=.git,node_modules,Library"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers {}'"
source <(fzf --zsh)

## Named directories
hash -d km="$HOME/Documents/work/kumamushi-v2/"

## Aliases
alias vea="source .venv/bin/activate"

# git
alias g="git"
alias gs="git status"
alias gl="git log"
alias gd="git diff"

alias ga="git add"
alias gaa="git add -A"

alias gc="git commit"
alias gcm="git commit -m"
alias gcAm="git add -A; git commit -m"

alias gco="git checkout"

alias gp="git push"
alias gfm="git pull"
alias gfr="git pull --rebase"

# tmux
alias tm="tmux"
alias tms="tmux new-session -A -s $(hostname -s)"

## Final module loads
# zsh-syntax-highlighting
source ${ZDOTDIR}/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets)

# zsh-history-substring-search
source ${ZDOTDIR}/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey ${key[Up]} history-substring-search-up
bindkey ${key[Down]} history-substring-search-down

