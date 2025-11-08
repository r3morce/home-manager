{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "dracula";
      default_shell = "zsh";
      show_startup_tips = false;
      simplified_ui = true;
      pane_frames = true;
      session_serialization = true;
      mouse_mode = true;
      copy_on_select = true;
      copy_command = "wl-copy";
    };

    layouts = {
      default = {
        template = {
          children = [
            {
              size = 1;
              borderless = true;
              plugin = "zellij:compact-bar";
            }
          ];
        };
      };

      dev = {
        template = {
          children = [
            {
              split_direction = "vertical";
              children = [
                {
                  size = "20%";
                  command = "lazygit";
                }
                {
                  split_direction = "horizontal";
                  children = [
                    {
                      size = "80%";
                      command = "nvim";
                      args = [ "." ];
                    }
                    {
                      size = "20%";
                    }
                  ];
                }
                {
                  size = "30%";
                  command = "opencode";
                }
              ];
            }
          ];
        };
      };
    };
  };

  # Create the dev script
  home.file.".local/bin/dev".source = ../config/zellij/dev;
}