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
    ./hyprpaper.nix
    ./zen-browser
    ./git.nix
    ./gh.nix
    ./cursor.nix
    ./packages.nix
  ];
}
