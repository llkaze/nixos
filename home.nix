{ config, inputs, lib, pkgs, user, ... }: # to-do fix functions
{
  home = {
      homeDirectory = "/home/lin";
      stateVersion = "23.11";
      username = "lin";
  };
  programs = {
    # zsh = {
    #   enable = true;
    #   oh-my-zsh = {
    #     enable = true;
    #   };
    #   autosuggestions = {
    #     enable = true;
    #   };
    # };
    eww = {
      enable = false; # currently using waybar
    };
    firefox = {
      enable = true;
      profiles = {
        generic = {
          id = 0;
          name = "generic";
        };
      };
    };
    git = {
      enable = true;
      userEmail = "x@x.com";
      userName = "x";
    };
    lazygit = {
      enable = true;
    };
    mpv = {
      enable = true;
    };
    neovim = {
      enable = true;
    };
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
      ];
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
      # enableZshIntegration = true;
      settings = {
        # add_newline = false;
        # character = {
        #   success_symbol = "[➜](bold green)";
        #   error_symbol = "[➜](bold red)";
        # };
        # package.disabled = true;
      };
    };
    tmux = {
      enable = true;
    };
    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
    waybar = {
      enable = true;
    };
    wezterm = {
      enable = true;
      enableBashIntegration = true;
      # enableZshIntegration = true;
    };
    wofi = {
      enable = true;
    };
  };
  services = {
    dunst = {
      enable = true;
    };
  };
  home.file."/etc/firefox/policies/policies.json".source = ./dots/firefox/policies.json;
  home.file.".config/monitors.xml".source = ./dots/gnome/monitors.xml;
}
