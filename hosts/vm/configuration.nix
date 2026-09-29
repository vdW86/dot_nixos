{ config, pkgs, ... }:

{
  imports = [
    ../../modules/base.nix
    ../../modules/networking.nix
    ../../modules/bluetooth.nix
    ../../modules/fonts.nix
    ../../modules/hyprland.nix
    ../../modules/apps.nix
    ../../modules/autologin.nix
  ];

  networking.hostName = "nixos-vm";

  time.timeZone = "Europe/Amsterdam";
  
  i18n.defaultLocale = "nl_NL.UTF-8";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.kevin = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
 initialPassword  = "nixos";
  };

  system.stateVersion = "26.05";
}
