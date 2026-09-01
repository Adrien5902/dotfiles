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
    waybar-weather = {
      url = "github:wneessen/waybar-weather";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    kdeconnect_waybar.url = "github:Adrien5902/kdeconnect_waybar";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      featuresModule = import ./features.nix;

      mkHosts =
        hostnames:
        builtins.listToAttrs (
          map (hostname: {
            name = hostname;
            value =
              let
                hostTags = import ./hosts/${hostname}/tags.nix;
                enabledFeatures = featuresModule.enabledFeatures hostTags;
                specialArgs = {
                  inherit
                    inputs
                    featuresModule
                    hostname
                    hostTags
                    system
                    ;
                };
              in
              nixpkgs.lib.nixosSystem {
                inherit system specialArgs;

                modules = [
                  ./hosts/${hostname}

                  home-manager.nixosModules.home-manager

                  {
                    networking.hostName = hostname;
                    system.stateVersion = "26.11";

                    home-manager = {
                      backupFileExtension = "backup";
                      useGlobalPkgs = true;
                      useUserPackages = true;
                      extraSpecialArgs = specialArgs;

                      users.adrien = {
                        imports = builtins.filter (home: home != null) (map (feature: feature.home) enabledFeatures);
                      };
                    };
                  }
                ]
                ++ builtins.filter (module: module != null) (map (feature: feature.module) enabledFeatures);
              };
          }) hostnames
        );
    in
    {
      nixosConfigurations = mkHosts [
        "archrien"
        "unowhynotarch"
      ];
    };
}
