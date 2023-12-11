{ config, inputs, lib, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      vim
      cmake
      croc
      ddh
      direnv
      duf
      eza
      fd
      fet-sh   # alt: neofetch fastfetch pfetch-rs nitch
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
      pciutils
      ripgrep
      sops
      speedtest-go  # alt: speedtest-rs
      tldr
      unzip
      w3m
      wget
      yazi   # alt: nnn fff mc ranger fm pcmanfm
      zoxide
    ];
  };
}