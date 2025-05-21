### SET USER HOOKS

autoload -Uz add-zle-hook-widget
autoload -Uz add-zsh-hook

# Shell features if not in Ghostty (already provides shell integration)
if [[ $TERM != *ghostty* ]]; then
	# Cursor shape adjustment
	set-cursor-style() {
		case ${KEYMAP-} in
			vicmd|visual) echo -ne "\e[1 q";;
			*) echo -ne "\e[5 q";;
		esac
	}
	zle -N set-cursor-style
	add-zle-hook-widget -Uz keymap-select set-cursor-style
	add-zle-hook-widget -Uz line-init set-cursor-style

	reset-cursor-style() {
		echo -ne "\e[0 q"
	}
	add-zsh-hook -Uz preexec reset-cursor-style

	# TODO: Emit OSC 133 codes
fi

# Set application mode ("keyboard-transit" mode?)
if [[ -n ${terminfo[smkx]} && -n ${terminfo[rmkx]} ]]; then
	# Enable application mode when zle is active
	start-application-mode() {
		echoti smkx
	}
	stop-application-mode() {
		echoti rmkx
	}
	add-zle-hook-widget -Uz line-init start-application-mode
	add-zle-hook-widget -Uz line-finish stop-application-mode
fi

