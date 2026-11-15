{ pkgs, inputs, ... }:
{
  programs.steam = {
    enable = true;

    # Optional, but useful for compatibility
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  environment.sessionVariables = {
  	__GL_THREADED_OPTIMIZATIONS = 0;
  };

  environment.systemPackages = with pkgs; [
    satisfactorymodmanager
    heroic
    pandora-launcher
    inputs.parsecgaming.packages.x86_64-linux.parsecgaming
  ];
}
