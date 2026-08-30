{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../modules/common.nix
  ];

  networking.hostName = "unowhynotarch"; # Define your hostname.
}
