{ config, pkgs, ... }:

{
  home.file = {
    ".p10k.zsh".source = ../config/zsh/p10k.zsh;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    
    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    shellAliases = {
      p = "cd ~/Documents/projects/";
      s = "cd ~/Documents/sandbox/";
      ls = "eza --icons";
      ll = "eza --icons -l";
      la = "eza --icons -la";
      sl = "wezterm cli split-pane --left";
      sb = "wezterm cli split-pane --bottom";
      nt = "wezterm cli set-tab-title";
      gs = "git status";
      open = "xdg-open";
      dev = "~/.local/bin/dev";
    };

    initContent = ''
      # Path configuration
      export PATH="$HOME/.local/bin:$PATH"
      export PATH=~/.opencode/bin:$PATH

      # Better editor integration
      export VISUAL=nvim
      export EDITOR=nvim
      export BROWSER=firefox

      # Useful Functions
      mkcd() { mkdir -p "$1" && cd "$1"; }

      # p10k
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      export NVM_DIR="$HOME/.config/nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    '';
    
    plugins = [
      {
        name = "zsh-autosuggestions";
        file = "zsh-autosuggestions.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        file = "zsh-syntax-highlighting.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.8.0";
          sha256 = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
        };
      }
    ];
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

  # Powerlevel10k theme
  home.packages = with pkgs; [
    zsh-powerlevel10k
  ];
}
