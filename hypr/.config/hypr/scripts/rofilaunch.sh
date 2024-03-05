#!/usr/bin/env sh

ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/globalcontrol.sh
roconf="~/.config/rofi/config.rasi"


# rofi action

case $1 in
    e)  r_mode="electron" ;; 
    d)  r_mode="drun" ;; 
    w)  r_mode="window" ;;
    f)  r_mode="filebrowser" ;;
    h)  echo -e "rofilaunch.sh [action]\nwhere action,"
        echo "d :  drun mode"
        echo "w :  window mode"
        echo "f :  filebrowser mode,"
        exit 0 ;;
    *)  r_mode="drun" ;;
esac


# read hypr theme border

wind_border=$(( hypr_border * 3 ))
elem_border=`[ $hypr_border -eq 0 ] && echo "10" || echo $(( hypr_border * 2 ))`
r_override="window {border: ${hypr_width}px; border-radius: ${wind_border}px;} element {border-radius: ${elem_border}px;}"

# launch rofi

if [ "$r_mode" = "electron" ]; then
    app=`$ConfDir/rofi/apps.sh | rofi -dmenu -theme-str "${r_override}" -config "${roconf}" | awk '{print $2}'`

    case $app in
        obsidian)
            obsidian -enable-features=UseOzonePlatform -ozone-platform=wayland --ozone-platform-hint=auto
            ;;
        spotify)
            spotify -enable-features=UseOzonePlatform -ozone-platform=wayland --ozone-platform-hint=auto
            ;;
        *)
            echo "App not found"
            ;;
        esac
else
    rofi -show $r_mode -theme-str "${r_override}" -config "${roconf}"
fi

