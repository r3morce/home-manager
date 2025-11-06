{ config, pkgs, ... }:

{
  home.file = {
    ".zshrc".source = ../config/zsh/zshrc;
    ".p10k.zsh".source = ../config/zsh/p10k.zsh;
    ".config/zellij/config.kdl".source = ../config/zellij/config.kdl;
    ".config/zellij/layout.kdl".source = ../config/zellij/layout.kdl;
  };

  # FZF (fuzzy finder)
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # Zoxide (smart cd)
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
