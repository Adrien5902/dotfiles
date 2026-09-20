{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      # (config.lib.nixGL.wrap xdg-desktop-portal-hyprland)
      # xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
    configPackages = [
      # pkgs.hyprland
    ];
    config = {
      hyprland.default = [
        "hyprland"
        "gtk"
      ];
    };
  };

  home.packages = with pkgs; [ hyprland-preview-share-picker ];
}
