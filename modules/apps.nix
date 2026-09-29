{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    firefox

    mpv
    celluloid

    pinta

    swayimg

    cheese

    grim
    slurp

    abiword
    gnumeric

    galculator

    zathura

    geany

    keepassxc

    calibre

  ];
}
