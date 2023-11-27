{ config, inputs, lib, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      displayManager = {
        lightdm = {
          enable = true;
          greeters = {
            gtk = {
              enable = false;
            };
            mini = {
              enable = true;
              user = "lin";
              extraConfig = ''
                [greeter]
                show-password-label = false
                [greeter-theme]
                background-image = ""
              '';
            };
          };
        };
        defaultSession = "xfce";
      };
      desktopManager = {
        xfce = {
          enable = true;
          enableScreensaver = false;
          # enableXfwm = false;
          # noDestop = true;
        };
      };
      layout = "us";
      libinput = {
        enable = true;
      };
    };
  };
  environment = {
    xfce.excludePackages = with pkgs.xfce; [
      mousepad # text edit
      parole # img 
      ristretto # media player
      thunar
      # xfce4-appfinder
      xfce4-taskmanager
      xfce4-terminal
    ];
  };  
}