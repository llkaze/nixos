{ config, inputs, lib, pkgs, ... }:
{
  virtualisation = {
    podman = {
      enable = true;
      enableNvidia = true;
      autoPrune.enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
    };
    oci-containers = {
      backend = "podman";
      containers = {
        jellyfin = 
      };
    };
  };
}