{ config, lib, pkgs, ... }:

let
  private = import ../private.nix;
in

{
  # Git configuration
  programs.git = {
    enable = true;
    
    settings = {
      user = {
        name = private.gitUserName;
        email = private.gitUserEmail;
      };
    };
    
    ignores = [
      "**/.claude/settings.local.json"
    ];
  };

  # GitHub CLI (automatically sets up git credential helper)
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    settings = {
      git_protocol = "https";
    };
  };

  # LazyGit
  programs.lazygit = {
    enable = true;
  };
}
