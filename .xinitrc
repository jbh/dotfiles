eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

xrandr --output DP-4 --rotate right &
picom -b &
#exec dwm
exec bspwm

