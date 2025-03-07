#?/bin/bash/

COLOR=$(grim -g "$(slurp -p)" -t ppm - | convert - -format "#%[hex:p{0,0}]" info:)

if [[ -n "$COLOR" ]]; then
	echo "$COLOR" | wl-copy
	notify-send "Color copied ($COLOR)."
else 
	notify-send "Error" "No color was picked."
fi
