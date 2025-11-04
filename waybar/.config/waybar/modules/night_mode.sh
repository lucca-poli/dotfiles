#!/bin/bash

# Check if wlsunset is running
if pgrep -x "wlsunset" > /dev/null; then
    # If running, kill it
    pkill wlsunset
else
    # If not running, start it
    wlsunset -l 49.8 -L 8.6 &
fi
