{ config, pkgs, ... }:

{
  home.file = {
    ".zshrc".source = ../config/zsh/zshrc;
    ".p10k.zsh".source = ../config/zsh/p10k.zsh;
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
