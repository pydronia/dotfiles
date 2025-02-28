### SETUP ZSH COMPLETIONS

# Completion sources
fpath=(
	$HOME/.local/share/zsh/completions # local completions
	${ZDOTDIR}/modules/zsh-completions/src # zsh-completions
	$fpath
)

# Taken from https://github.com/zimfw/completion/blob/master/init.zsh
() {
	builtin emulate -L zsh -o EXTENDED_GLOB
	# Check if dumpfile is up-to-date by comparing the full path and
	# last modification time of all the completion functions in fpath.
	local zdumpfile zstats zold_dat
	local -i zdump_dat=1
	zdumpfile=${ZDOTDIR}/.zcompdump

	# Get last modified time of all completion files in fpath, store in zstats
	LC_ALL=C local -r zcomps=(${^fpath}/^([^_]*|*~|*.zwc)(N))
	if (( ${#zcomps} )); then
		zmodload -F zsh/stat b:zstat && zstat -A zstats +mtime ${zcomps} || return 1
	fi

	# Make dat for current completion, compare to existing file if it exists and remove
	# existing if it's changed.
	local -r znew_dat=${ZSH_VERSION}$'\0'${(pj:\0:)zcomps}$'\0'${(pj:\0:)zstats}
	if [[ -e ${zdumpfile}.dat ]]; then
		zmodload -F zsh/system b:sysread && sysread -s ${#znew_dat} zold_dat <${zdumpfile}.dat || return 1
		if [[ ${zold_dat} == ${znew_dat} ]] zdump_dat=0
	fi
	if (( zdump_dat )); then
		command rm -f ${zdumpfile}(|.dat|.zwc(|.old))(N) || return 1
	fi

	# Load and initialize the completion system
	autoload -Uz compinit && compinit -C -d ${zdumpfile} || return 1

	if [[ ! ${zdumpfile}.dat -nt ${zdumpfile} ]]; then
		>! ${zdumpfile}.dat <<<${znew_dat}
	fi

	# Compile the completion dumpfile; significant speedup
	if [[ ! ${zdumpfile}.zwc -nt ${zdumpfile} ]] zcompile ${zdumpfile}
}

# Zsh options
setopt ALWAYS_TO_END # Move cursor to end of completion
setopt AUTO_LIST # List on ambiguous completion
setopt AUTO_MENU # Show menu after second tab press
setopt AUTO_PARAM_SLASH # Add trailing slash if parameter is directory
setopt COMPLETE_IN_WORD # Complete from both ends
# unsetopt LIST_BEEP

# Completion options (also a lot from zim and prezto configs)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${XDG_CACHE_HOME}/zsh/.zcompcache"

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format '%F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
zstyle ':completion:*' format '%F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|=*' 'l:|=* r:|=*'

# Ignore useless commands and functions
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'
# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order 'indexes' 'parameters'

# Directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
