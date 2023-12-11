{ config, inputs, lib, pkgs, hostname2, userName, ... }:
{
  imports = [
    ../../modules/de/plasma5.nix
    ./packages.nix
    ./boot.nix
  ];
  networking = {
    hostname = "${hostname2}";
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
    users.${userName} = {
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
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