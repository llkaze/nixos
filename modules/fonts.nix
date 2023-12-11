{ config, inputs, lib, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
        freetype
    ];
  };
  fonts = {
    fontDir = {
      enable = true;
    };
    packages = with pkgs; [
      corefonts
      font-awesome
      google-fonts
      iosevka-comfy.comfy-wide-fixed # preferred terminal font
      maple-mono
      nerdfonts
      vistafonts
    ];
  };
}