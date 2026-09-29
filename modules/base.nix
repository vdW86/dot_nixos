{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    wl-clipboard
    p7zip

    fastfetch
    speedtest-cli

    brightnessctl

  ];

  services.udisks2.enable = true;

  security.polkit.enable = true;
}
