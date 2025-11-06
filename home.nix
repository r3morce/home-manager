{ config, pkgs, ... }:

let
  private = import ./private.nix;
in

{
  imports = [
    ./modules/git.nix 
    ./modules/zsh.nix
    ./modules/wezterm.nix
    ./modules/neovim.nix
    ./modules/packages.nix
  ];

  home.username = private.username;
  home.homeDirectory = private.homeDirectory;

  home.stateVersion = "25.05";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
