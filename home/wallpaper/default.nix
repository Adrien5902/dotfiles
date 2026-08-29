{
  home.file."wallpapers".source = ./wallpapers;

  services.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = "~/wallpapers";
      };
    };
  };
}
