#!/usr/bin/env sh

# Check if wlogout is already running
if pgrep -x "wlogout" > /dev/null
then
    pkill -x "wlogout"
    exit 0
fi

# set file variables
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/globalcontrol.sh
wLayout="${XDG_CONFIG_HOME:-$HOME/.config}/wlogout/layout_$1"
wlTmplt="${XDG_CONFIG_HOME:-$HOME/.config}/wlogout/style_$1.css"

if [ ! -f $wLayout ] || [ ! -f $wlTmplt ] ; then
    echo "ERROR: Config $1 not found..."
    exit 1;
fi

# detect monitor res
x_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
hypr_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')


# scale config layout and style
case $1 in
    1)  wlColms=6
        export mgn=$(( y_mon * 28 / hypr_scale ))
        export hvr=$(( y_mon * 23 / hypr_scale )) ;;
    2)  wlColms=2
        export x_mgn=$(( x_mon * 35 / hypr_scale ))
        export y_mgn=$(( y_mon * 25 / hypr_scale ))
        export x_hvr=$(( x_mon * 32 / hypr_scale ))
        export y_hvr=$(( y_mon * 20 / hypr_scale )) ;;
esac

# scale font size
export fntSize=$(( y_mon * 2 / 100 ))

# detect system theme
whiteThemes=("Catppuccin-Latte" "Material-Sakura" "Frosted-Glass")
while IFS='|' read -r isActive ThemeSet _; do
    # Process each line (replace this with your own logic)
    if [ "$isActive" -eq 1 ]; then
        export wbarTheme="${ThemeSet}"
        if [[ " ${whiteThemes[@]} " =~ " ${ThemeSet} " ]]; then
            export BtnCol="white"
            export WindBg="rgba(0,0,0,0.5)"
        else
            export BtnCol="black"
            export WindBg="rgba(255,255,255,0.5)"
        fi
    fi
done < "$ThemeCtl"

# eval hypr border radius
export active_rad=$(( hypr_border * 5 ))
export button_rad=$(( hypr_border * 8 ))

# eval config files
wlStyle=`envsubst < $wlTmplt`

# launch wlogout
wlogout -b $wlColms -c 0 -r 0 -m 0 --layout $wLayout --css <(echo "$wlStyle") --protocol layer-shell
