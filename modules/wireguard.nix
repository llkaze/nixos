{config, inputs, lib, pkgs, ...}:
let
  cfg = config.special.wireguard;
in
{
  options.special.wireguard = {
    enable = lib.mkEnableOption "enable nvidia module";
  };
  config = lib.mkIf cfg.enable {  
    network = {
      wg-quick = {
        interfaces = {
          wg0 = {
            configFile = "/etc/wireguard/wg0.conf";
            listenPort = 51820;
            autostart = true;
          };
        };
      };
    };
    boot = {
      extraModulePackages = with config.boot.kernelPackages; [ wireguard ];
    };
  };
}