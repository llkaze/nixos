{
  description = "A flake for managing multiple system configurations";

  inputs = {
    unstable = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    stable = {
      url = "github:NixOS/nixpkgs/release-23.05";
    };
    nixpkgs.follows = "unstable"; # define which branch you want to use for nixpkgs
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs"
    };
    eww = {
      url = "github:elkowar/eww";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    hyprland = {
      url = "github:vaxerski/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.hyprland.follows = "nixpkgs";
    };
    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.hyprland.follows = "nixpkgs";
    };
    nix-colors = {
      url = "github:Misterio77/nix-colors";
    };
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.flake-parts.follows = "flake-parts";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs"
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix" # generate ssh-key: ssh-keygen -q -N "" -t ed25519 -f ~/.ssh/id_ed25519_for_nixos, generate new sops key from private ssh key: nix run nixpkgs#ssh-to-age -- -private-key -i ~/.ssh/id_ed25519_for_nixos > ~/.config/sops/age/keys.txt
      inputs.nixpkgs.follows = "nixpkgs";
    };
    utils = {
      url = "github:gytis-ivaskevicius/flake-utils-plus"
    };
  };

  outputs = { self, nixpkgs, anyrun, darwin, eww, home-manager, homebrew-bundle, homebrew-cask, homebrew-core, hyprland, hyprland-contrib, hyprland-plugins, hyprpaper, hyprpicker, nix-colors, nix-gaming, nix-homebrew, nixos-wsl, nur, sops-nix, stable, unstable, utils, }@inputs: utils.lib.mkFlake {
    inherit self inputs;
    # Channel definitions.
    # Channels are automatically generated from nixpkgs inputs
    # e.g the inputs which contain `legacyPackages` attribute are used.
    channelsConfig = { allowUnfree = true; }; # allowBroken = true; allowInsecure = true;

    ### Hosts ###
    let
      username = "lin"; # username shared across each host
      Hostname1 = "luffy";
      Hostname2 = "franky";
    in

    # Modules shared between all hosts
    hostDefaults = {
      system = "x86_64-linux";
      modules = [
        ./hosts/shared/default/configuration.nix
        ./hosts/shared/default/packages.nix
        home-manager.nixosModules.home-manager
      ];
      channelName = "nixpkgs";
      # extraArgs = { inherit foo = "foo"; }; pass arguments on to all hosts with this
    };

    # Main machine using unstable channel
    hosts.${Hostname1} = {
      system = "x86_64-linux";
      # channelName = "unstable"; # unneccessary because it will use the channel defined by nixpkgs
      modules = [
        ./hosts/host1/default.nix
      ];
      # extraArgs = { abc = 123; }; # Extra arguments to be passed to the modules
      # specialArgs = { thing = "abc"; }; # These are not part of the module system, so they can be used in `imports` lines without infinite recursion
    };
    # Machine using stable channel; lightweight; sane defaults
    # hosts.zoro = {
    #   let 
    #     host-name = "zoro";
    #   in
    #   system = "x86_64-linux";
    #   channelName = "stable";
    #   modules = [
    #     ./hosts/zoro/default.nix
    #   ];
    # };
    # # Machine with nix-darwin arm-based system; mac
    # hosts.nami = {
    #   let 
    #     host-name = "nami";
    #   in
    #   system = "aarch64-darwin";
    #   output = "darwinConfigurations";
    #   builder = darwin.lib.darwinSystem;
    #   channelName = "stable";
    #   modules = [
    #     /hosts/nami/default.nix
    #   ];
    # };
    # # Machine with nix-darwin on linux
    # hosts.usopp = {
    #   let 
    #     host-name = "usopp";
    #   in
    #   system = "x86_64-darwin";
    #   output = "darwinConfigurations";
    #   builder = darwin.lib.darwinSystem;
    #   channelName = "stable";
    #   modules = [
            # home-manager.darwinModules.home-manager
            # nix-homebrew.darwinModules.nix-homebrew
    #     ./hosts/usopp/default.nix
    #   ];
    # };
    # # Machine with nix-wsl
    # hosts.sanji = {
    #   let 
    #     host-name = "sanji";
    #   in
    #   modules = [
    #     ./hosts/sanji/default.nix
    #   ];
    # };
    # # Servers
    # hosts.robin-main = {
    #   let
    #     host-name = "robin-main";
    #   in
    #   channelName = "stable";
    #   modules = [
    #     ./hosts/robin-main/default.nix
    #   ];
    # }; 
    # Virtual machine using qemu
    hosts.${Hostname2} = {
      modules = [
      ./hosts/host2/default.nix
      ];
    };
  };
}