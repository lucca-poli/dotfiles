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
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    isNormalUser = true;
    shell = pkgs.zsh;
    packages = [
      # utils
      pkgs-unstable.obsidian
      pkgs.spotify
      pkgs.kitty
      pkgs.starship
      pkgs.pass
      pkgs.htop-vim
      pkgs.stow

      # Development
      pkgs.go
      pkgs.rustup
      pkgs.nodejs_21
      pkgs.ghdl-llvm
      
      # lf
      pkgs.lf
      pkgs.zip
      pkgs.unzip
      pkgs.ghostscript
      pkgs.fontpreview
      pkgs.pistol

      # Hyprland
      pkgs.jq # A lightweight and flexible command-line JSON processor
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

