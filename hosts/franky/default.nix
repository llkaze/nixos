{ config, inputs, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      systemd-boot = {
        enable = true;
        netbootxyz = {
          enable = true;
        };
      };
    };
  };
  networking = {
    networkmanager.enable = true;
    hostName = "${Hostname2}"; # edit this to your liking
  };
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services = {
    xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };
      displayManager.defaultSession = "xfce";
      autorun = true; # run on graphic interface startup
      libinput.enable = true; # touchpad support
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack = {
        enable = true;
      };
      pulse = {
        enable = true;
      };
      wireplumber = {
        enable = true;
      };
    };
    # openssh.settings = {
    #   enable = false;
    #   kexAlgorithms = [ "curve25519-sha256" ];
    #   ciphers = [ "chacha20-poly1305@openssh.com" ];
    #   passwordAuthentication = false;
    #   permitRootLogin = "no"; # do not allow to login as root user
    #   kbdInteractiveAuthentication = false;
    # };
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };
  users.users.${username} = {
    createHome = true;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    # openssh.authorizedKeys.keys = [
    #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBv9RyYuStPdBzst/sO5Uiik9zS6Lu/K98T2PJROMc/r"
    # ];
  };
  environment.systemPackages = with pkgs; [
    
  ];
  system.stateVersion = "23.11";
}