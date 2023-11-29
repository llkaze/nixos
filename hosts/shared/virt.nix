{config, inputs, lib, pkgs, ...}:
{
  users.users.${username}.extraGroups = [ "libvirtd" ];
  virtualisation = {
    libvirtd = {
      enable = true;
    };
    spiceUSBRedirection = {
      enable = true;
    };
  };
  programs = {
      virt-manager = {
      enable = true;
    };
  };
}