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
      feh
      ffmpeg
      file
      fzf
      gcc
      gnumake
      htop
      jq
      lshw
      nix-tree
      os-prober
      pfetch-rs
      ranger  # alt: mc nnn fm pcmanfm
      ripgrep
      sops
      speedtest-go  # alt: speedtest-rs
      unzip
      w3m
    ];
  };
}