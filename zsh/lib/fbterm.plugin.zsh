# start ""fbterm"" automatically in /dev/tty*

if (( ${+commands[yaft]} )); then
	if [[ "$TTY" = /dev/tty* ]] ; then
		yaft && exit
	fi
fi
