{ config, ,inputs, lib, pkgs, userName, ... }:
{
  users.users.${userName} = {
    description = "main-user";
    password = "";
    isNormalUser = true;
    createHome = true;
    home = "/home/${userName}";
    shell = pkgs.zsh; # pkgs.bashInteractive pkgs.fish
  };
}