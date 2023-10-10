local awful = require("awful")

awful.spawn.with_shell("compton")
awful.spawn.with_shell("$HOME/.config/polybar/launch.sh")
awful.spawn.with_shell("feh --randomize --bg-fill ~/Pictures/anime/*")
