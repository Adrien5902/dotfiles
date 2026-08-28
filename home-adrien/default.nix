{
  inputs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.beta
    ./home.nix
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
    ./packages.nix
  ];
}
