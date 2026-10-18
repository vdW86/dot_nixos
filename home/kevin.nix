{ ... }:

{
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";

  programs.git.enable = true;
  programs.bash.enable = true;

  home.file.".config/fastfetch".source =
    ../dotfiles/fastfetch;

  home.file.".config/foot".source =
    ../dotfiles/foot;

  home.stateVersion = "26.05";
}
