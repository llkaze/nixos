{config, inputs, lib, pkgs, ...}:
{
  hardware = {
    pulseaudio = {
      enable = false; # to support pipewire
    };
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
    lowLatency = {
      # enable this module
      enable = true;
      # defaults (no need to be set unless modified)
      quantum = 64;
      rate = 48000;
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
}