{ ... }:
{
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";

  programs.git.enable = true;

  programs.bash = {
    enable = true;

    bashrcExtra = builtins.readFile ../dotfiles/bash/bash_extra.sh;
};


  home.file.".config/fastfetch".source =
    ../dotfiles/fastfetch;

  home.file.".config/foot".source =
    ../dotfiles/foot;

  home.file.".config/dunst".source =
    ../dotfiles/dunst;

  home.file.".config/waybar".source =
    ../dotfiles/waybar;

  home.stateVersion = "26.05";
}
