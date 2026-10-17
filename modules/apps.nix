{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    firefox
    qutebrowser

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

    git
    tree
    jq
    mc

    bitwarden

    syncthing

    yt-dlp

    nmap
    iotop
    lshw
    nvme-cli

    android-tools

    thunar
    thunar-volman
    thunar-archive-plugin

  ];
}
