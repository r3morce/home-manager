{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Essential CLI tools
    bat
    eza
    duf
    
    # Development tools  
    docker-compose
    
    # Other utilities
    fastfetch
    gping
    wget
    unzip
    unrar
  ];

  # Bat (cat replacement)
  programs.bat = {
    enable = true;
    config = {
      theme = "Dracula";
    };
  };

  # Ripgrep
  programs.ripgrep = {
    enable = true;
  };
}
