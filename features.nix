let
  feature =
    {
      tags,
      module ? null,
      home ? null,
    }:
    {
      inherit tags module home;
    };
in
rec {
  hasTags = required: tags: builtins.all (tag: builtins.elem tag tags) required;
  enabledFeatures =
    tags:
    builtins.filter (feature: feature != null) (
      builtins.attrValues (
        builtins.mapAttrs (_: feature: if hasTags feature.tags tags then feature else null) features
      )
    );

  mkTags =
    list:
    builtins.listToAttrs (
      map (name: {
        inherit name;
        value = name;
      }) list
    );

  tags = mkTags [
    "desktop"
    "dev"
    "gaming"
  ];

  features = {
    desktop = feature {
      tags = with tags; [ desktop ];
      module = ./modules/desktop.nix;
      home = ./home/desktop.nix;
    };

    dev = feature {
      tags = with tags; [
        desktop
        dev
      ];
      module = ./modules/dev.nix;
      home = ./home/dev.nix;
    };

    gaming = feature {
      tags = with tags; [
        desktop
        gaming
      ];
      module = ./modules/gaming.nix;
    };

    animated-wallpaper = feature {
      tags = with tags; [
        desktop
        # Requires wallpaper engine, so requires steam
        gaming
      ];
      home = ./home/wallpaper/animated.nix;
    };
  };
}
