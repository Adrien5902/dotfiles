{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../modules/core.nix
  ];

  networking.hostName = "unowhynotarch"; # Define your hostname.
}
