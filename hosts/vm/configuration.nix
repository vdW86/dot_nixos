{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/base.nix
    ../../modules/networking.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "nixos-vm";

  users.users.kevin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  system.stateVersion = "26.05";
}
