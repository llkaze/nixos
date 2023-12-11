{ config, inputs, lib, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      # aichat
      # pywal   # alt: matugen
      asciiquarium-transparent
      sl
    ];
  };
}