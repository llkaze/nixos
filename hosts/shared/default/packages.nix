{ config, inputs, lib, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      vim
      wget
      cmake
      croc
      direnv
      duf
      eza
      fd
      ffmpeg
      file
      fzf
      gcc
      gnumake
      htop
      jq
      lshw
      nitch
      nix-tree
      os-prober
      pfetch-rs   # alt: neofetch fastfetch 
      ranger  # alt: mc nnn fm pcmanfm
      ripgrep
      sops
      speedtest-go  # alt: speedtest-rs
      unzip
      w3m
    ];
  };
}