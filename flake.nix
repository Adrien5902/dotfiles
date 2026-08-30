{
  description = "Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    adrien5902s-hyprcursors = {
      url = "github:Adrien5902/hyprcursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-cat = {
      url = "github:Adrien5902/SpicetifyCat";
      flake = false;
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      mkHost =
        hostname:
        nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./hosts/${hostname}

            home-manager.nixosModules.home-manager

            {
              home-manager = {
                backupFileExtension = "backup";
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };

                users.adrien = import ./hosts/${hostname}/home.nix;
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        archrien = mkHost "archrien";
        unowhy = mkHost "unowhy";
      };
    };
}
