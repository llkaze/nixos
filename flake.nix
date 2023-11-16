{
  description = "System flake";
  inputs = {
    nixpkgs = {
        url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    nur = {
        url = "github:nix-community/NUR";
    };
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs"; 
    };
    hyprland = {
        url = "github:vaxerski/Hyprland";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem { # hostname default nixos
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.users.lin = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home
          }
        ];
      };
    };
  };
}