#!/usr/bin/env bash

final_info=""
available_width=$((($1 - 80) >> 1))                                # approximation for around half of available middle width
available_width=$(($available_width > 45 ? 45 : $available_width)) # Limit to 45
((available_width <= 0)) && exit 0                                 # exit if no space
{
	read -r player
	read -r playing
	read -r media
} < <(fastfetch -c ~/.config/fastfetch/tmux/media.jsonc)

if [ -n "$player" ]; then
	if [[ "$playing" == "Paused" ]]; then
		final_info=' '
	else
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
	fi
	final_info="${final_info}${media}"

	if ((${#final_info} > available_width)); then
		echo -nE "${final_info:0:available_width}…"
	else
		echo -nE "$final_info" " "
	fi
fi
