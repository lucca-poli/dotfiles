# Runs on every zsh session

# Adds '~/.local/bin' to PATH
export PATH="$PATH:$HOME/.local/bin/:$HOME/.local/bin/personal"
export PATH="$HOME/Tools/nvim-linux64/bin:$PATH"

# Default programs
export TERMINAL="kitty"
export BROWSER="brave"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ~/ Clean-up
export ZDOTDIR="$HOME/.config/zsh"
export ZSH="$HOME/.config/zsh/.oh-my-zsh"

. "$HOME/.cargo/env"
