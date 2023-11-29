{ config, inputs, lib, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      # aichat
      # pywal   # alt: matugen
      ani-cli
      aria
      asciiquarium-transparent
      bitwarden
      bottles
      bottom
      brightnessctl
      calibre
      cartridges
      cmatrix
      ddgr
      drawio
      etcher
      feh   # alt: imv
      gimp-with-plugins
      glances
      glow
      krabby  # alt: pokeget-rs
      libreoffice
      lutris
      moonlight-qt
      ncspot  # alt: mpd ncmpcpp psst
      nitter
      nomacs
      obsidian
      openai-whisper
      piper
      pipes-rs
      pspp
      qbittorrent
      rustdesk
      sct
      sl
      sniffnet
      # sunshine
      thunderbird
      tldr
      ttyper
      ungoogled-chromium
      via
      vlc
      webcord-vencord
      wine
      winetricks
      youtube-tui
      yt-dlp
      zathura
    ];
  };
}