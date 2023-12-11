{ config, inputs, lib, pkgs, hostname1, userName ... }:
{
  imports = [
    inputs.nix-gaming.nixosModules.steamCompat
    inputs.nix-gaming.nixosModules.proton-ge
    ../../modules/firefox.nix
    ../../modules/fonts.nix
    ../../modules/main-user.nix
    ../../modules/nvidia.nix
    ../../modules/pipewire.nix
    ../../modules/security.nix
    ../../modules/wireguard.nix
    ../../modules/WM/hypr.nix
    ./packages.nix
    ./boot.nix
  ];
  special = {
    hypr.enable = true;
    nvidia.enable = true;
    wireguard.enable = true;
    pipewire.enable = true;
    firefox = {
      enable = true;
      enableBetterfox = true;
      enablePolicies = true;
    };
  };
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
    users.${userName} = {
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
      ];
    };
  };
  time = {
    hardwareClockInLocalTime = true; # for dual booting with windows 
  };
  hardware = {
    enableAllFirmware = true;
    cpu = {
      intel = {
        updateMicrocode = true;
      };
      # amd = {
      #   updateMicrocode = true;
      # };
    };
    bluetooth = {
      enable = true;
      package = pkgs.bluez;
    };
  };
  security = {
    sudo = {
      wheelNeedsPassword = false;
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
    tailscale = {
      enable = true;
    };
  };
  programs = {
    steam = {
      enable = true;
      extraCompatPackages = [
        inputs.nix-gaming.packages.${pkgs.system}.proton-ge
        pkgs.mangohud
      ];
    };
  };
  virtualisation = {
    libvirtd = {
      enable = true;
    };
    spiceUSBRedirection = {
      enable = true;
    };
  };
  programs = {
      virt-manager = {
      enable = true;
    };
  };
  system = {
    # activationScripts = {};
    stateVersion = "23.11";
  };
}