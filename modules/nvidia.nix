{ config, inputs, lib, pkgs, ... }:
let
  cfg = config.special.nvidia;
in
{
  options.special.nvidia = {
    enable = lib.mkEnableOption "enable nvidia module";
  };
  config = lib.mkIf cfg.enable {
    boot = {
      kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_drm" "nvidia-uvm" ];
      kernelParams = [ "nvidia_drm.modeset=1" "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];
    };
    hardware.opengl = {
      enable = true; 
      driSupport = true;
      driSupport32Bit = true;
    };
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta; # 545
    };
  };
}