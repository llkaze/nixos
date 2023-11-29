{ config, inputs, lib, pkgs, ... }:
{
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
    inputs.nix-gaming.nixosModules.steamCompat
    inputs.nix-gaming.nixosModules.proton-ge
    ../shared/DE-WM/hypr.nix
    ../shared/nvidia.nix
    ../shared/fonts.nix
    ../shared/pipewire.nix
    ../shared/virt
    ../shared/wireguard
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
    jellyfin = {
      enable = true; # sudo mkdir /media && sudo chown $USER: /media
    };
    mullvad-vpn = {
      enable = true;
    };
  };
  programs = {
    steam = {
      enable = true;
      extraCompatPackages = [
        inputs.nix-gaming.packages.${pkgs.system}.proton-ge
      ];
    };
  };
  system = {
    # activationScripts = {};
    stateVersion = "23.11";
  };
}