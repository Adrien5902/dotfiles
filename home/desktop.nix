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
    ./starship.nix
    ./fish.nix
    ./session-path.nix
    ./wallpaper
    ./zen-browser
    ./git.nix
    ./gh.nix
    ./cursor.nix
    ./packages.nix
    ./spicetify.nix
    ./waybar
    ./obsididan.nix
    ./hyprland.nix
  ];

  home.file.".local/bin".source = ./scripts;
}
