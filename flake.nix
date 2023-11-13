{
  description = "Basic flake";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";
    home-manager.url = "flake:home-manager";
    nimble.url = "flake:nimble";
  };
  outputs = inputs:
    let
      flakeContext = {
        inherit inputs;
      };
    in
    {
      homeModules = {
        home = import ./homeModules/home.nix flakeContext;
      };
      nixosConfigurations = {
        nixos = import ./nixosConfigurations/nixos.nix flakeContext;
      };
    };
}
