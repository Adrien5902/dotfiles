{
  inputs,
  ...
}:
{
  home.username = "adrien";
  home.stateVersion = "26.05";
  imports = [
    inputs.zen-browser.homeModules.beta
    ./kitty.nix
    ./rofi.nix
    # ./waybar.nix
    ./starship.nix
    ./fish.nix
    ./session-path.nix
    ./wallpaper.nix
    ./zen-browser
    ./git.nix
    ./gh.nix
    ./cursor.nix
    ./packages.nix
  ];

  home.file.".config/hypr/hyprland.lua".source = ./hyprland/hyprland.lua;
  home.file.".config/hypr/lua".source = ./hyprland/lua;
  home.file.".config/hypr/hypridle.conf".source = ./hyprland/hypridle.conf;
  home.file.".config/hypr/xdph.conf".source = ./hyprland/xdph.conf;
}
