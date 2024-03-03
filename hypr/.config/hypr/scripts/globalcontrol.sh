#!/usr/bin/env sh

# wallpaper var
ConfDir="${XDG_CONFIG_HOME:-$HOME/.config}"
CloneDir="$HOME/Hyprdots"
ThemeCtl="$ConfDir/hypr/theme.ctl"
cacheDir="$HOME/.cache/hyprdots"

# hypr var
hypr_border=`hyprctl -j getoption decoration:rounding | jq '.int'`
hypr_width=`hyprctl -j getoption general:border_size | jq '.int'`

