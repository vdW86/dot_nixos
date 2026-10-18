{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    wl-clipboard
    p7zip

    brightnessctl

  ];

  services.udisks2.enable = true;

  security.polkit.enable = true;
}
