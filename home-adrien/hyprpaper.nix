{ pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/wallpapers/miku.png"
      ];
      wallpaper = [
        {
          monitor = "";
          path = "~/wallpapers/miku.png";
        }
      ];
    };
  };

}

