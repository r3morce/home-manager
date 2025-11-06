{ config, pkgs, ... }:

{
  home.file = {
    ".config/nvim".source = ../config/nvim;
  };

  # LazyVim dependencies
  home.packages = with pkgs; [
    gcc
    nodejs
  ];

  # Neovim configuration
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
