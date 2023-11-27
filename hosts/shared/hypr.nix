{ config, inputs, lib, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      displayManager = {
        greetd = {
            enable = true;
        };
        defaultSession = "hyprland";
      };
      layout = "us";
      libinput = {
        enable = true;
      };
    };
  };
  # xdg = {
  #   portal = {
  #       enable = true;
  #       wlr = {
  #           enable = true;
  #       # extraPortals = [ pkgs.xdg-desktop-portal-gtk ]
  #       };
  #   };
  # };
  programs = {
    hyprland = {
      enable = true;
      nvidiaPatches = true;
      xwayland = {
        enable = true;
      };
    };  
  };
  environment = {
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
    systemPackages = with pkgs; [
      dunst
      fuzzel
      grim
      hyprpicker
      networkmanagerapplet
      slurp
      swww
      waybar
      wl-clipboard
      xdg-user-dirs
      xdg-utils
      # gvfs
      # tumbler
    ];
  };
}