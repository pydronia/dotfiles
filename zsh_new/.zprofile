# macOS specific
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# envs
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

export LANG="en_AU.UTF-8"
export LC_MONETARY="ja_JP.UTF-8"
export LC_NUMERIC="ja_JP.UTF-8"
export LC_TIME="ja_JP.UTF-8"

## paths
# ensure unique
typeset -gU cdpath fpath mailpath path

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

path=(
	$HOME/.local/bin
	$path
)

fpath=(
	$HOME/.local/share/zsh/completions
	$fpath
)

