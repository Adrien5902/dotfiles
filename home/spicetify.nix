{ inputs, pkgs, ... }: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  programs.spicetify =
    let
      system = pkgs.stdenv.system;
      spicePkgs = inputs.spicetify-nix.legacyPackages.${system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        playNext
      ];

      theme = {
        name = "SpicetifyCat";
        src = inputs.spicetify-cat;
      };
      colorScheme = "Stray";
    };
}
