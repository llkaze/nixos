{config, inputs, lib, pkgs, ...}:
let
  cfg = config.special.pipewire;
in
{
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency 
  ];
  options.special.pipewire = {
    enable = lib.mkEnableOption "enable pipewire module";
  };
  config = mkIf cfg.enable {
    hardware = {
      pulseaudio = {
        enable = false; # to support pipewire
      };
    };
    services.pipewire = {
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
      lowLatency = {
        # enable this module
        enable = true;
        # defaults (no need to be set unless modified)
        # quantum = 64;
        # rate = 48000;
      };
    };
    sound = {
      enable = true;
    };
    security = {
      rtkit = {
        enable = true;
      };
    };
  };
}