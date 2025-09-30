## TODO:
# - Write function to open git repository in browser

# Profiling
echo "あじまるあじまる！！"
zmodload zsh/zprof

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
# homebrew
export HOMEBREW_NO_ANALYTICS=1

# ripgrep
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/.ripgreprc"

# direnv
if command -v direnv &>/dev/null; then
	eval "$(direnv hook zsh)"
fi

# mise
if command -v mise &>/dev/null; then
	eval "$(mise activate zsh)"
fi

# fzf
if command -v fzf &>/dev/null; then
	export FZF_DEFAULT_OPTS="--walker-skip=.git,node_modules,Library,.venv,.npm,.cache,.local"
	export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers {}'"
	source <(fzf --zsh)
fi

## Aliases
hash -d cf=$XDG_CONFIG_HOME
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

alias gAcm="git add -A; git commit -m"

alias gco="git checkout"

alias gp="git push"
alias gpf="git push --force"
alias gpu="git push -u origin HEAD"
alias gfm="git pull"
alias gfr="git pull --rebase"

# tmux
alias tm="tmux"
alias tms="tmux new-session -A -s $(hostname -s)"

# nvim
alias nv="nvim"

## Environment specific setup
if [[ "$(hostname)" == MA* ]]; then
	export CLOUD_DRIVE="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
	export LEDGER_FILE="$CLOUD_DRIVE/Finance/hledger.journal"

	alias led="nvim \$LEDGER_FILE"
else
	hash -d km="$HOME/Documents/work/kumamushi-v2/"
	export MISE_ENV="work"

	if command -v kubectl &>/dev/null; then
		source <(kubectl completion zsh)
	fi
fi

## Final module loads
# zsh-syntax-highlighting
source ${ZDOTDIR}/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets)

# zsh-history-substring-search
source ${ZDOTDIR}/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey ${key[Up]} history-substring-search-up
bindkey ${key[Down]} history-substring-search-down
HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS="l"

# End profiling
zprof
