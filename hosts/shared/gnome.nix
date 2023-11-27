{ config, inputs, lib, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      displayManager = {
        gdm = {
          enable =  true;
          wayland = true;
          # settings = ;
        };
        defaultSession = "gnome";
        # defaultSession = "gnome-xorg";
      };
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
      layout = "us";
      libinput = {
        enable = true;
      };
    };
  };
  environment = {
    gnome.excludePackages = (with pkgs; [
      # baobab # disk usage analyzer
      evince # document viewer
      # gnome-connections # remote desktop client
      gnome-console
      # gnome-extension-manager
      gnome-photos
      # gnome-text-editor
      gnome-tour
      # gnome-usage # view disks
      gnome-user-docs
    ]) ++ (with pkgs.gnome; [
      cheese # webcam utility
      eog # img
      epiphany # web browser
      # file-roller # archive manager
      geary # mail client
      # gnome-calculator
      gnome-calendar
      # gnome-characters # find and inser unusual characters
      gnome-clocks
      gnome-contacts
      # gnome-font-viewer
      # gnome-logs # log viewer for systemd logs
      gnome-maps
      gnome-music
      gnome-software
      # gnome-system-monitor
      gnome-weather
      # nautilus # file manager
      # seahorse # key and password manager
      # simple-scan # document scanner utility
      totem # movie player
      yelp # help
    ]);
    sessionVariables = {
      NIXOS_OZONE_WL = "1"; # wayland
    };
  };  
}