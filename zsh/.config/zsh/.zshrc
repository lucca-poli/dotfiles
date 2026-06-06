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
    sudo cp /home/lucca/dotfiles/nixos/.config/nixos/* /etc/nixos
    sudo nixos-rebuild switch --flake ~/dotfiles/nixos/.config/nixos
}

function wifi-eduroam () {
    echo "Searching the best network available..."
    strongest_bssid=$(nmcli -f BSSID,SSID,SIGNAL dev wifi list | grep 'eduroam' | sort -k 3 -nr | head -n 1 | awk '{print $1}')

    echo "Found network with BSSID $strongest_bssid. Connecting..."
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

line_counter() {
    local dir="${1:-.}"

    while true; do
        local choice

        choice=$(
            {
                echo ".."

                rg --count . "$dir" 2>/dev/null \
                | sed "s#^$dir/##" \
                | awk '
                {
                    idx = match($0, /:[0-9]+$/)

                    path = substr($0, 1, idx - 1)
                    lines = substr($0, idx + 1)

                    split(path, parts, "/")

                    key = parts[1]

                    sums[key] += lines
                }

                END {
                    for (k in sums)
                        printf "%10d %s\n", sums[k], k
                }
                ' \
                | sort -nr
            } \
            | fzf --prompt="$dir > " \
                  --height=40% \
                  --layout=reverse
        )

        [ -z "$choice" ] && return

        if [ "$choice" = ".." ]; then
            dir="$(dirname "$dir")"
            continue
        fi

        local target
        target="$(echo "$choice" | awk '{print $2}')"

        target="$dir/$target"

        if [ -d "$target" ]; then
            dir="$target"
        else
            ${EDITOR:-nvim} "$target"
        fi
    done
}

alias st=~/.config/tmux/start_tmux.sh
alias python="python3.12"

export DOTNET_ROOT=$(dirname $(readlink -f $(which dotnet)))
export SSL_CERT_DIR=$HOME/.aspnet/dev-certs/trust:/usr/lib/ssl/certs
export PATH="$PATH:/home/lucca/.dotnet/tools"
export PATH="/home/lucca/.local/bin:$PATH"
