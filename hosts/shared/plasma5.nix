{ config, inputs, lib, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      displayManager = {
        sddm = {
          enable =  true;
          enableHidpi = true;
          wayland = true;
          # theme = ;
          # settings = ;
        };
        defaultSession = "plasmawayland";
      };
      desktopManager = {
        plasma5 = {
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
    plasma5.excludePackages = with pkgs.libsForQt5; [
      # ark # archive manager
      elisa # media player 
      gwenview # img 
      # kate # text edit
      khelpcenter
      kinfocenter
      kmenuedit
      konsole
      ksystemstats
      kwallet-pam
      kwalletmanager
      kwrited # text editor documents
      okular # document viewer
      oxygen # widgets
      # plasma-browser-integration
      plasma-systemmonitor
      print-manager
      spectacle # screenshot
    ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1"; # wayland
    };
  };
}