{
  # wallpaper_boygreen=3445801440
  # wallpaper_firefly=3687793845
  services.linux-wallpaperengine = {
    enable = true;
    wallpapers = [
      {
        monitor = "DP-2";
        scaling = "fill";
        wallpaperId = "3241251648"; # strange alleys
      }
      {
        monitor = "HDMI-A-2";
        scaling = "fill";
        wallpaperId = "2850526399"; # stray
      }
    ];
  };
}
