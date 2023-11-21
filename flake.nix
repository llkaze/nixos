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
    ags = {
      url = "github:Aylur/ags";
    };
  };
  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem { # hostname default nixos
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hardware-configuration.nix
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              #  extraSpecialArgs = { inherit inputs; }; # defined twice?
              users.lin = import ./home.nix;
            };
          }
        ];
      };
    };
  };
}
