{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "dracula";
      default_shell = "zsh";
      show_startup_tips = false;
      simplified_ui = false;
      pane_frames = true;
      session_serialization = true;
      mouse_mode = true;
      copy_on_select = true;
      copy_command = "wl-copy";
    };
  };

  # Use file-based layouts since home-manager doesn't generate valid KDL
  home.file.".config/zellij/layouts/default.kdl".text = ''
    layout {
        default_tab_template {
            children
            pane size=1 borderless=true {
                plugin location="zellij:status-bar"
            }
        }
    }
  '';

  home.file.".config/zellij/layouts/dev.kdl".text = ''
    layout {
        default_tab_template {
            children
            pane size=1 borderless=true {
                plugin location="zellij:status-bar"
            }
        }
        
        tab name="dev" {
            pane split_direction="vertical" {
                pane size="20%" {
                    command "lazygit"
                }
                pane split_direction="horizontal" {
                    pane size="80%" {
                        command "nvim"
                        args "."
                    }
                    pane size="20%"
                }
                pane size="30%" {
                    command "opencode"
                }
            }
        }
    }
  '';

  # Create the dev script
  home.file.".local/bin/dev".source = ../config/zellij/dev;
}