{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Adrien5902";
        email = "adrien.m5902@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };

}

