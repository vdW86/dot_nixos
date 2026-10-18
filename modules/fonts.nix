{ pkgs, ... }:

{
  fonts.packages = with pkgs; [

    fira-code
    jetbrains-mono

    font-awesome

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    
    source-code-pro
  ];
}
