#!/bin/sh

final_info=""
player=$(fastfetch -c ~/.config/fastfetch/tmux/player.jsonc --player-format "{1}")


if [ -n "$player" ]; then
	case $player in
		Spotify)
			final_info='󰓇 '
			;;
		Firefox)
			final_info='󰈹 '
			;;
		*)
			final_info=' '
			;;
	esac
	final_info="${final_info}$(fastfetch -c ~/.config/fastfetch/tmux/media.jsonc --media-format "{3} - {1}")"
fi
echo $final_info
