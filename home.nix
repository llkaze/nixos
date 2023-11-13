{ inputs, ... }@flakeContext:
{ config, lib, pkgs, ... }: {
  config = {
    home = {
      homeDirectory = "/home/lin";
      stateVersion = "23.05";
      username = "lin";
    };
    programs = {
      eww = {
        enable = false; # currently using waybar
      };
      firefox = {
        enable = true;
        profiles = {
          lin = {
            id = 0;
            name = "lin";
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
        plugins = pkgs.obs-studio-plugins.wlrobs;
      };
      starship = {
        enable = true;
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
      wofi = {
        enable = true;
      };
    };
    services = {
      dunst = {
        enable = true;
      };
    };
  };
}
