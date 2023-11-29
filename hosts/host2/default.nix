{ config, inputs, lib, pkgs, ... }:
{
  imports = [
    ../shared/DE-WM/xfce4.nix
    ./packages.nix
    ./boot.nix
  ];
  networking = {
    hostname = "${hostname1}";
    networkmanager = {
      enable = true;
      # wifi = {
      #   backend = "iwd";
      # };
    };
    firewall = {
      enable = true;
      allowPing = true;
      # allowedUDPPorts = [ ];
      # allowedTCPPorts = [ ];
    };
  };
  nix = {
    gc = {
      automatic = true; # only for systems with enough cpu resources
    };
    settings = {
      auto-optimise-store = true; # only for system with ssd; enough cpu resources
    };
  };
  users = {
    users = {
      ${username} = {
        isNormalUser = true;
        createHome = true;
        description = "user";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        group = "users";
        home = "/home/${username}";
        # shell = pkgs.zsh # enable zsh as default shell for user
        # password = "nixos"; # change with passwd or using nano/vim
      };
    };
  };
  time = {
    hardwareClockInLocalTime = true; # for dual booting with windows 
  };
  hardware = {
    enableAllFirmware = true;
    bluetooth = {
      enable = true;
      package = pkgs.bluez;
    };
  };
  services = {
    blueman = {
      enable = true;
    };
    flatpak = {
      enable = true;
    };
    printing = {
      enable = true;
    };
    spice-vdagentd = {
     enable = true; # qemu specific
    };
    qemuGuest = {
     enable = true; # qemu specific
    };
  };
  system = {
    # activationScripts = {};
    stateVersion = "23.11";
  };
}