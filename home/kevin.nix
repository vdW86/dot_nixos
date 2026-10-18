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
    ../dotfiles/config/fastfetch;

  home.file.".config/foot".source =
    ../dotfiles/config/foot;

  home.file.".config/dunst".source =
    ../dotfiles/config/dunst;

  home.file.".config/waybar".source =
    ../dotfiles/config/waybar;

  home.file.".config/hypr/auto_lock.sh".source =
    ../dotfiles/scripts/auto_lock.sh;

  home.stateVersion = "26.05";
}
