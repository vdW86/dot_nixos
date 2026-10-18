{ ... }:

{
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";

  programs.git.enable = true;

  programs.bash = {
    enable = true;

    bashrcExtra = ''
      source ~/dotfiles/bash/bash_extra.sh
    '';
  };

  home.file.".config/fastfetch".source =
    ../dotfiles/fastfetch;

  home.file.".config/foot".source =
    ../dotfiles/foot;

  home.stateVersion = "26.05";
}
