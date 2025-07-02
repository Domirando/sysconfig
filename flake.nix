{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    espanso-fix.url = "github:pitkling/nixpkgs/espanso-fix-capabilities-export";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    espanso-fix,
    flake-utils,
    home-manager,
    ...
  } @ inputs: let 
    outputs = self;
    in
        flake-utils.lib.eachDefaultSystem (
          system: let 
            pkgs = nixpkgs.legacyPackages.${system};
          in 
            {
              devShells.default = import ./shell.nix pkgs;
            }
        )
  {
    homeModules = import ./modules/home;
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        espanso-fix.nixosModules.espanso-capdacoverride
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.domirando = {
            imports = [./home.nix];
          };
        }
      ];
    };
  };
}
