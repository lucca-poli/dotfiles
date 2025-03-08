#!/usr/bin/env bash

in_tmux() {
    local name=$1
    if [ -n "$TMUX" ]; then
        tmux switch-client -t "$name"
    else
        tmux attach-session -t "$name"
    fi
}

# List directories in $HOME, $HOME/Documents, and $HOME/.config
home_dirs=$(find "$HOME" -maxdepth 1 -type d)
documents_dirs=$(find "$HOME/Documents" -maxdepth 2 -type d)
ic_dir=$(find "$HOME/Documents/engineering/IC" -maxdepth 2 -type d)
control_dir=$(find "$HOME/Documents/engineering/controle" -maxdepth 2 -type d)
config_dirs=$(find -L "$HOME/.config" -maxdepth 1 -type d)
    
# Combine directory lists
all_dirs=$(echo -e "$home_dirs\n$documents_dirs\n$config_dirs\n$ic_dir\n$control_dir")
all_dirs=$(echo "$all_dirs" | sort | uniq)
all_dirs=$(echo -e "Exit\n$all_dirs")
    
# Use fzf to select a directory
selected_dir=$(echo "$all_dirs" | fzf)

if [ "$selected_dir" = "Exit" ]; then
    echo "No session selected."
    exit 0
else
    session_name=$(basename "$selected_dir")
    if tmux has-session -t "$session_name" 2>/dev/null; then
        in_tmux $session_name
    else
        tmux new-session -d -s "$session_name" -c "$selected_dir"
        tmux new-window -t $session_name -n 'multi-task' -c "$selected_dir" -a

        tmux rename-window -t $session_name:1 'neovim'
        tmux send-keys -t $session_name:'neovim' 'nvim .' C-m

        tmux select-window -t $session_name:'neovim'
        in_tmux $session_name
    fi  
fi
