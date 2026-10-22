{ pkgs, ... }: {
  home.packages = with pkgs; [ gpu-usage-waybar ];
}
