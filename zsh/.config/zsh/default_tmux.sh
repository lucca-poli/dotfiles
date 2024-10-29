#!/bin/bash

# Check if inside a tmux session
if [ -z "$TMUX" ]; then
  echo "This script must be run inside a tmux session."
  exit 1
fi

# Rename the first window to 'neovim' and run 'nvim .'
tmux rename-window -t 0 'neovim'
tmux send-keys -t 'neovim' 'nvim .' C-m

# Create a new window called 'multi-task'
tmux new-window -n 'multi-task'

# Optional: Switch to the new window if you want
tmux select-window -t 'multi-task'
