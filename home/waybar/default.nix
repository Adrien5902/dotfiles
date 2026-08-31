{ hostname, lib, ... }:
let
  modulesDir = ./modules;
  modules = builtins.listToAttrs (
    map (file: {
      name = lib.removeSuffix ".nix" (lib.removePrefix "${toString modulesDir}/" (toString file));
      value = import file;
    }) (lib.filesystem.listFilesRecursive modulesDir)
  );

  hostSettingsFile = ./${hostname}.nix;
in
{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings =
      let
        imports = { inherit modules; };
      in
      if builtins.pathExists hostSettingsFile then
        import hostSettingsFile imports
      else
        [ (import ./common.nix imports) ];
  };

  xdg.configFile."waybar/assets".source = ./assets;
}
