{ config, inputs, lib, pkgs, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "~/.config/sops/age/keys.txt";
  };
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
    };
  };
  time = {
    timeZone = "Europe/Amsterdam";
  };
  i18n = {
    defaultLocale = "en_US.UTF-8"; # locales https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  };
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}