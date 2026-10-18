{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  xdg.portal.enable = true;

  environment.systemPackages = with pkgs; [

    foot
    kitty

    fuzzel

    dunst

    imagemagick
    libnotify

    swaybg
    swayidle
    swaylock

    waybar
    
    thunar
    thunar-volman
    thunar-archive-plugin

    xdg-desktop-portal-hyprland
  ];
}
