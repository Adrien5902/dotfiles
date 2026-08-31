{ pkgs, ... }:
{
  programs.steam = {
    enable = true;

    # Optional, but useful for compatibility
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  environment.systemPackages = with pkgs; [
    heroic
  ];

  services.flatpak.packages = [
    "org.vinegarhq.Sober"
  ];
}
