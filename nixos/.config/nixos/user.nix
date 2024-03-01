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
      # Terminal
      pkgs.imagemagick
      pkgs.kitty
      pkgs.starship
      pkgs.pass
      pkgs.htop-vim
      pkgs.stow
      pkgs.jq # A lightweight and flexible command-line JSON processor
        
      # lf
      pkgs.lf
      pkgs.zip
      pkgs.unzip
      pkgs.ghostscript
      pkgs.fontpreview
      pkgs.pistol

      # utils
      pkgs-unstable.obsidian

      # Hyprland
      pkgs.grim
      pkgs.qalculate-gtk
      pkgs.slurp
      pkgs.firefox
      pkgs.feh
      pkgs.waybar
      pkgs.hyprpaper
      pkgs.wlogout
      pkgs.dconf
      pkgs.libsForQt5.dolphin
      pkgs.wofi

      # Development
      pkgs.go
      pkgs.rustup
      pkgs.nodejs_21
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}

