# macOS specific
if [[ $(uname) == "Darwin" ]]; then
	export BROWSER='open'
	# homebrew
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# path (ensure uniqueness, add local)
typeset -gU cdpath fpath mailpath path

path=(
	$HOME/.local/bin
	$path
)

# envs
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

export LANG="en_AU.UTF-8"
export LC_MONETARY="ja_JP.UTF-8"
export LC_NUMERIC="ja_JP.UTF-8"
export LC_TIME="ja_JP.UTF-8"

