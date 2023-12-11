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
    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # eww = {
    #   url = "github:elkowar/eww";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
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
    impermanence = {
      url = "github:nix-community/impermanence";
    };
    lobster = {
      url = "github:justchokingaround/lobster";
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
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix"; # generate ssh-key: ssh-keygen -q -N "" -t ed25519 -f ~/.ssh/id_ed25519_for_nixos, generate new sops key from private ssh key: nix run nixpkgs#ssh-to-age -- -private-key -i ~/.ssh/id_ed25519_for_nixos > ~/.config/sops/age/keys.txt
      inputs.nixpkgs.follows = "nixpkgs";
    };
    utils = {
      url = "github:gytis-ivaskevicius/flake-utils-plus";
    };
  };

  outputs = { 
    self,
    nixpkgs,
    anyrun,
    chaotic,
    darwin,
    deploy-rs,
    eww,
    home-manager,
    homebrew-bundle,
    homebrew-cask,
    homebrew-core,
    hyprland-contrib,
    hyprland-plugins,
    hyprland,
    hyprpaper,
    hyprpicker,
    impermanence,
    lobster,
    nix-colors,
    nix-gaming,
    nix-homebrew,
    nixos-wsl,
    nur,
    sops-nix,
    stable,
    unstable,
    utils,
  }@inputs: utils.lib.mkFlake {
    inherit self inputs;
    overlays = import ./overlays;
    secrets = import ./secrets;
    userName = "lin";
    hostname1 = "luffy";
    hostname2 = "zoro";

    channelsConfig = { 
      allowBroken = true;
      # allowInsecure = true;
      allowUnfree = true;
      allowUnsupportedSystem = true;
    };

    hostDefaults = {
      system = "x86_64-linux";
      modules = [
        ./hosts/shared/default
        home-manager.nixosModules.home-manager
      ];
      channelName = "nixpkgs";
      # extraArgs = { inherit foo = "foo"; }; pass arguments on to all hosts with this
    };

    # Main machine using unstable channel
    hosts.${hostname1} = {
      # channelName = "unstable"; # unneccessary because it will use the channel defined by nixpkgs
      modules = [
        ./hosts/${hostname1}
      ];
      # extraArgs = { abc = 123; }; # Extra arguments to be passed to the modules
      # specialArgs = { thing = "abc"; }; # These are not part of the module system, so they can be used in `imports` lines without infinite recursion
    };
    hosts.${hostname2} = {
      modules = [
        ./hosts.${hostname2}
      ];
    }
  };
}