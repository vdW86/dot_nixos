{ ... }:

{
############################################## 
 # Basis gebruikersinformatie
##############################################
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";
##############################################
  # Git configuratie
##############################################
  programs.git.enable = true;
##############################################
  # Bash configuratie
##############################################
  programs.bash = {
    enable = true;

    bashrcExtra = builtins.readFile ../dotfiles/bash/bash_extra.sh;
};
##############################################
  # Configuratiebestanden uit dotfiles/config
##############################################
  home.file.".config/fastfetch".source =
    ../dotfiles/config/fastfetch;

  home.file.".config/foot".source =
    ../dotfiles/config/foot;

  home.file.".config/dunst".source =
    ../dotfiles/config/dunst;

  home.file.".config/waybar".source =
    ../dotfiles/config/waybar;

  home.file.".config/hypr".source =
    ../dotfiles/config/hypr;

  home.file.".config/swaylock".source =
    ../dotfiles/config/swaylock;
##############################################
  # Dotfiles structuur
##############################################
  home.file."dotfiles/scripts".source = ../dotfiles/scripts;
  home.file."dotfiles/themes".source = ../dotfiles/themes;
  home.file."dotfiles/backgrounds".source = ../dotfiles/backgrounds;
##############################################
  # Home Manager versie
##############################################
  home.stateVersion = "26.05";
##############################################
}
