{ config, pkgs, ... }:

{
  home.file = {
    ".config/wezterm".source = ../config/wezterm;
  };
}
