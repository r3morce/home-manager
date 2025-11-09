{ config, pkgs, ... }:

{
  # Alacritty is installed via pacman, so we only manage config
  home.file.".config/alacritty/alacritty.toml".source = ../config/alacritty/alacritty.toml;
}
