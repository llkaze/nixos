{ config, inputs, lib, pkgs, ... }:
{
  imports = [ 
    inputs.home-manager.nixosModules.home-manager
    inputs.anyrun.homeManagerModules.default
  ];
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
  xdg = {
    portal = {
        enable = true;
  #       wlr = {
  #           enable = true;
  #       # extraPortals = [ pkgs.xdg-desktop-portal-gtk ]
  #       };
    };
  };
  security = {
    polkit = {
      enable = true;
    };
  };
  environment = {
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      QT_QPA_PLATFORM = "wayland";
      NIXOS_OZONE_WL = "1";
    };
    etc = {};
    systemPackages = with pkgs; [ #TODO add impertanence for declarative filesystem
      grim
      hyprpaper
      hyprpicker
      libsForQt5.polkit-kde-agent
      networkmanagerapplet
      pavucontrol
      slurp
      udiskie
      wl-clipboard
      xdg-user-dirs
      xdg-utils
      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
      # gvfs
      # tumbler
    ];
  };
  home-manager = {
    useGlobalPkgs = true;
    users.${username} = {
      wayland = {
        windowManager = {
          hyprland = {
            enable = true;
            enableNvidiaPatch = true;
            xwayland = {
              enable = true;
            };
            plugins = [
              inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
            ];
          };
        };
      };
      services = {
        dunst = {
          enable = true;
        };
      };
      programs = {
        eww = {
          enable = true;
        };
        anyrun = {
          enable = true;
          package = inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins;          
          config = {
            plugins = [
              # An array of all the plugins you want, which either can be paths to the .so files, or their packages
              # "${inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins}/lib/kidex"
            ];
            width = { fraction = 0.3; };
            position = "top";
            verticalOffset = { absolute = 0; };
            hideIcons = false;
            ignoreExclusiveZones = false;
            layer = "overlay";
            hidePluginInfo = false;
            closeOnClick = false;
            showResultsImmediately = false;
            maxEntries = null;
          };
          extraCss = #TODO add more builtins including builtins.readFile ./style.css;
          ''
            .some_class {
              background: red;
            }
          '';
          extraConfigFiles."some-plugin.ron".text = ''
            Config(
              // for any other plugin
              // this file will be put in ~/.config/anyrun/some-plugin.ron
              // refer to docs of xdg.configFile for available options
            )
          '';
        };
      };
    };
  };
}