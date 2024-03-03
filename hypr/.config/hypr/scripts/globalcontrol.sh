#!/usr/bin/env sh

# wallpaper var
EnableWallDcol=0
ConfDir="${XDG_CONFIG_HOME:-$HOME/.config}"
CloneDir="$HOME/Hyprdots"
ThemeCtl="$ConfDir/hypr/theme.ctl"
cacheDir="$HOME/.cache/hyprdots"

# detect system theme
whiteThemes=("Catppuccin-Latte" "Material-Sakura" "Frosted-Glass")
while IFS='|' read -r isActive theme _; do
    # Process each line (replace this with your own logic)
    if [ "$isActive" -eq 1 ]; then
        gtkTheme="${theme}"
        if [[ " ${whiteThemes[@]} " =~ " ${theme} " ]]; then
            gtkMode="white"
        else
            gtkMode="black"
        fi
    fi
done < "$ThemeCtl"

# hypr var
hypr_border=`hyprctl -j getoption decoration:rounding | jq '.int'`
hypr_width=`hyprctl -j getoption general:border_size | jq '.int'`

