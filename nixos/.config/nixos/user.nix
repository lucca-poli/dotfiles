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
      pkgs.jq # A lightweight and flexible command-line JSON processor
      pkgs.imagemagick
      pkgs.libnotify

      # Development
      pkgs.go
      pkgs.rustup
      pkgs.nodejs_21
      
      # lf
      pkgs.lf
      pkgs.zip
      pkgs.unzip
      pkgs.ghostscript
      pkgs.fontpreview
      pkgs.pistol

      # Hyprland
      pkgs.parallel
      pkgs.grimblast
      pkgs.grim
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
      pkgs.spicetify-cli
      pkgs.nwg-look
      pkgs.glib
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
    ];
  };

  # Fingerprint on swaylock
  security.pam.services.swaylock = {};

  # Make Eletron and Chromium based apps work
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.dbus.enable = true;
  xdg.portal = { 
    enable = true; 
    wlr.enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-hyprland
      pkgs.pkgs.xdg-desktop-portal-gtk
    ]; 
  };
  services.gnome.gnome-keyring.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}

