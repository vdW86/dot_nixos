{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  xdg.portal.enable = true;

  environment.systemPackages = with pkgs; [

    foot

    fuzzel

    dunst

    imagemagick
    libnotify

    swaybg
    swayidle
    swaylock

    waybar

    xdg-desktop-portal-hyprland
  ];
}
