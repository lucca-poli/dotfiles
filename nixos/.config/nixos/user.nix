{ 
  config, 
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
      pkgs.parallel
      pkgs.kitty
      pkgs.starship
      pkgs.pass
      pkgs.htop-vim
      pkgs.stow
      pkgs.jq # A lightweight and flexible command-line JSON processor
      pkgs.imagemagick

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
      pkgs.grim
      pkgs.qalculate-gtk
      pkgs.swww
      pkgs.cliphist
      pkgs.swappy
      pkgs.slurp
      pkgs.firefox
      pkgs.feh
      pkgs.waybar
      pkgs.hyprpaper
      pkgs.hyprpicker
      pkgs.wlogout
      pkgs.swaylock-effects
      pkgs.dconf
      pkgs.nwg-look
      pkgs.libsForQt5.ffmpegthumbs
      pkgs.libsForQt5.dolphin
      pkgs.libsForQt5.ark
      pkgs.libsForQt5.qtstyleplugin-kvantum
      pkgs.libsForQt5.qt5ct
      pkgs.libsForQt5.qt5.qtimageformats
      pkgs.libsForQt5.qt5.qtgraphicaleffects
      pkgs.libsForQt5.qt5.qtquickcontrols
      pkgs.libsForQt5.qt5.qtquickcontrols2
      pkgs.libsForQt5.qt5.qtwayland
      pkgs.libsForQt5.sddm
      pkgs.qt6.qtwayland
      pkgs.qt6Packages.qt6ct
      pkgs.xdg-desktop-portal-hyprland
      pkgs.rofi-wayland
      pkgs.dunst
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}

