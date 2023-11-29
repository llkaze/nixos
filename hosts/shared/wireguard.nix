{config, inputs, lib, pkgs, ...}:
{
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
}