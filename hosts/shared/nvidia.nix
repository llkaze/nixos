{ config, inputs, lib, pkgs, ... }:
{
  boot = {
    kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_drm" "nvidia-uvm" ];
    kernelParams = [ "nvidia_drm.modeset=1" ];
  };
  hardware.opengl = {
    enable = true; 
    driSupport = true;
    driSupport32Bit = true;
    # extraPackages = with pkgs; [
    # #   intel-media-driver # LIBVA_DRIVER_NAME=iHD
    # #   vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
    #   vaapiVdpau
    #   libvdpau-va-gl
    # ];
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
}