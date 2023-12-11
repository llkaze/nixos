{ config, inputs, lib, pkgs, ... }:
{
  imports = [
    inputs.lobster.packages.nixosModules.lobster
  ];
  environment = {
    systemPackages = with pkgs; [
      # aichat
      # pywal   # alt: matugen
      # sunshine
      ani-cli
      aria
      asciiquarium-transparent
      bitwarden
      bottles
      bottom
      brightnessctl
      browsh
      calcure
      calibre
      cartridges
      cmatrix
      ddgr
      distrobox
      drawio
      etcher
      feh   # alt: imv
      gdrive3
      gimp-with-plugins
      glances
      glow
      krabby  # alt: pokeget-rs
      lemmeknow
      libreoffice
      libsForQt5.dolphin
      lutris
      mangal
      moonlight-qt
      mosh
      navi  # alt: hoarder
      ncspot  # alt: mpd ncmpcpp psst spotify-tui
      nitter
      nomacs
      obsidian
      openai-whisper
      ouch
      pfetch-rs
      piper
      pipes-rs
      playerctl
      pspp
      qbittorrent
      ripdrag
      rmtrash
      rustdesk
      sct
      sl
      sniffnet
      steam-tui
      sunshine
      thunderbird
      ttyper
      ungoogled-chromium
      via
      vlc
      webcord-vencord
      wiki-tui
      wine
      winetricks
      youtube-tui
      yt-dlp
      zathura
      inputs.lobster.packages.${pkgs.system}.lobster
    ];
  };
}