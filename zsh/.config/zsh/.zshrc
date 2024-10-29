# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$(echo $ZDOTDIR)/.zshrc'

autoload -Uz compinit
compinit

# Keybinds
# bindkey -s "^f" "tmux-sessionizer\n"

# ENV variable
export EDITOR=nvim
export BROWSER=firefox

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

function update () {
    sudo cp /home/lucca/.dotfiles/nixos/.config/nixos/* /etc/nixos
    sudo nixos-rebuild switch
}

function wifi-eduroam () {
    strongest_bssid=$(nmcli -f BSSID,SSID,SIGNAL dev wifi list | grep 'eduroam' | sort -k 3 -nr | head -n 1 | awk '{print $1}')

    nmcli connection modify wifi-eduroam 802-11-wireless.bssid $strongest_bssid 
    nmcli connection up wifi-eduroam
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

alias st=~/.config/tmux/start_tmux.sh
