{ 
  config, 
  lib,
  pkgs,
  pkgs-unstable,
  ... 
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lucca = {
    description = "Luiz Carlos de Azevedo Santana";
    extraGroups = [ "networkmanager" "wheel" "audio" "docker" ];
    isNormalUser = true;
    shell = pkgs.zsh;
    packages = [
      # util
      pkgs.obsidian
      pkgs.stremio
      pkgs.spotify
      pkgs.kitty
      pkgs.tmux
      # pkgs.alacritty quando tiver image support eu adiciono
      pkgs.starship
      pkgs.pass
      pkgs.htop
      pkgs.stow
      pkgs.btop
      pkgs.zoom-us
      pkgs.sl
      pkgs.mpv-unwrapped # Audio player
      pkgs.texliveSmall # Latex (.tex) to pdf
      # pkgs.poppler_utils # Merge pdfs
      # pkgs.libreoffice
      pkgs.xorg.xev # Check keyboard keys
      pkgs.google-chrome # For tests in whatsapp for IC
      pkgs.ani-cli # Watch animes
      pkgs.wlsunset
      pkgs.xorg.xbacklight

      # Development/Poli
      pkgs.rustup
      pkgs.nodejs_22
      pkgs.gnumake
      pkgs.graphviz
      pkgs.wireshark

      # Package managers
      pkgs.uv
      pkgs.luajitPackages.luarocks

      # yazi
      pkgs.yazi
      pkgs.zip
      pkgs.unzip

      # Neovim
      pkgs.lua-language-server
      pkgs.typescript-language-server
      pkgs.stylua
      pkgs.nodePackages.prettier

      # Gaming
      pkgs.prismlauncher
      pkgs.hmcl
      pkgs.temurin-jre-bin-8
      pkgs.temurin-jre-bin-21
      pkgs.zulu

      # Hyprland
      pkgs.jq # A lightweight and flexible command-line JSON processor
      pkgs.xdg-utils
      pkgs.imagemagick
      pkgs.libnotify
      pkgs.parallel
      pkgs.grimblast
      pkgs.qalculate-gtk
      pkgs.swww
      pkgs.mpd
      pkgs.cliphist
      pkgs.swappy
      pkgs.slurp
      pkgs.cava
      pkgs.brave
      pkgs.google-chrome
      pkgs.firefox
      pkgs.feh
      pkgs.waybar
      pkgs.hyprpicker
      pkgs.dbus
      pkgs.wlogout
      pkgs.envsubst
      pkgs.swaylock-effects
      pkgs.dconf
      pkgs.nwg-look
      pkgs.libsForQt5.polkit-kde-agent
      pkgs.libsForQt5.ffmpegthumbs
      pkgs.libsForQt5.dolphin
      pkgs.libsForQt5.ark
      pkgs.libsForQt5.qt5ct
      pkgs.libsForQt5.qt5.qtimageformats
      pkgs.libsForQt5.qt5.qtgraphicaleffects
      pkgs.libsForQt5.qt5.qtquickcontrols
      pkgs.libsForQt5.qt5.qtquickcontrols2
      pkgs.libsForQt5.qt5.qtwayland
      pkgs.libsForQt5.sddm
      pkgs.libsForQt5.konsole
      pkgs.qt6.qtwayland
      pkgs.qt6Packages.qt6ct
      pkgs.rofi-wayland
      pkgs.dunst
      pkgs.upower
    ];
  };

  virtualisation.docker.enable = true;

  environment.sessionVariables = {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    # XDG_DATA_HOME   = "$HOME/.local/share";
    # XDG_STATE_HOME  = "$HOME/.local/state";

  };

  # Dynamic links for python env in uv
  programs.nix-ld.enable = true;

  # Fingerprint on swaylock
  security.pam.services.swaylock = {};

  services.dbus.enable = true;
  xdg.portal = { 
    enable = true; 
    extraPortals = [ 
      pkgs.xdg-desktop-portal-hyprland
    ]; 
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}

